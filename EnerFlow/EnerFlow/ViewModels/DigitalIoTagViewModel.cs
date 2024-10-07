using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class DigitalIoTagViewModel : HierarchyViewModel
    {
        private readonly DigitalIoTag _digitalIoTag = null!;

        public DigitalIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _digitalIoTag = hierarchy.DigitalIoTags.First();
        }

        public DigitalIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, DigitalIoTag digitalIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _digitalIoTag = digitalIoTag;
            digitalIoTag.Hierarchy = hierarchy;
        }


    }
}
