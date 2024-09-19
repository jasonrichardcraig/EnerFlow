using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Services;
using EnerFlow.ViewModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Windows;
namespace EnerFlow.Views
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            // Resolve the MainViewModel
            var mainViewModel = App.ServiceProvider?.GetService<MainViewModel>();
            if (mainViewModel == null)
            {
                throw new InvalidOperationException("Failed to resolve MainViewModel.");
            }

            InitializeComponent();

            DataContext = mainViewModel;

            mainViewModel.IsBusy = true;

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var dataService = App.ServiceProvider?.GetService<IDataService>();
            var dialogService = App.ServiceProvider?.GetService<IDialogService>();
            var currentWindowsUsername = string.Empty;
            var server = string.Empty;
            var database = string.Empty;

            MainViewModel mainViewModel = (MainViewModel)DataContext;

            if (dataService == null)
            {
                throw new InvalidOperationException("Failed to resolve IDataService.");
            }

            if (dialogService == null)
            {
                throw new InvalidOperationException("Failed to resolve IDialogService.");
            }

            Task.Run(() =>
            {
                try
                {

                    dataService.Context = new EnerFlowContext();

                    dataService.Context.SavingChanges += (sender, e) =>
                    {
                        mainViewModel.IsBusy = true;
                        //foreach (var entry in dataService.Context.ChangeTracker.Entries())
                        //{
                        //    if (entry.State == EntityState.Added || entry.State == EntityState.Modified)
                        //    {
                        //        entry.Property("ModifiedBy").CurrentValue = currentWindowsUsername;
                        //        entry.Property("ModifiedDate").CurrentValue = DateTime.Now;
                        //    }
                        //}
                    };

                    dataService.Context.SavedChanges += (sender, e) =>
                    {
                        mainViewModel.IsBusy = false;

                        //foreach (var entry in dataService.Context.ChangeTracker.Entries())
                        //{
                        //    if (entry.State == EntityState.Added)
                        //    {
                        //        entry.Property("CreatedBy").CurrentValue = currentWindowsUsername;
                        //        entry.Property("CreatedDate").CurrentValue = DateTime.Now;
                        //    }
                        //}
                    };


                    var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(Properties.Settings.Default.DatabaseConnectionString);

                    server = sqlConnectionStringBuilder.DataSource;

                    database = sqlConnectionStringBuilder.InitialCatalog;

                    currentWindowsUsername = Environment.UserName;

                    var currentUser = dataService.Context.Users.FirstOrDefault(u => u.UserName == currentWindowsUsername);

                    // Check if the user exists
                    if (currentUser == null)
                    {
                        throw new Exception("User does not exist in the database.");
                    }

                    mainViewModel.UserViewModel = new UserViewModel(currentUser);

                    // Check if the user has access
                    if (!Security.SecurityChecker.HasAccess(currentUser))
                    {
                        Dispatcher.Invoke(() =>
                        {
                            dialogService.ShowWarningDialog("You do not have access to this application.", "Access Denied");
                            Close();
                        });
                    }

                    // Load associated data
                    dataService.Context.FacilityTypes.Load();
                    dataService.Context.FacilitySubTypes.Load();
                    dataService.Context.WasteLocationTypes.Load();

                }
                catch (Exception ex)
                {
                    Dispatcher.Invoke(() =>
                    {
                        dialogService.ShowErrorDialog(ex.Message, "Error");
                        Close();
                    });
                }

                Dispatcher.Invoke(() =>
                {
                    try
                    {
                        if (dataService == null)
                        {
                            throw new InvalidOperationException("Failed to resolve IDataService.");
                        }

                        mainViewModel.Server = server;

                        mainViewModel.Database = database;

                        MapWebView.Source = new Uri(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/Map.html"));

                        mainViewModel.SetExecuteMapScriptAction(async (script) =>
                        {
                            var result = string.Empty;

                            if (MapWebView.CoreWebView2 != null)
                            {
                                result = await MapWebView.CoreWebView2.ExecuteScriptAsync(script);
                            }

                            return result;
                        });

                        mainViewModel.SystemHierarchyViewModel = new HierarchyViewModel(null!, dataService.GetSystemHierarchy());

                        mainViewModel.SelectedHierarchyViewModel = mainViewModel.SystemHierarchyViewModel;

                        mainViewModel.TreeMode = TreeMode.Map;

                        mainViewModel.IsBusy = false;

                    }
                    catch (Exception ex)
                    {
                        dialogService.ShowErrorDialog(ex.Message, "Error");
                        Close();
                    }
                });
            });
        }

        private void MapWebView_NavigationCompleted(object sender, Microsoft.Web.WebView2.Core.CoreWebView2NavigationCompletedEventArgs e)
        {

        }

        private void MapWebView_WebMessageReceived(object sender, Microsoft.Web.WebView2.Core.CoreWebView2WebMessageReceivedEventArgs e)
        {

        }

        private void NavigationTreeView_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if(e.NewValue is HierarchyViewModel hierarchyViewModel)
            {
                ((MainViewModel)DataContext).SelectedHierarchyViewModel = hierarchyViewModel;
            }
        }
    }
}