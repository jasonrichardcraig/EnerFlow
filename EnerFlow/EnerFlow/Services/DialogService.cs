using EnerFlow.Models;
using EnerFlow.ViewModels;
using EnerFlow.Views.Dialogs;
using Microsoft.Win32;
using System.Windows;

namespace EnerFlow.Services
{
    public class DialogService : IDialogService
    {

        public DialogService() { }

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

        public HierarchyViewModel ShowNewCompanyDialog(HierarchyViewModel rootHierarchyViewModel, IDataService dataService, MainViewModel mainViewModel, Hierarchy hierarchy)
        {
            var dialog = new NewCompanyDialog
            {
                CompanyHierarchyViewModel = new HierarchyViewModel(rootHierarchyViewModel, dataService, mainViewModel, hierarchy)
            };

            if(dialog.ShowDialog() == true)
            {
                return dialog.CompanyHierarchyViewModel;
            }
            else
            {
                return null!;
            }    

        }

    }

}
