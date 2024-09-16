using EnerFlow.Models;
using EnerFlow.ViewModels;

namespace EnerFlow.Services
{
    public interface IDialogService
    {
        bool ShowConfirmationDialog(string message, string title);
        string ShowOpenFileDialog();
        void ShowNewCompanyDialog();
    }

}
