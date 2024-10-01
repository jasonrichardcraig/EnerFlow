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
        void ShowSearchDialog();
        void ShowNewCompanyDialog();
        void ShowNewDistrictDialog(HierarchyViewModel companyHierarchyViewModel);
        void ShowNewAreaDialog(HierarchyViewModel districtHierarchyViewModel);
        void ShowNewFieldDialog(HierarchyViewModel areaHierarchyViewModel);
        void ShowNewFacilityDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewWellDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewRunSheetDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewContextTagDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewSerialPortChannelDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewIpChannelDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewDeviceDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewAnalogIoTagDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewDigitalIoTagDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewStringIoTagDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewMeterRunDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewScreenDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewDiagramDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewDocumentDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewFolderDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewMeterDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewPumpDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewTankDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewVesselDialog(HierarchyViewModel parentHierarchyViewModel);
        void ShowNewEquipmentDialog(HierarchyViewModel parentHierarchyViewModel);
        void DeleteHierarchyNode(HierarchyViewModel hierarchyViewModel);
    }

}
