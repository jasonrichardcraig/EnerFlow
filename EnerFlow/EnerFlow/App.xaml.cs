using EnerFlow.Services;
using EnerFlow.ViewModels;
using Microsoft.Extensions.DependencyInjection;
using System.Configuration;
using System.Data;
using System.Windows;

namespace EnerFlow
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {

        /// <summary>
        /// Gets or sets the service provider.
        /// </summary>
        public static IServiceProvider? ServiceProvider { get; private set; }

        /// <summary>
        /// Handles the startup event of the application.
        /// </summary>
        /// <param name="e">The <see cref="StartupEventArgs"/> instance containing the event data.</param>
        protected override void OnStartup(StartupEventArgs e)
        {
            var serviceCollection = new ServiceCollection();
            ConfigureServices(serviceCollection);
            ServiceProvider = serviceCollection.BuildServiceProvider();

            base.OnStartup(e);
        }

        /// <summary>
        /// Configures the services for dependency injection.
        /// </summary>
        /// <param name="services">The service collection.</param>
        private static void ConfigureServices(IServiceCollection services)
        {
            // Register the IDataService and its implementation
            services.AddSingleton<IDataService, DataService>();

            // Register the IDialogService and its implementation
            services.AddSingleton<IDialogService, DialogService>();

            // Register the MainViewModel
            services.AddSingleton<MainViewModel>();
        }
    }

}
