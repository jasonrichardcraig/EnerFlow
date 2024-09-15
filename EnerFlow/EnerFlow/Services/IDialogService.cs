using EnerFlow.Models;
using EnerFlow.ViewModels;

namespace EnerFlow.Services
{
    public interface IDialogService
    {
        bool ShowConfirmationDialog(string message, string title);
        string ShowOpenFileDialog();
        HierarchyViewModel ShowNewCompanyDialog(HierarchyViewModel rootHierarchyViewModel, IDataService dataService, MainViewModel mainViewModel, Hierarchy hierarchy);
    }

}
