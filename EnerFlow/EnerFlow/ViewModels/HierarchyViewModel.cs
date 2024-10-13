using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.Services;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel : ObservableValidator, IDisposable
    {
        private bool _isLoaded = false;
        private bool _isSelected;
        private bool _isExpanded;
        private bool _disableAutoSave;
        protected readonly HierarchyViewModel _parentHierarchyViewModel;
        protected readonly ObservableCollection<HierarchyViewModel> _children = [];
        protected Hierarchy _hierarchy = null!;

        public HierarchyViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy)
        {
            _parentHierarchyViewModel = parentHierarchyViewModel;

            _hierarchy = hierarchy;

            RefreshCommand = new RelayCommand(Refresh);
            AddNewCompanyCommand = new RelayCommand(AddNewCompany, CanAddNewItem);
            AddNewDistrictCommand = new RelayCommand(AddNewDistrict, CanAddNewItem);
            AddNewAreaCommand = new RelayCommand(AddNewArea, CanAddNewItem);
            AddNewFieldCommand = new RelayCommand(AddNewField, CanAddNewItem);
            AddNewFacilityCommand = new RelayCommand(AddNewFacility, CanAddNewItem);
            AddNewWellCommand = new RelayCommand(AddNewWell, CanAddNewItem);
            AddNewRunSheetCommand = new RelayCommand(AddNewRunSheet, CanAddNewItem);
            AddNewContextTagCommand = new RelayCommand(AddNewContextTag, CanAddNewItem);
            AddNewSerialPortChannelCommand = new RelayCommand(AddNewSerialPortChannel, CanAddNewItem);
            AddNewIpChannelCommand = new RelayCommand(AddNewIpChannel, CanAddNewItem);
            AddNewDeviceCommand = new RelayCommand(AddNewDeviceTag, CanAddNewItem);
            AddNewAnalogIoTagCommand = new RelayCommand(AddNewAnalogIoTag, CanAddNewItem);
            AddNewDigitalIoTagCommand = new RelayCommand(AddNewDigitalIoTag, CanAddNewItem);
            AddNewStringIoTagCommand = new RelayCommand(AddNewStringIoTag, CanAddNewItem);
            AddNewMeterRunCommand = new RelayCommand(AddNewMeterRun, CanAddNewItem);
            AddNewScreenCommand = new RelayCommand(AddNewScreen, CanAddNewItem);
            AddNewDiagramCommand = new RelayCommand(AddNewDiagram, CanAddNewItem);
            AddNewDocumentCommand = new RelayCommand(AddNewDocument, CanAddNewItem);
            AddNewFolderCommand = new RelayCommand(AddNewFolder, CanAddNewItem);
            AddNewMeterCommand = new RelayCommand(AddNewMeter, CanAddNewItem);
            AddNewPumpCommand = new RelayCommand(AddNewPump, CanAddNewItem);
            AddNewTankCommand = new RelayCommand(AddNewTank, CanAddNewItem);
            AddNewVesselCommand = new RelayCommand(AddNewVessel, CanAddNewItem);
            AddNewEquipmentCommand = new RelayCommand(AddNewEquipment, CanAddNewItem);
            DeleteCommand = new RelayCommand(Delete, CanDelete);

            _children.CollectionChanged += Children_CollectionChanged;

        }

        public HierarchyViewModel ParentHierarchyViewModel => _parentHierarchyViewModel;

        public Hierarchy Hierarchy { get => _hierarchy; }

        public bool DisableAutoSave
        {
            get => _disableAutoSave;
            set
            {
                if (_disableAutoSave != value)
                {
                    _disableAutoSave = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool IsSelected
        {
            get => _isSelected;
            set
            {
                if (_isSelected != value)
                {
                    _isSelected = value;
                    OnPropertyChanged();
                    OnIsSelectedChanged();
                }
            }
        }

        public bool IsExpanded
        {
            get => _isExpanded;
            set
            {
                if (_isExpanded != value)
                {
                    _isExpanded = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool IsDisabled
        {
            get => _hierarchy.IsDisabled || (_parentHierarchyViewModel?.IsDisabled ?? false);
            set
            {
                if (_hierarchy.IsDisabled != value)
                {
                    if (!HasErrors)
                    {
                        _hierarchy.IsDisabled = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                        OnIsDisabledChanged();
                    }
                }
            }
        }

        [Required]
        [MaxLength(255)]
        [CustomValidation(typeof(HierarchyViewModel), nameof(ValidateName))]
        public string Name
        {
            get => _hierarchy.Name;
            set
            {
                if (_hierarchy.Name != value)
                {
                    ValidateProperty(value, nameof(Name));
                    var errors = GetErrors(nameof(Name));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _hierarchy.Name = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(255)]
        public string? Description
        {
            get => _hierarchy.Description;
            set
            {
                if (_hierarchy.Description != value)
                {
                    ValidateProperty(value, nameof(Description));
                    var errors = GetErrors(nameof(Description));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _hierarchy.Description = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(-180, 180)]
        public float? Longitude
        {
            get => (float?)_hierarchy.Longitude;
            set
            {
                if (_hierarchy.Longitude != value)
                {
                    ValidateProperty(value, nameof(Longitude));
                    var errors = GetErrors(nameof(Longitude));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _hierarchy.Longitude = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(-90, 90)]
        public float? Latitude
        {
            get => (float?)_hierarchy.Latitude;
            set
            {
                if (_hierarchy.Latitude != value)
                {
                    ValidateProperty(value, nameof(Latitude));
                    var errors = GetErrors(nameof(Latitude));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _hierarchy.Latitude = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }

                }
            }
        }

        [Range(0, 19)]
        public int? DefaultZoomLevel
        {
            get => _hierarchy.DefaultZoomLevel;
            set
            {
                if (_hierarchy.DefaultZoomLevel != value)
                {

                    ValidateProperty(value, nameof(DefaultZoomLevel));
                    var errors = GetErrors(nameof(DefaultZoomLevel));
                    if (errors == null || !errors.Cast<object>().Any())
                        if (!HasErrors)
                        {
                            _hierarchy.DefaultZoomLevel = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                            OnPropertyChanged();
                        }
                }
            }
        }

        public ICommand RefreshCommand { get; }

        public ICommand AddNewCompanyCommand { get; }

        public ICommand AddNewDistrictCommand { get; }

        public ICommand AddNewAreaCommand { get; }

        public ICommand AddNewFieldCommand { get; }

        public ICommand AddNewFacilityCommand { get; }

        public ICommand AddNewWellCommand { get; }

        public ICommand AddNewRunSheetCommand { get; }

        public ICommand AddNewContextTagCommand { get; }

        public ICommand AddNewSerialPortChannelCommand { get; }

        public ICommand AddNewIpChannelCommand { get; }

        public ICommand AddNewDeviceCommand { get; }

        public ICommand AddNewAnalogIoTagCommand { get; }

        public ICommand AddNewDigitalIoTagCommand { get; }

        public ICommand AddNewStringIoTagCommand { get; }

        public ICommand AddNewMeterRunCommand { get; }

        public ICommand AddNewScreenCommand { get; }

        public ICommand AddNewDiagramCommand { get; }

        public ICommand AddNewDocumentCommand { get; }

        public ICommand AddNewFolderCommand { get; }

        public ICommand AddNewMeterCommand { get; }

        public ICommand AddNewPumpCommand { get; }

        public ICommand AddNewTankCommand { get; }

        public ICommand AddNewVesselCommand { get; }

        public ICommand AddNewEquipmentCommand { get; }

        public ICommand DeleteCommand { get; }

        public ObservableCollection<HierarchyViewModel> Children
        {
            get
            {
                if (!_isLoaded)
                {
                    LoadChildren();
                    _isLoaded = true;
                }

                return _children;
            }
        }

        public void LoadChildren()
        {
            if (IsDisabled)
            {
                return;
            }

            var dataService = Ioc.Default.GetService<IDataService>();
            var mainViewModel = Ioc.Default.GetService<MainViewModel>();

            if (dataService == null || mainViewModel == null)
            {
                return;
            }

            var childrenToAdd = new List<HierarchyViewModel>();
            var selectedNodeTypes = new List<Enums.NodeType>();

            switch (mainViewModel.TreeMode)
            {
                case TreeMode.Map:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Meter);
                    selectedNodeTypes.Add(Enums.NodeType.Pump);
                    selectedNodeTypes.Add(Enums.NodeType.Tank);
                    selectedNodeTypes.Add(Enums.NodeType.Vessel);
                    selectedNodeTypes.Add(Enums.NodeType.Equipment);
                    selectedNodeTypes.Add(Enums.NodeType.Folder);
                    break;
                case TreeMode.Measurement:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Meter);
                    break;
                case TreeMode.FieldDataCapture:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.RunSheet);
                    break;
                case TreeMode.SCADA:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.SerialPortChannel);
                    selectedNodeTypes.Add(Enums.NodeType.IpChannel);
                    selectedNodeTypes.Add(Enums.NodeType.Device);
                    selectedNodeTypes.Add(Enums.NodeType.AnalogIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.DigitalIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.StringIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.ContextTag);
                    selectedNodeTypes.Add(Enums.NodeType.MeterRun);
                    selectedNodeTypes.Add(Enums.NodeType.Screen);
                    break;
                case TreeMode.Schematics:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Diagram);
                    selectedNodeTypes.Add(Enums.NodeType.Document);
                    selectedNodeTypes.Add(Enums.NodeType.Folder);
                    break;
                case TreeMode.Setup:
                    selectedNodeTypes.Add(Enums.NodeType.System);
                    selectedNodeTypes.Add(Enums.NodeType.Company);
                    selectedNodeTypes.Add(Enums.NodeType.District);
                    selectedNodeTypes.Add(Enums.NodeType.Area);
                    selectedNodeTypes.Add(Enums.NodeType.Field);
                    selectedNodeTypes.Add(Enums.NodeType.Facility);
                    selectedNodeTypes.Add(Enums.NodeType.Well);
                    selectedNodeTypes.Add(Enums.NodeType.RunSheet);
                    selectedNodeTypes.Add(Enums.NodeType.SerialPortChannel);
                    selectedNodeTypes.Add(Enums.NodeType.IpChannel);
                    selectedNodeTypes.Add(Enums.NodeType.Device);
                    selectedNodeTypes.Add(Enums.NodeType.AnalogIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.DigitalIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.StringIoTag);
                    selectedNodeTypes.Add(Enums.NodeType.ContextTag);
                    selectedNodeTypes.Add(Enums.NodeType.MeterRun);
                    selectedNodeTypes.Add(Enums.NodeType.Screen);
                    selectedNodeTypes.Add(Enums.NodeType.MeterRun);
                    selectedNodeTypes.Add(Enums.NodeType.Diagram);
                    selectedNodeTypes.Add(Enums.NodeType.Document);
                    selectedNodeTypes.Add(Enums.NodeType.Folder);
                    selectedNodeTypes.Add(Enums.NodeType.Meter);
                    selectedNodeTypes.Add(Enums.NodeType.Pump);
                    selectedNodeTypes.Add(Enums.NodeType.Tank);
                    selectedNodeTypes.Add(Enums.NodeType.Vessel);
                    selectedNodeTypes.Add(Enums.NodeType.Equipment);
                    break;
            }

            foreach (var hierarchy in dataService.GetChildren(_hierarchy, selectedNodeTypes))
            {
                switch ((Enums.NodeType)hierarchy.NodeTypeId)
                {
                    case Enums.NodeType.Facility:
                        childrenToAdd.Add(new FacilityViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Well:
                        childrenToAdd.Add(new WellViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Equipment:
                        childrenToAdd.Add(new EquipmentViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Meter:
                        childrenToAdd.Add(new MeterViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Pump:
                        childrenToAdd.Add(new PumpViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Tank:
                        childrenToAdd.Add(new TankViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Vessel:
                        childrenToAdd.Add(new VesselViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.RunSheet:
                        childrenToAdd.Add(new RunSheetViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.SerialPortChannel:
                        childrenToAdd.Add(new SerialPortChannelViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.IpChannel:
                        childrenToAdd.Add(new IpChannelViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Device:
                        childrenToAdd.Add(new DeviceViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.DigitalIoTag:
                        childrenToAdd.Add(new DigitalIoTagViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.AnalogIoTag:
                        childrenToAdd.Add(new AnalogIoTagViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.StringIoTag:
                        childrenToAdd.Add(new StringIoTagViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.ContextTag:
                        childrenToAdd.Add(new ContextTagViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.MeterRun:
                        childrenToAdd.Add(new MeterRunViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Screen:
                        childrenToAdd.Add(new ScreenViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Diagram:
                        childrenToAdd.Add(new DiagramViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Document:
                        childrenToAdd.Add(new DocumentViewModel(this, hierarchy));
                        break;
                    case Enums.NodeType.Folder:
                        childrenToAdd.Add(new FolderViewModel(this, hierarchy));
                        break;
                    default:  // Company, District, Area, Field
                        childrenToAdd.Add(new HierarchyViewModel(this, hierarchy));
                        break;
                }
            }

            foreach (var child in childrenToAdd)
            {
                _children.Add(child);
            }
        }

        private void Children_CollectionChanged(object? sender, NotifyCollectionChangedEventArgs e)
        {
            switch (e.Action)
            {
                case NotifyCollectionChangedAction.Reset:
                    if (sender is ObservableCollection<HierarchyViewModel> children)
                    {
                        foreach (var child in children)
                        {
                            child.Dispose();
                        }
                    }
                    break;
                case NotifyCollectionChangedAction.Remove:
                    if (e.OldItems != null)
                    {
                        foreach (HierarchyViewModel child in e.OldItems)
                        {
                            child.Dispose();
                        }
                    }
                    break;
            }
        }

        public static ValidationResult ValidateName(string name, ValidationContext context)
        {
            HierarchyViewModel instance = (HierarchyViewModel)context.ObjectInstance;

            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                return new ValidationResult("Data service not found");
            }

            // Get the parent hierarchy (or level)
            var parentId = instance.ParentHierarchyViewModel.Hierarchy.Node;

            if (parentId == null)
            {
                return new ValidationResult("Parent hierarchy not found");
            }

            // Perform a check against the service/database for uniqueness within the level
            bool isUnique = dataService.IsNameUniqueWithinHierarchy(name, parentId);

            if (isUnique)
            {
                return ValidationResult.Success!;
            }

            return new ValidationResult("The name must be unique within the hierarchy level.");
        }

        private void OnIsDisabledChanged()
        {
            if (IsDisabled)
            {
                Children.Clear();
            }
            else
            {
                LoadChildren();
            }
        }

        private bool CanAddNewItem()
        {
            var mainViewModel = Ioc.Default.GetService<MainViewModel>();

            return mainViewModel?.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(mainViewModel.UserViewModel.User);
        }

        private void AddNewCompany()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewCompanyDialog();
        }

        private void AddNewDistrict()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewDistrictDialog(this);
        }

        private void AddNewArea()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewAreaDialog(this);
        }

        private void AddNewField()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewFieldDialog(this);
        }
        private void AddNewFacility()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewFacilityDialog(this);
        }

        private void AddNewWell()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewWellDialog(this);
        }

        private void AddNewRunSheet()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewRunSheetDialog(this);
        }

        private void AddNewContextTag()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewContextTagDialog(this);
        }

        private void AddNewSerialPortChannel()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewSerialPortChannelDialog(this);
        }

        private void AddNewIpChannel()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewIpChannelDialog(this);
        }

        private void AddNewDeviceTag()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewDeviceDialog(this);
        }

        private void AddNewAnalogIoTag()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewAnalogIoTagDialog(this);
        }

        private void AddNewDigitalIoTag()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewDigitalIoTagDialog(this);
        }

        private void AddNewStringIoTag()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewStringIoTagDialog(this);
        }

        private void AddNewMeterRun()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewMeterRunDialog(this);
        }

        private void AddNewScreen()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewScreenDialog(this);
        }

        private void AddNewDiagram()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewDiagramDialog(this);
        }
        private void AddNewDocument()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewDocumentDialog(this);
        }
        private void AddNewFolder()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewFolderDialog(this);
        }
        private void AddNewMeter()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewMeterDialog(this);
        }
        private void AddNewPump()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewPumpDialog(this);
        }
        private void AddNewTank()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewTankDialog(this);
        }
        private void AddNewVessel()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewVesselDialog(this);
        }
        private void AddNewEquipment()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowNewEquipmentDialog(this);
        }

        private void Refresh()
        {
            var mainViewModel = Ioc.Default.GetService<MainViewModel>();
            if (mainViewModel?.SystemHierarchyViewModel != null)
            {
                mainViewModel.SystemHierarchyViewModel.Children.Clear();
                mainViewModel.SystemHierarchyViewModel.LoadChildren();
            }
        }

        private bool CanDelete()
        {
            var mainViewModel = Ioc.Default.GetService<MainViewModel>();
            return mainViewModel?.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(mainViewModel.UserViewModel.User);
        }

        private void Delete()
        {
            Ioc.Default.GetService<IDialogService>()?.DeleteHierarchyNode(this);
        }

        public virtual void OnIsSelectedChanged()
        {
            
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Dispose managed resources
                _children.CollectionChanged -= Children_CollectionChanged;
                foreach (var child in _children)
                {
                    child.Dispose();
                }
            }
            // Free unmanaged resources if any
        }
    }
}
