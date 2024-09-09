using EnerFlow.Data;
using EnerFlow.Implementations;
using EnerFlow.Interfaces;
using EnerFlow.ViewModels;
using Microsoft.Extensions.DependencyInjection;
using System.Windows;
using System.Windows.Controls.Ribbon;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
namespace EnerFlow
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : RibbonWindow
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
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Task.Run(() =>
            {
                Thread.Sleep(0);
                Dispatcher.Invoke(() =>
                {
                    try
                    {
                        var dataService = App.ServiceProvider?.GetService<IDataService>();

                        if (dataService == null)
                        {
                            throw new InvalidOperationException("Failed to resolve IDataService.");
                        }

                        dataService.Context = new EnerFlowContext();

                        var currentWindowsUsername = Environment.UserName;

                        var currentUser = dataService.Context.Users.FirstOrDefault(u => u.UserName == currentWindowsUsername);

                        // Check if the user exists
                        if (currentUser == null)
                        {
                            throw new Exception("User does not exist in the database.");
                        }

                        // Check if the user has access
                        if (!Security.SecurityChecker.HasAccess(currentUser))
                        {
                            MessageBox.Show("You do not have access to this application.", "Access Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                            Close();
                        }

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        Close();
                    }
                });
            });
        }

    }
}