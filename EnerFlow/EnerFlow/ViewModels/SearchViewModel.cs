using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Services;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Threading;

namespace EnerFlow.ViewModels
{
    public class SearchViewModel : ObservableObject
    {
        private bool _isSearching;
        private string _searchText = "";
        private readonly ObservableCollection<SearchResultViewModel> _searchResultViewModels = [];

        public string SearchText
        {
            get => _searchText;
            set
            {
                SetProperty(ref _searchText, value);
                OnSearchTextChanged();
            }
        }

        public bool IsSearching
        {
            get => _isSearching;
            set => SetProperty(ref _isSearching, value);
        }

        private void OnSearchTextChanged()
        {
            IsSearching = true;

            Task.Run(() =>
            {
                Application.Current.Dispatcher.Invoke(() =>
                {
                    SearchResultViewModels.Clear();
                });

                Ioc.Default.GetService<IDataService>()?.Search(SearchText, (searchResults) =>
                {
                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        SearchResultViewModels.Clear();
                        foreach (var searchResult in searchResults)
                        {
                            SearchResultViewModels.Add(new SearchResultViewModel(searchResult));
                        }
                        IsSearching = false;
                    });
                });
            });
        }

        public ObservableCollection<SearchResultViewModel> SearchResultViewModels => _searchResultViewModels;

    }
}
