using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Commands;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Extensions.DependencyInjection;
using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.Metrics;
using System.Windows.Controls;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel : ObservableValidator, IDisposable
    {
        private bool _isLoaded = false;
        private bool _isSelected;
        private bool _isExpanded;
        protected readonly IDataService _dataService;
        protected readonly MainViewModel _mainViewModel;
        protected readonly IDialogService _dialogService;
        protected readonly HierarchyViewModel _parentHierarchyViewModel;
        protected readonly ObservableCollection<HierarchyViewModel> _children = [];
        protected Hierarchy _hierarchy = null!;

        public HierarchyViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy)
        {
            _parentHierarchyViewModel = parentHierarchyViewModel;
            _dataService = App.ServiceProvider?.GetService<IDataService>() ?? throw new InvalidOperationException("Data Service is not available.");
            _dialogService = App.ServiceProvider?.GetService<IDialogService>() ?? throw new InvalidOperationException("Dialog Service is not available.");
            _mainViewModel = App.ServiceProvider?.GetService<MainViewModel>() ?? throw new InvalidOperationException("MainViewModel is not available.");
            _hierarchy = hierarchy;

            RefreshCommand = new RelayCommand(Refresh);
            AddNewCompanyCommand = new RelayCommand(AddNewCompany, CanAddNewItem);
            AddNewDistrictCommand = new RelayCommand(AddNewDistrict, CanAddNewItem);
            AddNewAreaCommand = new RelayCommand(AddNewArea, CanAddNewItem);
            AddNewFieldCommand = new RelayCommand(AddNewField, CanAddNewItem);
            AddNewFacilityCommand = new RelayCommand(AddNewFacility, CanAddNewItem);
            DeleteCommand = new RelayCommand(Delete, CanDelete);

            _children.CollectionChanged += Children_CollectionChanged;

        }

        public HierarchyViewModel ParentHierarchyViewModel => _parentHierarchyViewModel;

        public Hierarchy Hierarchy { get => _hierarchy; }

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

        public IEnumerable GetValidationErrors(string propertyName)
        {
            return GetErrors(propertyName);
        }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Name is required" )]
        public string Name
        {
            get => _hierarchy.Name;
            set
            {
                if (_hierarchy.Name != value)
                {
                    SetProperty<string>(_hierarchy.Name, value, (newValue) => { _hierarchy.Name = newValue; }, true);
                    if(!HasErrors)
                    {
                        _dataService.Context.SaveChanges();                        
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
                    SetProperty<string>(_hierarchy.Description!, value!, (newValue) => { _hierarchy.Description= newValue; }, true);
                    if (!HasErrors)
                    {
                        _dataService.Context.SaveChanges();
                    }
                }
            }
        }

        public float? Longitude
        {
            get => (float?)_hierarchy.Longitude;
            set
            {
                if (_hierarchy.Longitude != value)
                {
                    _hierarchy.Longitude = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public float? Latitude
        {
            get => (float?)_hierarchy.Latitude;
            set
            {
                if (_hierarchy.Latitude != value)
                {
                    _hierarchy.Latitude = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public int? DefaultZoomLevel
        {
            get => _hierarchy.DefaultZoomLevel;
            set
            {
                if (_hierarchy.DefaultZoomLevel != value)
                {
                    _hierarchy.DefaultZoomLevel = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public bool IsDisabled
        {
            get => _hierarchy.IsDisabled;
            set
            {
                if (_hierarchy.IsDisabled != value)
                {
                    _hierarchy.IsDisabled = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public ICommand RefreshCommand { get; }

        public ICommand AddNewCompanyCommand { get; }

        public ICommand AddNewDistrictCommand { get; }

        public ICommand AddNewAreaCommand { get; }

        public ICommand AddNewFieldCommand { get; }

        public ICommand AddNewFacilityCommand { get; }

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
            foreach (var hierarchy in _dataService.GetChildren(_hierarchy))
            {

                switch (hierarchy.NodeTypeId)
                {
                    case (byte)HierarchyNodeType.Facility:
                        _children.Add(new FacilityViewModel(this, hierarchy));
                        break;
                    default:
                        _children.Add(new HierarchyViewModel(this, hierarchy));
                        break;
                }
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

        private bool CanAddNewItem()
        {
            return _mainViewModel.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(_mainViewModel.UserViewModel.User);
        }

        private void AddNewCompany()
        {
            _dialogService?.ShowNewCompanyDialog();
        }

        private void AddNewDistrict()
        {
            _dialogService?.ShowNewDistrictDialog(this);
        }

        private void AddNewArea()
        {
            _dialogService?.ShowNewAreaDialog(this);
        }

        private void AddNewField()
        {
            _dialogService?.ShowNewFieldDialog(this);
        }
        private void AddNewFacility()
        {
            _dialogService?.ShowNewFacilityDialog(this);
        }

        private void Refresh()
        {
            if (_mainViewModel.SystemHierarchyViewModel != null)
            {
                _mainViewModel.SystemHierarchyViewModel.Children.Clear();
                _mainViewModel.SystemHierarchyViewModel.LoadChildren();
            }
        }

        private bool CanDelete()
        {
            return _mainViewModel.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(_mainViewModel.UserViewModel.User);
        }

        private void Delete()
        {
            _dialogService.DeleteHierarchyNode(this);
        }

        public void Dispose()
        {
            _children.CollectionChanged -= Children_CollectionChanged;

            foreach (var child in _children)
            {
                child.Dispose();
            }

            GC.SuppressFinalize(this);
        }
    }
}
