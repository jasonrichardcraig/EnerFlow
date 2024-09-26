using EnerFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.ViewModels
{
    public class RunSheetViewModel : HierarchyViewModel
    {

        private readonly RunSheet _runSheet = null!;

        public RunSheetViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _runSheet = hierarchy.RunSheets.First();
        }

        public RunSheetViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, RunSheet runSheet) : base(parentHierarchyViewModel, hierarchy)
        {
            _runSheet = runSheet;
            runSheet.Hierarchy = hierarchy;

        }
    }
}
