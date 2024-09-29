using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class PumpViewModel : HierarchyViewModel
    {
        private readonly Pump _pump = null!;
        public PumpViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _pump = hierarchy.Pumps.First();
        }

        public PumpViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Pump pump) : base(parentHierarchyViewModel, hierarchy)
        {
            _pump = pump;
            pump.Hierarchy = hierarchy;
        }
    }
}
