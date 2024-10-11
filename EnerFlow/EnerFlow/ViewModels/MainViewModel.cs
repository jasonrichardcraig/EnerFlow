using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Messages;
using EnerFlow.Services;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Web.WebView2.Core;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Windows;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ObservableObject
    {
        private bool _isBusy;
        private Uri _mapWebViewSource;
        private HierarchyViewModel? _systemHierarchyViewModel;
        private UserViewModel? _userViewModel;
        private HierarchyViewModel? _selectedHierarchyViewModel;
        private DateTime _displayDateEnd = DateTime.Now.Date;
        private DateTime selectedDate = DateTime.Now.Date;
        private TreeMode _treeMode;
        private Func<string, Task<string>> _executeMapWebViewScriptAction = _ => Task.FromResult(string.Empty);
        private string _server = string.Empty;
        private string _database = string.Empty;

        public MainViewModel(IDataService dataService)
        {
            IsBusy = true;

            dataService.Context = new EnerFlowContext();

            // Event subscriptions
            dataService.Context.SavingChanges += OnSavingChanges!;
            dataService.Context.SavedChanges += OnSavedChanges!;
            dataService.Context.SaveChangesFailed += (sender, e) => IsBusy = false;
            AuthenticateUser();
            LoadStatusBarData();
            LoadAssociatedData();

            _mapWebViewSource = new Uri(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/Map.html"));

            SearchCommand = new RelayCommand(Search);
            CloseCommand = new RelayCommand(CloseWindow);
            HandleTreeKeyUpCommand = new RelayCommand<KeyEventArgs>(OnTreeKeyUp);
            HandleWindowKeyDownCommand = new RelayCommand<KeyEventArgs>(OnWindowKeyDown);
            HandleSelectedTreeItemChanged = new RelayCommand<RoutedPropertyChangedEventArgs<object>>(OnSelectedTreeItemItemChanged);
            HandleMapWebViewNavigationCompleted = new RelayCommand<CoreWebView2NavigationCompletedEventArgs?>(OnMapWebViewNavigationCompleted);
            HandleMapWebViewWebMessageReceived = new RelayCommand<CoreWebView2WebMessageReceivedEventArgs?>(OnMapWebViewWebMessageReceived);
            SystemHierarchyViewModel = new HierarchyViewModel(null!, dataService.GetSystemHierarchy());
            SelectedHierarchyViewModel = SystemHierarchyViewModel;
            TreeMode = TreeMode.Map;

            IsBusy = false;

        }

        public ICommand CloseCommand { get; }
        public ICommand HandleTreeKeyUpCommand { get; }
        public ICommand HandleWindowKeyDownCommand { get; }
        public ICommand HandleSelectedTreeItemChanged { get; }
        public ICommand HandleMapWebViewNavigationCompleted { get; }
        public ICommand HandleMapWebViewWebMessageReceived { get; }

        private void AuthenticateUser()
        {
            var currentUser = Ioc.Default.GetService<IDataService>()!.Context.Users.FirstOrDefault(u => u.UserName == Environment.UserName) ?? throw new Exception("User does not exist in the database.");

            UserViewModel = new UserViewModel(currentUser);

            // Check if the user has access
            if (!Security.SecurityChecker.HasAccess(currentUser))
            {
                Ioc.Default.GetService<IDialogService>()!.ShowWarningDialog("You do not have access to this application.", "Access Denied");
                CloseWindow();
            }
        }

        private void LoadStatusBarData()
        {
            var sqlConnectionStringBuilder = new SqlConnectionStringBuilder(Properties.Settings.Default.DatabaseConnectionString);
            Server = sqlConnectionStringBuilder.DataSource;
            Database = sqlConnectionStringBuilder.InitialCatalog;
        }

        public static void LoadAssociatedData()
        {
            var dataService = Ioc.Default.GetService<IDataService>()!;

            // Load associated data
            dataService.Context.FacilityTypes.Load();
            dataService.Context.FacilitySubTypes.Load();
            dataService.Context.EnergyDevelopmentCategoryTypes.Load();
            dataService.Context.EquipmentTypes.Load();
            dataService.Context.EquipmentSubTypes.Load();
            dataService.Context.EquipmentStatuses.Load();
            dataService.Context.WasteLocationTypes.Load();
            dataService.Context.TagValueEnumerations.Load();
            dataService.Context.TagValueEnumerationConstants.Load();
            dataService.Context.AlarmPriorities.Load();
            dataService.Context.StringIoTagTrendValueDictionaries.Load();
            dataService.Context.StringIoTagTrendValueDictionaryItems.Load();
            dataService.Context.TagValueEnumerations.Load();
            dataService.Context.UnitClasses.Load();
            dataService.Context.Units.Load();
        }

        private void OnSavingChanges(object sender, SavingChangesEventArgs e)
        {
            IsBusy = true;
        }

        private void OnSavedChanges(object sender, SavedChangesEventArgs e)
        {
            IsBusy = false;
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

        public Uri MapWebViewSource
        {
            get => _mapWebViewSource;
            set
            {
                _mapWebViewSource = value;
                OnPropertyChanged();
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
                            _executeMapWebViewScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            break;
                        case NodeType.Facility:
                            _executeMapWebViewScriptAction?.Invoke($"updateMap({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, {SelectedHierarchyViewModel.Hierarchy.DefaultZoomLevel});");
                            _executeMapWebViewScriptAction?.Invoke($"addMarker({SelectedHierarchyViewModel.Hierarchy.Latitude}, {SelectedHierarchyViewModel.Hierarchy.Longitude}, \"{SelectedHierarchyViewModel.Name}\");");
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

        private void OnSelectedTreeItemItemChanged(RoutedPropertyChangedEventArgs<object>? e)
        {
            if (e?.NewValue is HierarchyViewModel hierarchyViewModel)
            {
                SelectedHierarchyViewModel = hierarchyViewModel;
            }
        }

        private void OnMapWebViewWebMessageReceived(CoreWebView2WebMessageReceivedEventArgs? args)
        {
            
        }

        private void OnMapWebViewNavigationCompleted(CoreWebView2NavigationCompletedEventArgs? e)
        {

        }

        private void Search()
        {
            var dialogService = Ioc.Default.GetService<IDialogService>()!;
            dialogService.ShowSearchDialog();
        }

        private void OnTreeKeyUp(KeyEventArgs? e)
        {
            if (e?.Key == Key.Delete)
            {
                SelectedHierarchyViewModel?.DeleteCommand?.Execute(null);
            }
        }

        private void OnWindowKeyDown(KeyEventArgs? e)
        {
            if (e?.Key == Key.F3)
            {
                Search();
            }
        }

        public void SetExecuteMapWebViewScriptAction(Func<string, Task<string>> executeMapScriptAction)
        {
            _executeMapWebViewScriptAction = executeMapScriptAction;
        }

        private void CloseWindow()
        {
            WeakReferenceMessenger.Default.Send(new CloseWindowMessage());
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
