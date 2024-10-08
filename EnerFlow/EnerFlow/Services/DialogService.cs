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

            searchDialog.SearchTextBox.Focus();

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
                companyHierarchyViewModel.IsSelected = true;
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
                districtHierarchyViewModel.IsSelected = true;
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
                districtHierarchyViewModel.IsSelected = true;
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
                fieldHierarchyViewModel.IsSelected = true;
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
                facilityHierarchyViewModel.IsSelected = true;
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
                wellHierarchyViewModel.IsSelected = true;
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
                runSheetViewModel.IsSelected = true;
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
                contextTagViewModel.IsSelected = true;
            }
        }

        public void ShowNewSerialPortChannelDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Serial Port Channel. Required services are not available.", "Error");
                return;
            }

            var serialPortChannel = new SerialPortChannel();
            var serialPortChannelViewModel = new SerialPortChannelViewModel(parentHierarchyViewModel, new Hierarchy(), serialPortChannel)
            {
                Name = "New Serial Port Channel",
                DisableAutoSave = true
            };

            var dialog = new NewSerialPortChannelDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = serialPortChannelViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                serialPortChannelViewModel.DisableAutoSave = false;
                dataService.Context.SerialPortChannels.Add(serialPortChannel);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, serialPortChannelViewModel.Hierarchy, Enums.NodeType.SerialPortChannel);
                parentHierarchyViewModel.Children.Add(serialPortChannelViewModel);
                serialPortChannelViewModel.IsSelected = true;
            }
        }

        public void ShowNewIpChannelDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new IP Channel. Required services are not available.", "Error");
                return;
            }

            var ipChannel = new IpChannel();
            var ipChannelViewModel = new IpChannelViewModel(parentHierarchyViewModel, new Hierarchy(), ipChannel)
            {
                Name = "New IP Channel",
                DisableAutoSave = true
            };

            var dialog = new NewIpChannelDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = ipChannelViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                ipChannelViewModel.DisableAutoSave = false;
                dataService.Context.IpChannels.Add(ipChannel);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, ipChannelViewModel.Hierarchy, Enums.NodeType.IpChannel);
                parentHierarchyViewModel.Children.Add(ipChannelViewModel);
                ipChannelViewModel.IsSelected = true;
            }
        }

        public void ShowNewDeviceDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Device. Required services are not available.", "Error");
                return;
            }

            var device = new Device();
            var deviceViewModel = new DeviceViewModel(parentHierarchyViewModel, new Hierarchy(), device)
            {
                Name = "New Device",
                DisableAutoSave = true
            };

            var dialog = new NewDeviceDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = deviceViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                deviceViewModel.DisableAutoSave = false;
                dataService.Context.Devices.Add(device);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, deviceViewModel.Hierarchy, Enums.NodeType.Device);
                parentHierarchyViewModel.Children.Add(deviceViewModel);
                deviceViewModel.IsSelected = true;
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

            var digitalIoTagCurrentValue = new DigitalIoTagCurrentValue() { TimeStamp = DateTime.Now };
            var digitalIoTag = new DigitalIoTag() { DigitalIoTagCurrentValue = digitalIoTagCurrentValue };

            var digitalIoTagViewModel = new DigitalIoTagViewModel(parentHierarchyViewModel, new Hierarchy(), digitalIoTag)
            {
                Name = "New Digital IO Tag",
                DisableAutoSave = true
            };

            var dialog = new NewDigitalIoTagDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = digitalIoTagViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                digitalIoTagViewModel.DisableAutoSave = false;
                dataService.Context.DigitalIoTags.Add(digitalIoTag);
                dataService.Context.DigitalIoTagCurrentValues.Add(digitalIoTagCurrentValue);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, digitalIoTagViewModel.Hierarchy, Enums.NodeType.DigitalIoTag);
                parentHierarchyViewModel.Children.Add(digitalIoTagViewModel);
                digitalIoTagViewModel.IsSelected = true;
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

            var analogIoTagCurrentValue = new AnalogIoTagCurrentValue() { TimeStamp = DateTime.Now };
            var analogIoTag = new AnalogIoTag() { AnalogIoTagCurrentValue = analogIoTagCurrentValue };
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
                dataService.Context.AnalogIoTagCurrentValues.Add(analogIoTagCurrentValue);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, analogIoTagViewModel.Hierarchy, Enums.NodeType.AnalogIoTag);
                parentHierarchyViewModel.Children.Add(analogIoTagViewModel);
                analogIoTagViewModel.IsSelected = true;
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

            var stringIoTagCurrentValue = new StringIoTagCurrentValue() { TimeStamp = DateTime.Now };
            var stringIoTag = new StringIoTag() { StringIoTagCurrentValue = stringIoTagCurrentValue };
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
                dataService.Context.StringIoTagCurrentValues.Add(stringIoTagCurrentValue);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, stringIoTagViewModel.Hierarchy, Enums.NodeType.StringIoTag);
                parentHierarchyViewModel.Children.Add(stringIoTagViewModel);
                stringIoTagViewModel.IsSelected = true;
            }
        }

        public void ShowNewMeterRunDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Meter Run. Required services are not available.", "Error");
                return;
            }

            var meterRun = new MeterRun();
            var meterRunViewModel = new MeterRunViewModel(parentHierarchyViewModel, new Hierarchy(), meterRun)
            {
                Name = "New Meter Run",
                DisableAutoSave = true
            };

            var dialog = new NewMeterRunDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = meterRunViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                meterRunViewModel.DisableAutoSave = false;
                dataService.Context.MeterRuns.Add(meterRun);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, meterRunViewModel.Hierarchy, Enums.NodeType.MeterRun);
                parentHierarchyViewModel.Children.Add(meterRunViewModel);
                meterRunViewModel.IsSelected = true;
            }
        }

        public void ShowNewScreenDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Screen. Required services are not available.", "Error");
                return;
            }

            var screen = new Screen();
            var screenViewModel = new ScreenViewModel(parentHierarchyViewModel, new Hierarchy(), screen)
            {
                Name = "New Screen",
                DisableAutoSave = true
            };

            var dialog = new NewScreenDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = screenViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                screenViewModel.DisableAutoSave = false;
                dataService.Context.Screens.Add(screen);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, screenViewModel.Hierarchy, Enums.NodeType.Screen);
                parentHierarchyViewModel.Children.Add(screenViewModel);
                screenViewModel.IsSelected = true;
            }
        }

        public void ShowNewDiagramDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Diagram. Required services are not available.", "Error");
                return;
            }

            var diagram = new Diagram();
            var diagramViewModel = new DiagramViewModel(parentHierarchyViewModel, new Hierarchy(), diagram)
            {
                Name = "New Diagram",
                DisableAutoSave = true
            };

            var dialog = new NewDiagramDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = diagramViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                diagramViewModel.DisableAutoSave = false;
                dataService.Context.Diagrams.Add(diagram);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, diagramViewModel.Hierarchy, Enums.NodeType.Diagram);
                parentHierarchyViewModel.Children.Add(diagramViewModel);
                diagramViewModel.IsSelected = true;
            }
        }

        public void ShowNewDocumentDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Document. Required services are not available.", "Error");
                return;
            }

            var document = new Document();
            var documentViewModel = new DocumentViewModel(parentHierarchyViewModel, new Hierarchy(), document)
            {
                Name = "New Document",
                DisableAutoSave = true
            };

            var dialog = new NewDocumentDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = documentViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                documentViewModel.DisableAutoSave = false;
                dataService.Context.Documents.Add(document);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, documentViewModel.Hierarchy, Enums.NodeType.Document);
                parentHierarchyViewModel.Children.Add(documentViewModel);
                documentViewModel.IsSelected = true;
            }
        }

        public void ShowNewFolderDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Folder. Required services are not available.", "Error");
                return;
            }

            var folder = new Folder();
            var folderViewModel = new FolderViewModel(parentHierarchyViewModel, new Hierarchy(), folder)
            {
                Name = "New Folder",
                DisableAutoSave = true
            };

            var dialog = new NewFolderDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = folderViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                folderViewModel.DisableAutoSave = false;
                dataService.Context.Folders.Add(folder);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, folderViewModel.Hierarchy, Enums.NodeType.Folder);
                parentHierarchyViewModel.Children.Add(folderViewModel);
                folderViewModel.IsSelected = true;
            }
        }

        public void ShowNewMeterDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Meter. Required services are not available.", "Error");
                return;
            }

            var meter = new Meter();
            var meterViewModel = new MeterViewModel(parentHierarchyViewModel, new Hierarchy(), meter)
            {
                Name = "New Meter",
                DisableAutoSave = true
            };

            var dialog = new NewMeterDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = meterViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                meterViewModel.DisableAutoSave = false;
                dataService.Context.Meters.Add(meter);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, meterViewModel.Hierarchy, Enums.NodeType.Meter);
                parentHierarchyViewModel.Children.Add(meterViewModel);
                meterViewModel.IsSelected = true;
            }
        }

        public void ShowNewPumpDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Pump. Required services are not available.", "Error");
                return;
            }

            var pump = new Pump();
            var pumpViewModel = new PumpViewModel(parentHierarchyViewModel, new Hierarchy(), pump)
            {
                Name = "New Pump",
                DisableAutoSave = true
            };

            var dialog = new NewPumpDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = pumpViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                pumpViewModel.DisableAutoSave = false;
                dataService.Context.Pumps.Add(pump);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, pumpViewModel.Hierarchy, Enums.NodeType.Pump);
                parentHierarchyViewModel.Children.Add(pumpViewModel);
                pumpViewModel.IsSelected = true;
            }
        }

        public void ShowNewTankDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Tank. Required services are not available.", "Error");
                return;
            }

            var tank = new Tank();
            var tankViewModel = new TankViewModel(parentHierarchyViewModel, new Hierarchy(), tank)
            {
                Name = "New Tank",
                DisableAutoSave = true
            };

            var dialog = new NewTankDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = tankViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                tankViewModel.DisableAutoSave = false;
                dataService.Context.Tanks.Add(tank);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, tankViewModel.Hierarchy, Enums.NodeType.Tank);
                parentHierarchyViewModel.Children.Add(tankViewModel);
                tankViewModel.IsSelected = true;
            }
        }

        public void ShowNewVesselDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Vessel. Required services are not available.", "Error");
                return;
            }

            var vessel = new Vessel();
            var vesselViewModel = new VesselViewModel(parentHierarchyViewModel, new Hierarchy(), vessel)
            {
                Name = "New Vessel",
                DisableAutoSave = true
            };

            var dialog = new NewTankDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = vesselViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                vesselViewModel.DisableAutoSave = false;
                dataService.Context.Vessels.Add(vessel);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, vesselViewModel.Hierarchy, Enums.NodeType.Vessel);
                parentHierarchyViewModel.Children.Add(vesselViewModel);
                vesselViewModel.IsSelected = true;
            }
        }
        public void ShowNewEquipmentDialog(HierarchyViewModel parentHierarchyViewModel)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                ShowErrorDialog("Unable to create new Equipment. Required services are not available.", "Error");
                return;
            }

            var equipment = new Equipment();
            var equipmentViewModel = new EquipmentViewModel(parentHierarchyViewModel, new Hierarchy(), equipment)
            {
                Name = "New Equipment",
                DisableAutoSave = true
            };

            var dialog = new NewEquipmentDialog()
            {
                Owner = Application.Current.MainWindow,
                DataContext = equipmentViewModel
            };

            var dialogResult = dialog.ShowDialog();

            if (dialogResult == true)
            {
                equipmentViewModel.DisableAutoSave = false;
                dataService.Context.Equipment.Add(equipment);
                dataService.AddHierarchyNode(parentHierarchyViewModel.Hierarchy, equipmentViewModel.Hierarchy, Enums.NodeType.Equipment);
                parentHierarchyViewModel.Children.Add(equipmentViewModel);
                equipmentViewModel.IsSelected = true;
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

            if (dataService.GetChildren(hierarchyViewModel.Hierarchy,
                [Enums.NodeType.System,
                Enums.NodeType.Company,
                Enums.NodeType.District,
                Enums.NodeType.Area,
                Enums.NodeType.Field,
                Enums.NodeType.Facility,
                Enums.NodeType.Well,
                Enums.NodeType.RunSheet,
                Enums.NodeType.SerialPortChannel,
                Enums.NodeType.IpChannel,
                Enums.NodeType.Device,
                Enums.NodeType.AnalogIoTag,
                Enums.NodeType.DigitalIoTag,
                Enums.NodeType.StringIoTag,
                Enums.NodeType.ContextTag,
                Enums.NodeType.MeterRun,
                Enums.NodeType.Screen,
                Enums.NodeType.MeterRun,
                Enums.NodeType.Diagram,
                Enums.NodeType.Document,
                Enums.NodeType.Folder,
                Enums.NodeType.Meter,
                Enums.NodeType.Pump,
                Enums.NodeType.Tank,
                Enums.NodeType.Vessel,
                Enums.NodeType.Equipment]).Count > 0)
            {
                ShowErrorDialog("Cannot delete a node with children.", "Error");
                return;
            }

            if (dataService.GetSystemHierarchy().Id == hierarchyViewModel.Hierarchy.Id)
            {
                ShowErrorDialog("Cannot delete the root node.", "Error");
                return;
            }

            var sibling = dataService.GetSibling(hierarchyViewModel.Hierarchy.Node);

            switch ((Enums.NodeType)hierarchyViewModel.Hierarchy.NodeTypeId)
            {
                case Enums.NodeType.Company:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Company?", "Delete Company"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.District:
                    if (ShowConfirmationDialog("Are you sure you want to delete this District?", "Delete District"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Area:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Area?", "Delete Area"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Field:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Field?", "Delete Field"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Facility:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Facility?", "Delete Facility"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Well:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Well?", "Delete Well"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.RunSheet:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.ContextTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Context Tag?", "Delete Context Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.SerialPortChannel:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Serial Port Channel Tag?", "Delete Serial Port Channel Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.IpChannel:
                    if (ShowConfirmationDialog("Are you sure you want to delete this IP Channel Tag?", "Delete IP Channel Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Device:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Device Tag?", "Delete Device Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.AnalogIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Analog IO Tag?", "Delete Analog IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.DigitalIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Digital IO Tag?", "Delete Digital IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.StringIoTag:
                    if (ShowConfirmationDialog("Are you sure you want to delete this String IO Tag?", "Delete String IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.MeterRun:
                    if (ShowConfirmationDialog("Are you sure you want to delete this MeterRun?", "Delete String IO Tag"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Screen:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Screen?", "Delete Screen"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Diagram:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Run Sheet?", "Delete Run Sheet"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Document:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Document?", "Delete Document"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Folder:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Folder?", "Delete Folder"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Meter:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Meter?", "Delete Meter"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Pump:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Pump?", "Delete Pump"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Tank:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Tank?", "Delete Tank"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Vessel:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Vessel?", "Delete Vessel"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
                case Enums.NodeType.Equipment:
                    if (ShowConfirmationDialog("Are you sure you want to delete this Equipment?", "Delete Equipment"))
                    {
                        dataService.DeleteHierarchyNode(hierarchyViewModel.Hierarchy);
                        hierarchyViewModel.ParentHierarchyViewModel.Children.Remove(hierarchyViewModel);
                        MainViewModel.SelectAndExpandNode(hierarchyViewModel.ParentHierarchyViewModel, sibling);
                    }
                    break;
            }
        }
    }
}
