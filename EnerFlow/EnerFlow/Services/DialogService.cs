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

        public void ShowNewSerialPortChannelTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new serial port channel tag. Required services are not available.", "Error");
                return;
            }

            var serialPortChannelTag = new SerialPortChannelTag();
            var serialPortChannelTagViewModel = new SerialPortChannelTagViewModel(parentHierarchyViewModel, new Hierarchy(), serialPortChannelTag)
            {
                Name = "New Serial Port Channel Tag",
                DisableAutoSave = true
            };

            var dialog = new NewSerialPortChannelTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = serialPortChannelTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                serialPortChannelTagViewModel.DisableAutoSave = false;
                dataService.Context.SerialPortChannelTags.Add(serialPortChannelTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, serialPortChannelTagViewModel.Hierarchy, Enums.NodeType.SerialPortChannelTag);
                parentHierarchyViewModel.Children.Add(serialPortChannelTagViewModel);
            }
        }

        public void ShowNewIpChannelTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new IP Channel Tag. Required services are not available.", "Error");
                return;
            }

            var ipChannelTag = new IpChannelTag();
            var ipChannelTagViewModel = new IpChannelTagViewModel(parentHierarchyViewModel, new Hierarchy(), ipChannelTag)
            {
                Name = "New IP Channel",
                DisableAutoSave = true
            };

            var dialog = new NewIpChannelTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = ipChannelTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                ipChannelTagViewModel.DisableAutoSave = false;
                dataService.Context.IpChannelTags.Add(ipChannelTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, ipChannelTagViewModel.Hierarchy, Enums.NodeType.IpChannelTag);
                parentHierarchyViewModel.Children.Add(ipChannelTagViewModel);
            }
        }

        public void ShowNewDeviceTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Device Tag. Required services are not available.", "Error");
                return;
            }

            var deviceTag = new DeviceTag();
            var deviceTagViewModel = new DeviceTagViewModel(parentHierarchyViewModel, new Hierarchy(), deviceTag)
            {
                Name = "New Device Tag",
                DisableAutoSave = true
            };

            var dialog = new NewDeviceTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = deviceTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                deviceTagViewModel.DisableAutoSave = false;
                dataService.Context.DeviceTags.Add(deviceTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, deviceTagViewModel.Hierarchy, Enums.NodeType.DeviceTag);
                parentHierarchyViewModel.Children.Add(deviceTagViewModel);
            }
        }

        public void ShowNewAnalogIoTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Analog IO Tag. Required services are not available.", "Error");
                return;
            }

            var analogIoTag = new AnalogIoTag();
            var analogIoTagViewModel = new AnalogIoTagViewModel(parentHierarchyViewModel, new Hierarchy(), analogIoTag)
            {
                Name = "New Analog IO Tag",
                DisableAutoSave = true
            };

            var dialog = new NewAnalogIoTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = analogIoTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                analogIoTagViewModel.DisableAutoSave = false;
                dataService.Context.AnalogIoTags.Add(analogIoTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, analogIoTagViewModel.Hierarchy, Enums.NodeType.AnalogIoTag);
                parentHierarchyViewModel.Children.Add(analogIoTagViewModel);
            }
        }

        public void ShowNewDigitalIoTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Digital IO Tag. Required services are not available.", "Error");
                return;
            }

            var digitalIoTag = new DigitalIoTag();
            var digitalIoTagViewModel = new DigitalIoTagViewModel(parentHierarchyViewModel, new Hierarchy(), digitalIoTag)
            {
                Name = "New Digital IO Tag",
                DisableAutoSave = true
            };

            var dialog = new NewContextTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = digitalIoTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                digitalIoTagViewModel.DisableAutoSave = false;
                dataService.Context.DigitalIoTags.Add(digitalIoTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, digitalIoTagViewModel.Hierarchy, Enums.NodeType.DigitalIoTag);
                parentHierarchyViewModel.Children.Add(digitalIoTagViewModel);
            }
        }

        public void ShowNewStringIoTagDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new String IO Tag. Required services are not available.", "Error");
                return;
            }

            var stringIoTag = new StringIoTag();
            var stringIoTagViewModel = new StringIoTagViewModel(parentHierarchyViewModel, new Hierarchy(), stringIoTag)
            {
                Name = "New String IO Tag",
                DisableAutoSave = true
            };

            var dialog = new NewStringIoTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = stringIoTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                stringIoTagViewModel.DisableAutoSave = false;
                dataService.Context.StringIoTags.Add(stringIoTag);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, stringIoTagViewModel.Hierarchy, Enums.NodeType.StringIoTag);
                parentHierarchyViewModel.Children.Add(stringIoTagViewModel);
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
                case Enums.NodeType.RunSheet:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
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
                case Enums.NodeType.SerialPortChannelTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Serial Port Channel Tag?", "Delete Serial Port Channel Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.IpChannelTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this IP Channel Tag?", "Delete IP Channel Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.DeviceTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Device Tag?", "Delete Device Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.AnalogIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Analog IO Tag?", "Delete Analog IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.DigitalIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Digital IO Tag?", "Delete Digital IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.StringIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this String IO Tag?", "Delete String IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Screen:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Screen?", "Delete Screen"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Diagram:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Document:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Document?", "Delete Document"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Folder:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Folder?", "Delete Folder"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Meter:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Meter?", "Delete Meter"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Pump:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Pump?", "Delete Pump"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Tank:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Tank?", "Delete Tank"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Vessel:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Vessel?", "Delete Vessel"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
                case Enums.NodeType.Equipment:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Equipment?", "Delete Equipment"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                    }
                    break;
            }
        }
    }
}
