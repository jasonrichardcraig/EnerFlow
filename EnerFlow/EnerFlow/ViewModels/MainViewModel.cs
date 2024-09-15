using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Extensions.DependencyInjection;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        private bool _isBusy;
        private DialogService? _dialogService;
        private HierarchyViewModel? _rootHierarchyViewModel;
        private UserViewModel? _userViewModel; // Added UserViewModel property
        private string _userName = string.Empty; // Initialize _userName to avoid CS8618
        private string _server = string.Empty; // Added Server property
        private string _database = string.Empty; // Added Database property


        public MainViewModel()
        {

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

        public HierarchyViewModel? RootHierarchyViewModel
        {
            get { return _rootHierarchyViewModel; }
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
    }
}
