using EnerFlow.Interfaces;
using EnerFlow.Models;
using System.Collections.ObjectModel;

namespace EnerFlow.ViewModels
{
    public class HierarchyViewModel
    {
        private readonly IDataService _dataService;
        private Hierarchy _hierarchy = null!;

        public HierarchyViewModel(IDataService dataService, Hierarchy hierarchy)
        {
            _dataService = dataService;
            _hierarchy = hierarchy;

        }

        public Hierarchy Hierarchy { get => _hierarchy; }

        public string Name { get => _hierarchy.Name; }

        public IEnumerable<HierarchyViewModel> Children
        {
            get
            {
                return _dataService.GetChildren(_hierarchy).Select(h => new HierarchyViewModel(_dataService, h));
            }
        }

    }
}
