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

        private FacilityType _selectdFacilityType = null!;

        public FacilityViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _facility = hierarchy.Facilities.First();

            _selectdFacilityType = _facility.FacilitySubType?.FacilityType ?? FacilityTypes.First();

        }

        public List<FacilityType> FacilityTypes => _dataService.Context.FacilityTypes.ToList();

        public FacilityType SelectedFacilityType
        {
            get => _selectdFacilityType;
            set
            {
                if (_selectdFacilityType != value)
                {
                    _selectdFacilityType = value;
                    OnPropertyChanged();
                }
            }
        }

        public FacilityType? FacilityType => _facility.FacilitySubType?.FacilityType;

        public FacilitySubType? FacilitySubType
        {
            get => _facility.FacilitySubType;
            set
            {
                if (_facility.FacilitySubType != value)
                {
                    _facility.FacilitySubType = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }
    }
}
