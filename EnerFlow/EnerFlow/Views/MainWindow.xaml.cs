using EnerFlow.Data;
using EnerFlow.Implementations;
using EnerFlow.Interfaces;
using EnerFlow.ViewModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Controls.Ribbon;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
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
            var currentWindowsUsername = string.Empty;
            var server = string.Empty;
            var database = string.Empty;

            MainViewModel mainViewModel = (MainViewModel)DataContext;

            Task.Run(() =>
            {
                try
                {

                    if (dataService == null)
                    {
                        throw new InvalidOperationException("Failed to resolve IDataService.");
                    }

                    dataService.Context = new EnerFlowContext();

                    var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(Properties.Settings.Default.DatabaseConnectionString);

                    server = sqlConnectionStringBuilder.DataSource;

                    database = sqlConnectionStringBuilder.InitialCatalog;

                    currentWindowsUsername = Environment.UserName;

                    var currentUser = dataService.Context.Users.FirstOrDefault(u => u.UserName == currentWindowsUsername);

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

                    // Check if the user exists
                    if (currentUser == null)
                    {
                        throw new Exception("User does not exist in the database.");
                    }

                    // Check if the user has access
                    if (!Security.SecurityChecker.HasAccess(currentUser))
                    {
                        Dispatcher.Invoke(() =>
                        {
                            MessageBox.Show("You do not have access to this application.", "Access Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                            Close();
                        });
                    }
                }
                catch (Exception ex)
                {
                    Dispatcher.Invoke(() =>
                    {
                        MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
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

                        HierarchyViewModel? parentHierarchyViewModel = null;

                        mainViewModel.UserName = currentWindowsUsername;

                        mainViewModel.Server = server;

                        mainViewModel.Database = database;

                        MapWebView.Source = new Uri(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/Map.html"));

                        mainViewModel.RootHierarchyViewModel = new HierarchyViewModel(parentHierarchyViewModel!, dataService, mainViewModel, dataService.GetRootHierarchy());

                        mainViewModel.IsBusy = false;

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MapWebView.Visibility = Visibility.Collapsed;
            BusyIndicator.IsBusy = true;
        }
    }
}