using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        private bool _isBusy;
        private Hierarchy? _rootHierarchy;
        private string _userName = string.Empty; // Initialize _userName to avoid CS8618
        private string _server = string.Empty; // Added Server property
        private string _database = string.Empty; // Added Database property

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

        public Hierarchy? RootHierarchy
        {
            get { return _rootHierarchy; }
            set
            {
                if (_rootHierarchy != value)
                {
                    _rootHierarchy = value;
                    OnPropertyChanged();
                }
            }
        }

        public string UserName // Added UserName property
        {
            get { return _userName; }
            set
            {
                if (_userName != value)
                {
                    _userName = value;
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
