using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class EquipmentViewModel : HierarchyViewModel
    {
        private readonly Equipment _equipment = null!;
        public EquipmentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _equipment = hierarchy.Equipment.First();
        }

        public EquipmentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Equipment equipment) : base(parentHierarchyViewModel, hierarchy)
        {
            _equipment = equipment;
            equipment.Hierarchy = hierarchy;
        }
    }
}
