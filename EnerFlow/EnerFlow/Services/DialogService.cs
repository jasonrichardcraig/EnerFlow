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

        public void ShowWarningDialog(string message, string title)
        {
            MessageBox.Show(message, title, MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        public void ShowErrorDialog(string message, string title)
        {
            MessageBox.Show(message, title, MessageBoxButton.OK, MessageBoxImage.Error);
        }

        public string ShowOpenFileDialog()
        {
            var openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == true)
            {
                return openFileDialog.FileName;
            }
            return string.Empty;
        }

        public void ShowNewCompanyDialog()
        {
            var companyHierarchyViewModel = new HierarchyViewModel(_mainViewModel.SystemHierarchyViewModel!, new Hierarchy());

            var dialog = new NewCompanyDialog()
            {
                DataContext = companyHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.AddHierarchyNode(_mainViewModel.SystemHierarchyViewModel.Hierarchy, companyHierarchyViewModel.Hierarchy, HierarchyNodeType.Company);
                _mainViewModel.SystemHierarchyViewModel.Children.Add(companyHierarchyViewModel);
            }
        }

        public void ShowNewDistrictDialog(HierarchyViewModel companyHierarchyViewModel)
        {
            var districtHierarchyViewModel = new HierarchyViewModel(companyHierarchyViewModel, new Hierarchy());

            var dialog = new NewDistrictDialog()
            {
                DataContext = districtHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.AddHierarchyNode(companyHierarchyViewModel.Hierarchy, districtHierarchyViewModel.Hierarchy, HierarchyNodeType.District);
                companyHierarchyViewModel.Children.Add(districtHierarchyViewModel);
            }
        }

        public void ShowNewAreaDialog(HierarchyViewModel districtHierarchyViewModel)
        {
            var areaHierarchyViewModel = new HierarchyViewModel(districtHierarchyViewModel, new Hierarchy());

            var dialog = new NewAreaDialog()
            {
                DataContext = areaHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.AddHierarchyNode(districtHierarchyViewModel.Hierarchy, areaHierarchyViewModel.Hierarchy, HierarchyNodeType.Area);
                districtHierarchyViewModel.Children.Add(areaHierarchyViewModel);
            }
        }

        public void ShowNewFieldDialog(HierarchyViewModel areaHierarchyViewModel)
        {
            var fieldHierarchyViewModel = new HierarchyViewModel(areaHierarchyViewModel, new Hierarchy());

            var dialog = new NewFieldDialog()
            {
                DataContext = fieldHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.AddHierarchyNode(areaHierarchyViewModel.Hierarchy, fieldHierarchyViewModel.Hierarchy, HierarchyNodeType.Field);
                areaHierarchyViewModel.Children.Add(fieldHierarchyViewModel);
            }
        }

        public void ShowNewFacilityDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var facility = new Facility();
            var facilityHierarchyViewModel = new FacilityViewModel(parentHierarchyViewModel, new Hierarchy(), facility);

            var dialog = new NewFacilityDialog()
            {
                DataContext = facilityHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                _dataService.Context.Facilities.Add(facility);
                _dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, facilityHierarchyViewModel.Hierarchy, HierarchyNodeType.Facility);
                parentHierarchyViewModel.Children.Add(facilityHierarchyViewModel);
            }
        }

        public void DeleteHierarchyNode(HierarchyViewModel hierarchyViewModel)
        {
            if (_dataService.GetChildren(hierarchyViewModel.Hierarchy).Count > 0)
            {
                ShowErrorDialog("Cannot delete a node with children.", "Error");
                return;
            }

            if (_dataService.GetSystemHierarchy().Id == hierarchyViewModel.Hierarchy.Id)
            {
                ShowErrorDialog("Cannot delete the root node.", "Error");
                return;
            }

            if (ShowConfirmationDialog("Are you sure you want to delete this node?", "Delete Node"))
            {
                _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
            }
        }
    }
}
