using EnerFlow.Commands;
using EnerFlow.Interfaces;
using EnerFlow.Models;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel : ViewModelBase, IDisposable
    {
        private bool _isLoaded = false;
        private readonly IDataService _dataService;
        private readonly MainViewModel _mainViewModel;
        private readonly HierarchyViewModel _parentHierarchyViewModel;
        private readonly ObservableCollection<HierarchyViewModel> _children = new ObservableCollection<HierarchyViewModel>();
        private Hierarchy _hierarchy = null!;

        public HierarchyViewModel(HierarchyViewModel parentHierarchyViewModel, IDataService dataService, MainViewModel mainViewModel, Hierarchy hierarchy)
        {
            _parentHierarchyViewModel = parentHierarchyViewModel;
            _dataService = dataService;
            _mainViewModel = mainViewModel;
            _hierarchy = hierarchy;

            RefreshCommand = new RelayCommand(ExecuteRefreshCommand);

            _children.CollectionChanged += Children_CollectionChanged;

        }

        public Hierarchy Hierarchy { get => _hierarchy; }

        public string Name { get => _hierarchy.Name; }

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
            var showHiddenItems = _mainViewModel.ShowHiddenItems;
            var hierarchies = _dataService.GetChildren(_hierarchy).Where(h => !h.IsHidden || showHiddenItems).ToList();

            foreach (var hierarchy in hierarchies)
            {
                _children.Add(new HierarchyViewModel(this, _dataService, _mainViewModel, hierarchy));
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
        private void ExecuteRefreshCommand(object? parameter)
        {
            if (_mainViewModel.RootHierarchyViewModel != null)
            {
                _mainViewModel.RootHierarchyViewModel.Children.Clear();
                _mainViewModel.RootHierarchyViewModel.LoadChildren();
            }
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
