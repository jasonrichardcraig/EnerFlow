using EnerFlow.Commands;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Forms;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        private bool _isBusy;
        private DialogService? _dialogService;
        private HierarchyViewModel? _rootHierarchyViewModel;
        private UserViewModel? _userViewModel;
        private HierarchyViewModel? _selectedHierarchyViewModel;
        private DateTime _displayDateEnd = DateTime.Now.Date;
        private DateTime selectedDate = DateTime.Now.Date;
        private int _selectedTabIndex = 1;
        private bool _showMapTab;
        private bool _showSetupTab;
        private bool _showDataEntryTab;
        private TreeMode _treeMode;
        private Action<string> _executeMapScriptAction = _ => { }; // Initialize with a default action
        private string _userName = string.Empty;
        private string _server = string.Empty;
        private string _database = string.Empty;

        public MainViewModel()
        {
            ExecuteMapScriptCommand = new DelegateCommand(OnExecuteMapScript);
        }

        public ICommand ExecuteMapScriptCommand { get; }

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

        public int SelectedTabIndex
        {
            get { return _selectedTabIndex; }
            set
            {
                if (_selectedTabIndex != value)
                {
                    _selectedTabIndex = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool ShowMapTab
        {
            get { return _showMapTab; }
            set
            {
                if (_showMapTab != value)
                {
                    _showMapTab = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool ShowSetupTab
        {
            get { return _showSetupTab; }
            set
            {
                if (_showSetupTab != value)
                {
                    _showSetupTab = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool ShowDataEntryTab
        {
            get { return _showDataEntryTab; }
            set
            {
                if (_showDataEntryTab != value)
                {
                    _showDataEntryTab = value;
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

        public DialogService? DialogService
        {
            get { return _dialogService; }
            set
            {
                if (_dialogService != value)
                {
                    _dialogService = value;
                    OnPropertyChanged();
                }
            }
        }

        public HierarchyViewModel RootHierarchyViewModel
        {
            get { return _rootHierarchyViewModel!; }
            set
            {
                if (_rootHierarchyViewModel != value)
                {
                    _rootHierarchyViewModel = value;
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

        private void OnTreeModeChanged()
        {
            switch (TreeMode)
            {
                case TreeMode.Map:
                    ShowMapTab = true;
                    ShowSetupTab = false;
                    ShowDataEntryTab = false;
                    SelectedTabIndex = 0;
                    break;
                case TreeMode.Setup:
                    ShowMapTab = false;
                    ShowSetupTab = true;
                    ShowDataEntryTab = false;
                    SelectedTabIndex = 1;
                    break;
                case TreeMode.DataEntry:
                    ShowMapTab = false;
                    ShowSetupTab = false;
                    ShowDataEntryTab = true;
                    SelectedTabIndex = 2;
                    break;
            }
        }

        private void OnSelectedHierarchyViewModelChanged()
        {
            if (SelectedHierarchyViewModel != null)
            {
                if (TreeMode == TreeMode.Map && SelectedHierarchyViewModel.Hierarchy.Latitude != null && SelectedHierarchyViewModel.Hierarchy.Longitude != null && SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel != null)
                {
                    _executeMapScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                }

                switch ((HierarchyNodeType)SelectedHierarchyViewModel.Hierarchy.NodeTypeId)
                {
                    case HierarchyNodeType.Root:
                        break;
                    case HierarchyNodeType.Company:
                        break;
                }
            }
        }

        public void SetExecuteScriptAction(Action<string> executeScriptAction)
        {
            _executeMapScriptAction = executeScriptAction;
        }

        private void OnExecuteMapScript()
        {
            // This is where we call the script in the view via the action.
            _executeMapScriptAction?.Invoke("'example'");
        }

    }
}
