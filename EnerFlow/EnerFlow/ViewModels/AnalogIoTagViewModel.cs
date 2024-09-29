using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class AnalogIoTagViewModel : HierarchyViewModel
    {
        private readonly AnalogIoTag _analogIoTag = null!;

        public AnalogIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _analogIoTag = hierarchy.AnalogIoTags.First();
        }

        public AnalogIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, AnalogIoTag analogIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _analogIoTag = analogIoTag;
            analogIoTag.Hierarchy = hierarchy;
        }
    }
}
