using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class FacilityViewModel : HierarchyViewModel
    {

        private Facility _facility = null!;

        public FacilityViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _facility = hierarchy.Facilities.First();
        }
    }
}
