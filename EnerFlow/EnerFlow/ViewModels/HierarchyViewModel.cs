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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                        OnIsDisabledChanged();
                    }
                }
            }
        }

        [Required]
        [MaxLength(255)]
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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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

        public ICommand AddNewSerialPortChannelTagCommand { get; }

        public ICommand AddNewIpChannelTagCommand { get; }

        public ICommand AddNewDeviceTagCommand { get; }

        public ICommand AddNewAnalogIoTagCommand { get; }

        public ICommand AddNewDigitalIoTagCommand { get; }

        public ICommand AddNewStringIoTagCommand { get; }

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

            foreach (var hierarchy in dataService.GetChildren(_hierarchy))
            {
                switch (hierarchy.NodeTypeId)
                {
                    case (int)Enums.NodeType.Facility:
                        childrenToAdd.Add(new FacilityViewModel(this, hierarchy));
                        break;
                    case (int)Enums.NodeType.Well:
                        childrenToAdd.Add(new WellViewModel(this, hierarchy));
                        break;
                    case (int)Enums.NodeType.RunSheet:
                        if (mainViewModel.TreeMode == TreeMode.Setup)
                        {
                            childrenToAdd.Add(new RunSheetViewModel(this, hierarchy));
                        }
                        break;
                    case (int)Enums.NodeType.ContextTag:
                        if (mainViewModel.TreeMode == TreeMode.Setup)
                        {
                            childrenToAdd.Add(new ContextTagViewModel(this, hierarchy));
                        }
                        break;
                    default:
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
