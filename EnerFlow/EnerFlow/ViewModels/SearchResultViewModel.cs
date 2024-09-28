using CommunityToolkit.Mvvm.ComponentModel;
using EnerFlow.Models;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.ViewModels
{
    public partial class SearchResultViewModel(SearchResult searchResult) : ObservableObject
    {
        private readonly SearchResult _searchResult = searchResult;

        public int Id => _searchResult.Id;

        public HierarchyId Node => _searchResult.Node!;

        public Enums.NodeType NodeType => _searchResult.NodeType;

        public string Name => _searchResult.Name;

        public string Description => _searchResult.Description;

        public SearchResult SearchResult => _searchResult;
    }
}
