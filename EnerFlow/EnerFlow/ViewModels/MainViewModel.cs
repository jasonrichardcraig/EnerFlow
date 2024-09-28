using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Enums;
using EnerFlow.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ObservableObject
    {
        private bool _isBusy;
        private HierarchyViewModel? _systemHierarchyViewModel;
        private UserViewModel? _userViewModel;
        private HierarchyViewModel? _selectedHierarchyViewModel;
        private DateTime _displayDateEnd = DateTime.Now.Date;
        private DateTime selectedDate = DateTime.Now.Date;
        private TreeMode _treeMode;
        private Func<string, Task<string>> _executeMapScriptAction = _ => Task.FromResult(string.Empty);
        private string _server = string.Empty;
        private string _database = string.Empty;

        public MainViewModel()
        {
            SearchCommand = new RelayCommand(Search);
        }

        public HierarchyViewModel? SelectedHierarchyViewModel
        {
            get { return _selectedHierarchyViewModel; }
            set
            {
                if (_selectedHierarchyViewModel != value)
                {
                    _selectedHierarchyViewModel = value;
                    OnSelectedHierarchyViewModelChanged();
                    OnPropertyChanged();
                }
            }
        }

        public TreeMode TreeMode
        {
            get { return _treeMode; }
            set
            {
                if (_treeMode != value)
                {
                    _treeMode = value;
                    OnTreeModeChanged();
                    OnPropertyChanged();
                }
            }
        }

        public DateTime DisplayDateEnd
        {
            get { return _displayDateEnd; }
            set
            {
                if (_displayDateEnd != value)
                {
                    _displayDateEnd = value;
                    OnPropertyChanged();
                }
            }
        }

        public DateTime SelectedDate
        {
            get { return selectedDate; }
            set
            {
                if (selectedDate != value)
                {
                    selectedDate = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool IsBusy
        {
            get { return _isBusy; }
            set
            {
                if (_isBusy != value)
                {
                    _isBusy = value;
                    OnPropertyChanged();
                }
            }
        }

        public HierarchyViewModel SystemHierarchyViewModel
        {
            get { return _systemHierarchyViewModel!; }
            set
            {
                if (_systemHierarchyViewModel != value)
                {
                    _systemHierarchyViewModel = value;
                    OnPropertyChanged();
                }
            }
        }

        public UserViewModel? UserViewModel // Added UserViewModel property
        {
            get { return _userViewModel; }
            set
            {
                if (_userViewModel != value)
                {
                    _userViewModel = value;
                    OnPropertyChanged();
                }
            }
        }

        public string Server // Added Server property
        {
            get { return _server; }
            set
            {
                if (_server != value)
                {
                    _server = value;
                    OnPropertyChanged();
                }
            }
        }

        public string Database // Added Database property
        {
            get { return _database; }
            set
            {
                if (_database != value)
                {
                    _database = value;
                    OnPropertyChanged();
                }
            }
        }

        public ICommand SearchCommand { get; }

        private void OnTreeModeChanged()
        {
            var currentSelectedHierarchyNode = SelectedHierarchyViewModel?.Hierarchy.Node;

            SystemHierarchyViewModel.RefreshCommand.Execute(null);

            if (currentSelectedHierarchyNode != null)
            {
                SelectAndExpandNode(SystemHierarchyViewModel, currentSelectedHierarchyNode);
            }
        }

        private void OnSelectedHierarchyViewModelChanged()
        {
            if (SelectedHierarchyViewModel != null)
            {

                if (TreeMode == TreeMode.Map && SelectedHierarchyViewModel.Hierarchy.Latitude != null && SelectedHierarchyViewModel.Hierarchy.Longitude != null && SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel != null)
                {
                    switch ((NodeType)SelectedHierarchyViewModel.Hierarchy.NodeTypeId)
                    {
                        case NodeType.System:
                        case NodeType.Company:
                        case NodeType.District:
                        case NodeType.Area:
                        case NodeType.Field:
                            _executeMapScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            break;
                        case NodeType.Facility:
                            _executeMapScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            _executeMapScriptAction?.Invoke($"addMarker({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, \"{SelectedHierarchyViewModel.Name}\");");
                            break;
                    }
                }

                switch ((NodeType)SelectedHierarchyViewModel.Hierarchy.NodeTypeId)
                {
                    case NodeType.System:
                        break;
                    case NodeType.Company:
                        break;
                }
            }
        }

        private void Search()
        {
            var dialogService = Ioc.Default.GetService<IDialogService>();

            if (dialogService == null)
            {
                return;
            }

            dialogService.ShowSearchDialog();
        }

        public void SetExecuteMapScriptAction(Func<string, Task<string>> executeMapScriptAction)
        {
            _executeMapScriptAction = executeMapScriptAction;
        }

        public static bool SelectAndExpandNode(HierarchyViewModel hierarchyViewModel, HierarchyId targetNode)
        {
            if (hierarchyViewModel == null || targetNode == null)
                return false;

            int currentLevel = hierarchyViewModel.Hierarchy.Node.GetLevel();
            int targetLevel = targetNode.GetLevel();

            // If the target node is at a higher level (smaller level number), it cannot be a descendant
            if (targetLevel < currentLevel)
                return false;

            // If the current node is the target node
            if (hierarchyViewModel.Hierarchy.Node.Equals(targetNode))
            {
                hierarchyViewModel.IsSelected = true;
                hierarchyViewModel.IsExpanded = true;
                return true;
            }

            // If the target node is a descendant of the current node
            if (targetNode.IsDescendantOf(hierarchyViewModel.Hierarchy.Node))
            {
                // Expand and load children
                hierarchyViewModel.IsExpanded = true;
                if (!hierarchyViewModel.Children.Any())
                {
                    hierarchyViewModel.LoadChildren();
                }

                foreach (var child in hierarchyViewModel.Children)
                {
                    if (SelectAndExpandNode(child, targetNode))
                    {
                        hierarchyViewModel.IsExpanded = true;
                        return true;
                    }
                }
            }

            return false;
        }
    }
}
