using EnerFlow.Commands;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel : ViewModelBase, IDisposable
    {
        private bool _isLoaded = false;
        private bool _isSelected;
        private bool _isExpanded;
        protected readonly IDataService _dataService;
        protected readonly MainViewModel _mainViewModel;
        protected readonly IDialogService _dialogService;
        protected readonly HierarchyViewModel _parentHierarchyViewModel;
        protected readonly ObservableCollection<HierarchyViewModel> _children = new ObservableCollection<HierarchyViewModel>();
        protected Hierarchy _hierarchy = null!;

        public HierarchyViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy)
        {
            _parentHierarchyViewModel = parentHierarchyViewModel;
            _dataService = App.ServiceProvider?.GetService<IDataService>() ?? throw new InvalidOperationException("Data Service is not available.");
            _dialogService = App.ServiceProvider?.GetService<IDialogService>() ?? throw new InvalidOperationException("Dialog Service is not available.");
            _mainViewModel = App.ServiceProvider?.GetService<MainViewModel>() ?? throw new InvalidOperationException("MainViewModel is not available.");
            _hierarchy = hierarchy;

            RefreshCommand = new RelayCommand(ExecuteRefreshCommand);
            AddNewItemCommand = new RelayCommand(ExecuteAddNewItemCommand, CanExecuteAddNewItemCommand);
            DeleteItemCommand = new RelayCommand(ExecuteDeleteItemCommand, CanExecuteDeleteItemCommand);

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

        public string Name
        {
            get => _hierarchy.Name;
            set
            {
                if (_hierarchy.Name != value)
                {
                    _hierarchy.Name = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? Description
        {
            get => _hierarchy.Description;
            set
            {
                if (_hierarchy.Description != value)
                {
                    _hierarchy.Description = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
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

        public ICommand AddNewItemCommand { get; }

        public ICommand DeleteItemCommand { get; }

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

                switch(hierarchy.NodeTypeId)
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

        private bool CanExecuteAddNewItemCommand(object? arg)
        {
            return _mainViewModel.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(_mainViewModel.UserViewModel.User);
        }

        private void ExecuteAddNewItemCommand(object? obj)
        {
            if (obj is string itemType)
            {
                switch (itemType)
                {
                    case nameof(HierarchyNodeType.Company):
                        _dialogService?.ShowNewCompanyDialog();
                        break;
                    case nameof(HierarchyNodeType.District):
                        _dialogService?.ShowNewDistrictDialog(this);
                        break;
                    case nameof(HierarchyNodeType.Area):
                        _dialogService?.ShowNewAreaDialog(this);
                        break;
                    case nameof(HierarchyNodeType.Field):
                        _dialogService?.ShowNewFieldDialog(this);
                        break;
                }
            }
            else
            {
                throw new ArgumentException("Invalid argument type", nameof(obj));
            }
        }

        private void ExecuteRefreshCommand(object? parameter)
        {
            if (_mainViewModel.SystemHierarchyViewModel != null)
            {
                _mainViewModel.SystemHierarchyViewModel.Children.Clear();
                _mainViewModel.SystemHierarchyViewModel.LoadChildren();
            }
        }

        private bool CanExecuteDeleteItemCommand(object? arg)
        {
            return _mainViewModel.UserViewModel != null && Security.SecurityChecker.HasModifyTreeItemPermission(_mainViewModel.UserViewModel.User);
        }

        private void ExecuteDeleteItemCommand(object? obj)
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
        }
    }
}
