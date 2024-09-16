using EnerFlow.Models;
using EnerFlow.ViewModels;

namespace EnerFlow.Services
{
    public interface IDialogService
    {
        bool ShowConfirmationDialog(string message, string title);
        void ShowWarningDialog(string message, string title);
        void ShowErrorDialog(string message, string title);
        string ShowOpenFileDialog();
        void ShowNewCompanyDialog();
        void DeleteHierarchyNode(HierarchyViewModel hierarchyViewModel);
    }

}
