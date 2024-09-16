using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.ViewModels;
using EnerFlow.Views.Dialogs;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Win32;
using System.Windows;

namespace EnerFlow.Services
{
    public class DialogService : IDialogService
    {

        private readonly IDataService _dataService;
        private readonly MainViewModel _mainViewModel;

        public DialogService()
        {
            _dataService = App.ServiceProvider?.GetService<IDataService>() ?? throw new InvalidOperationException("Data Service is not available.");
            _mainViewModel = App.ServiceProvider?.GetService<MainViewModel>() ?? throw new InvalidOperationException("MainViewModel is not available.");
        }

        public bool ShowConfirmationDialog(string message, string title)
        {
            var result = MessageBox.Show(message, title, MessageBoxButton.YesNo, MessageBoxImage.Question);
            return result == MessageBoxResult.Yes;
        }

        public string ShowOpenFileDialog()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == true)
            {
                return openFileDialog.FileName;
            }
            return string.Empty;
        }

        public void ShowNewCompanyDialog()
        {
            var companyHierarchyViewModel = new HierarchyViewModel(_mainViewModel.RootHierarchyViewModel!, new Hierarchy());

            var dialog = new NewCompanyDialog()
            {
                DataContext = companyHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.AddCompanyHierarchyNode(_mainViewModel.RootHierarchyViewModel.Hierarchy, companyHierarchyViewModel.Hierarchy);
                _mainViewModel.RootHierarchyViewModel.Children.Add(companyHierarchyViewModel);
            }
        }
    }
}
