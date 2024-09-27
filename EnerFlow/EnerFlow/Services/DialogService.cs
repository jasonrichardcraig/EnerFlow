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
            var companyHierarchyViewModel = new HierarchyViewModel(_mainViewModel.SystemHierarchyViewModel!, new Hierarchy())
            {
                Name = "New Company",
                DisableAutoSave = true
            };


            var dialog = new NewCompanyDialog()
            {
                DataContext = companyHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                companyHierarchyViewModel.DisableAutoSave = false;
                _dataService.AddHierarchyNode(_mainViewModel.SystemHierarchyViewModel.Hierarchy, companyHierarchyViewModel.Hierarchy, Enums.NodeType.Company);
                _mainViewModel.SystemHierarchyViewModel.Children.Add(companyHierarchyViewModel);
            }
        }

        public void ShowNewDistrictDialog(HierarchyViewModel companyHierarchyViewModel)
        {
            var districtHierarchyViewModel = new HierarchyViewModel(companyHierarchyViewModel, new Hierarchy())
            {
                Name = "New District",
                DisableAutoSave = true
            };

            var dialog = new NewDistrictDialog()
            {
                DataContext = districtHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                districtHierarchyViewModel.DisableAutoSave = false;
                _dataService.AddHierarchyNode(companyHierarchyViewModel.Hierarchy, districtHierarchyViewModel.Hierarchy, Enums.NodeType.District);
                companyHierarchyViewModel.Children.Add(districtHierarchyViewModel);
            }
        }

        public void ShowNewAreaDialog(HierarchyViewModel districtHierarchyViewModel)
        {
            var areaHierarchyViewModel = new HierarchyViewModel(districtHierarchyViewModel, new Hierarchy())
            {
                Name = "New Area",
                DisableAutoSave = true
            };

            var dialog = new NewAreaDialog()
            {
                DataContext = areaHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                areaHierarchyViewModel.DisableAutoSave = false;
                _dataService.AddHierarchyNode(districtHierarchyViewModel.Hierarchy, areaHierarchyViewModel.Hierarchy, Enums.NodeType.Area);
                districtHierarchyViewModel.Children.Add(areaHierarchyViewModel);
            }
        }

        public void ShowNewFieldDialog(HierarchyViewModel areaHierarchyViewModel)
        {
            var fieldHierarchyViewModel = new HierarchyViewModel(areaHierarchyViewModel, new Hierarchy())
            {
                Name = "New Field",
                DisableAutoSave = true
            };

            var dialog = new NewFieldDialog()
            {
                DataContext = fieldHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                fieldHierarchyViewModel.DisableAutoSave = false;
                _dataService.AddHierarchyNode(areaHierarchyViewModel.Hierarchy, fieldHierarchyViewModel.Hierarchy, Enums.NodeType.Field);
                areaHierarchyViewModel.Children.Add(fieldHierarchyViewModel);
            }
        }

        public void ShowNewFacilityDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var facility = new Facility();
            var facilityHierarchyViewModel = new FacilityViewModel(parentHierarchyViewModel, new Hierarchy(), facility)
            {
                Name = "New Facility",
                DisableAutoSave = true
            };

            var dialog = new NewFacilityDialog()
            {
                DataContext = facilityHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                facilityHierarchyViewModel.DisableAutoSave = false;
                _dataService.Context.Facilities.Add(facility);
                _dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, facilityHierarchyViewModel.Hierarchy, Enums.NodeType.Facility);
                parentHierarchyViewModel.Children.Add(facilityHierarchyViewModel);
            }
        }

        public void ShowNewWellDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var well = new Well();
            var wellHierarchyViewModel = new WellViewModel(parentHierarchyViewModel, new Hierarchy(), well)
            {
                Name = "New Well",
                DisableAutoSave = true
            };

            var dialog = new NewWellDialog()
            {
                DataContext = wellHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                wellHierarchyViewModel.DisableAutoSave = false;
                _dataService.Context.Wells.Add(well);
                _dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, wellHierarchyViewModel.Hierarchy, Enums.NodeType.Well);
                parentHierarchyViewModel.Children.Add(wellHierarchyViewModel);
            }
        }

        public void ShowNewRunSheetDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var runSheet = new RunSheet();
            var runSheetViewModel = new RunSheetViewModel(parentHierarchyViewModel, new Hierarchy(), runSheet)
            {
                Name = "New Run Sheet",
                DisableAutoSave = true
            };

            var dialog = new NewRunSheetDialog()
            {
                DataContext = runSheetViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                runSheetViewModel.DisableAutoSave = false;
                _dataService.Context.RunSheets.Add(runSheet);
                _dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, runSheetViewModel.Hierarchy, Enums.NodeType.RunSheet);
                parentHierarchyViewModel.Children.Add(runSheetViewModel);
            }
        }

        public void ShowNewContextTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var contextTag = new ContextTag();
            var contextTagViewModel = new ContextTagViewModel(parentHierarchyViewModel, new Hierarchy(), contextTag)
            {
                Name = "New Context Tag",
                DisableAutoSave = true
            };

            var dialog = new NewContextTagDialog()
            {
                DataContext = contextTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                contextTagViewModel.DisableAutoSave = false;
                _dataService.Context.ContextTags.Add(contextTag);
                _dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, contextTagViewModel.Hierarchy, Enums.NodeType.ContextTag);
                parentHierarchyViewModel.Children.Add(contextTagViewModel);
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

            switch ((Enums.NodeType)hierarchyViewModel.Hierarchy.NodeTypeId)
            {
                case Enums.NodeType.Company:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Company?", "Delete Company"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.District:
                    if (ShowConfirmationDialog("Are you sure you want to delete this District?", "Delete District"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Area:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Area?", "Delete Area"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Field:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Field?", "Delete Field"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Facility:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Facility?", "Delete Facility"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Well:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Well?", "Delete Well"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.ContextTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Context Tag?", "Delete Context Tag"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.RunSheet:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
                    {
                        _dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
            }
        }
    }
}
