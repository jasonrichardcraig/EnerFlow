using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.ViewModels;
using EnerFlow.Views.Dialogs;
using Microsoft.Win32;
using System.Windows;

namespace EnerFlow.Services
{
    public class DialogService : IDialogService
    {

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

        public void ShowSearchDialog()
        {
            var searchDialog = new SearchDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = new SearchViewModel()
            };

            searchDialog.ShowDialog();
        }

        public void ShowNewCompanyDialog()
        {
            var mainViewModel = Ioc.Default.GetService<MainViewModel>();
            var dataService = Ioc.Default.GetService<IDataService>();

            if (mainViewModel == null || mainViewModel.SystemHierarchyViewModel == null || dataService == null)
            {
                ShowErrorDialog("Unable to create new company. Required services are not available.", "Error");
                return;
            }

            var companyHierarchyViewModel = new HierarchyViewModel(mainViewModel.SystemHierarchyViewModel, new Hierarchy())
            {
                Name = "New Company",
                DisableAutoSave = true
            };

            var dialog = new NewCompanyDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = companyHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                companyHierarchyViewModel.DisableAutoSave = false;
                dataService.AddHierarchyNode(mainViewModel.SystemHierarchyViewModel.Hierarchy, companyHierarchyViewModel.Hierarchy, Enums.NodeType.Company);
                mainViewModel.SystemHierarchyViewModel.Children.Add(companyHierarchyViewModel);
            }
        }

        public void ShowNewDistrictDialog(HierarchyViewModel companyHierarchyViewModel)
        {

            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new district. Required services are not available.", "Error");
                return;
            }

            var districtHierarchyViewModel = new HierarchyViewModel(companyHierarchyViewModel, new Hierarchy())
            {
                Name = "New District",
                DisableAutoSave = true
            };

            var dialog = new NewDistrictDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = districtHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                districtHierarchyViewModel.DisableAutoSave = false;
                dataService.AddHierarchyNode(companyHierarchyViewModel.Hierarchy, districtHierarchyViewModel.Hierarchy, Enums.NodeType.District);
                companyHierarchyViewModel.Children.Add(districtHierarchyViewModel);
            }
        }

        public void ShowNewAreaDialog(HierarchyViewModel districtHierarchyViewModel)
        {

            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new area. Required services are not available.", "Error");
                return;
            }

            var areaHierarchyViewModel = new HierarchyViewModel(districtHierarchyViewModel, new Hierarchy())
            {
                Name = "New Area",
                DisableAutoSave = true
            };

            var dialog = new NewAreaDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = areaHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                areaHierarchyViewModel.DisableAutoSave = false;
                dataService.AddHierarchyNode(districtHierarchyViewModel.Hierarchy, areaHierarchyViewModel.Hierarchy, Enums.NodeType.Area);
                districtHierarchyViewModel.Children.Add(areaHierarchyViewModel);
            }
        }

        public void ShowNewFieldDialog(HierarchyViewModel areaHierarchyViewModel)
        {

            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new field. Required services are not available.", "Error");
                return;
            }

            var fieldHierarchyViewModel = new HierarchyViewModel(areaHierarchyViewModel, new Hierarchy())
            {
                Name = "New Field",
                DisableAutoSave = true
            };

            var dialog = new NewFieldDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = fieldHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                fieldHierarchyViewModel.DisableAutoSave = false;
                dataService.AddHierarchyNode(areaHierarchyViewModel.Hierarchy, fieldHierarchyViewModel.Hierarchy, Enums.NodeType.Field);
                areaHierarchyViewModel.Children.Add(fieldHierarchyViewModel);
            }
        }

        public void ShowNewFacilityDialog(HierarchyViewModel parentHierarchyViewModel)
        {

            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new facility. Required services are not available.", "Error");
                return;
            }

            var facility = new Facility();
            var facilityHierarchyViewModel = new FacilityViewModel(parentHierarchyViewModel, new Hierarchy(), facility)
            {
                Name = "New Facility",
                DisableAutoSave = true
            };

            var dialog = new NewFacilityDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = facilityHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                facilityHierarchyViewModel.DisableAutoSave = false;
                dataService.Context.Facilities.Add(facility);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, facilityHierarchyViewModel.Hierarchy, Enums.NodeType.Facility);
                parentHierarchyViewModel.Children.Add(facilityHierarchyViewModel);
            }
        }

        public void ShowNewWellDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new well. Required services are not available.", "Error");
                return;
            }

            var well = new Well();
            var wellHierarchyViewModel = new WellViewModel(parentHierarchyViewModel, new Hierarchy(), well)
            {
                Name = "New Well",
                DisableAutoSave = true
            };

            var dialog = new NewWellDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = wellHierarchyViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                wellHierarchyViewModel.DisableAutoSave = false;
                dataService.Context.Wells.Add(well);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, wellHierarchyViewModel.Hierarchy, Enums.NodeType.Well);
                parentHierarchyViewModel.Children.Add(wellHierarchyViewModel);
            }
        }

        public void ShowNewRunSheetDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new run sheet. Required services are not available.", "Error");
                return;
            }

            var runSheet = new RunSheet();
            var runSheetViewModel = new RunSheetViewModel(parentHierarchyViewModel, new Hierarchy(), runSheet)
            {
                Name = "New Run Sheet",
                DisableAutoSave = true
            };

            var dialog = new NewRunSheetDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = runSheetViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                runSheetViewModel.DisableAutoSave = false;
                dataService.Context.RunSheets.Add(runSheet);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, runSheetViewModel.Hierarchy, Enums.NodeType.RunSheet);
                parentHierarchyViewModel.Children.Add(runSheetViewModel);
            }
        }

        public void ShowNewContextTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new context tag. Required services are not available.", "Error");
                return;
            }

            var contextTag = new ContextTag();
            var contextTagViewModel = new ContextTagViewModel(parentHierarchyViewModel, new Hierarchy(), contextTag)
            {
                Name = "New Context Tag",
                DisableAutoSave = true
            };

            var dialog = new NewContextTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = contextTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                contextTagViewModel.DisableAutoSave = false;
                dataService.Context.ContextTags.Add(contextTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, contextTagViewModel.Hierarchy, Enums.NodeType.ContextTag);
                parentHierarchyViewModel.Children.Add(contextTagViewModel);
            }
        }

        public void DeleteHierarchyNode(HierarchyViewModel hierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to delete item. Required services are not available.", "Error");
                return;
            }

            if (dataService.GetChildren(hierarchyViewModel.Hierarchy).Count > 0)
            {
                ShowErrorDialog("Cannot delete a node with children.", "Error");
                return;
            }

            if (dataService.GetSystemHierarchy().Id == hierarchyViewModel.Hierarchy.Id)
            {
                ShowErrorDialog("Cannot delete the root node.", "Error");
                return;
            }

            switch ((Enums.NodeType)hierarchyViewModel.Hierarchy.NodeTypeId)
            {
                case Enums.NodeType.Company:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Company?", "Delete Company"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.District:
                    if (ShowConfirmationDialog("Are you sure you want to delete this District?", "Delete District"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Area:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Area?", "Delete Area"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Field:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Field?", "Delete Field"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Facility:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Facility?", "Delete Facility"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Well:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Well?", "Delete Well"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.ContextTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Context Tag?", "Delete Context Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.RunSheet:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
            }
        }
    }
}
