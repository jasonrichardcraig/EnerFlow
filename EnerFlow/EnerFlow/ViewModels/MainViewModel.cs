using CommunityToolkit.Mvvm.ComponentModel;
using EnerFlow.Enums;
using EnerFlow.Services;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ObservableObject
    {
        private bool _isBusy;
        private DialogService? _dialogService;
        private HierarchyViewModel? _systemHierarchyViewModel;
        private UserViewModel? _userViewModel;
        private HierarchyViewModel? _selectedHierarchyViewModel;
        private DateTime _displayDateEnd = DateTime.Now.Date;
        private DateTime selectedDate = DateTime.Now.Date;
        private int _selectedTabIndex = 1;
        private bool _showMapTab;
        private bool _showSetupTab;
        private bool _showDataEntryTab;
        private TreeMode _treeMode;
        private Func<string, Task<string>> _executeMapScriptAction = _ => Task.FromResult(string.Empty);
        private string _server = string.Empty;
        private string _database = string.Empty;

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
                    switch ((HierarchyNodeType)SelectedHierarchyViewModel.Hierarchy.NodeTypeId)
                    {
                        case HierarchyNodeType.System:
                        case HierarchyNodeType.Company:
                        case HierarchyNodeType.District:
                        case HierarchyNodeType.Area:
                        case HierarchyNodeType.Field:
                            _executeMapScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            break;
                        case HierarchyNodeType.Facility:
                            _executeMapScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            _executeMapScriptAction?.Invoke($"addMarker({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, \"{SelectedHierarchyViewModel.Name}\");");
                            break;
                    }
                }

                switch ((HierarchyNodeType)SelectedHierarchyViewModel.Hierarchy.NodeTypeId)
                {
                    case HierarchyNodeType.System:
                        break;
                    case HierarchyNodeType.Company:
                        break;
                }
            }
        }

        public void SetExecuteMapScriptAction(Func<string, Task<string>> executeMapScriptAction)
        {
            _executeMapScriptAction = executeMapScriptAction;
        }

    }
}
