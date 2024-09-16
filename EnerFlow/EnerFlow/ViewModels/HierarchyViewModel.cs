using EnerFlow.Commands;
using EnerFlow.Services;
using EnerFlow.Models;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Windows.Input;
using EnerFlow.Enums;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel : ViewModelBase, IDisposable
    {
        private bool _isLoaded = false;
        private readonly IDataService _dataService;
        private readonly MainViewModel _mainViewModel;
        private readonly IDialogService _dialogService;
        private readonly HierarchyViewModel _parentHierarchyViewModel;
        private readonly ObservableCollection<HierarchyViewModel> _children = new ObservableCollection<HierarchyViewModel>();
        private Hierarchy _hierarchy = null!;

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

            var poop = _dataService.GetChildren(_hierarchy);

            foreach (var hierarchy in poop)
            {
                _children.Add(new HierarchyViewModel(this, hierarchy));
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
            Debug.WriteLine(_hierarchy.Name);
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
                }
            }
            else
            {
                throw new ArgumentException("Invalid argument type", nameof(obj));
            }
        }

        private void ExecuteRefreshCommand(object? parameter)
        {
            if (_mainViewModel.RootHierarchyViewModel != null)
            {
                _mainViewModel.RootHierarchyViewModel.Children.Clear();
                _mainViewModel.RootHierarchyViewModel.LoadChildren();
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
