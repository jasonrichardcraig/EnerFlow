using EnerFlow.Models;

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

       public List<EnergyDevelopmentCategoryType> EnergyDevelopmentCategoryTypes => _dataService.Context.EnergyDevelopmentCategoryTypes.ToList();

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

        public EnergyDevelopmentCategoryType? EnergyDevelopmentCategoryType
        {
            get => _facility.EnergyDevelopmentCategoryType;
            set
            {
                if (_facility.EnergyDevelopmentCategoryType != value)
                {
                    _facility.EnergyDevelopmentCategoryType = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? UniqueFacilityIdentifier
        {
            get => _facility.UniqueFacilityIdentifier;
            set
            {
                if (_facility.UniqueFacilityIdentifier != value)
                {
                    _facility.UniqueFacilityIdentifier = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? LocationName
        {
            get => _facility.LocationName;
            set
            {
                if (_facility.LocationName != value)
                {
                    _facility.LocationName = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? OperatorCode
        {
            get => _facility.OperatorCode;
            set
            {
                if (_facility.OperatorCode != value)
                {
                    _facility.OperatorCode = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? OperatorName
        {
            get => _facility.OperatorName;
            set
            {
                if (_facility.OperatorName != value)
                {
                    _facility.OperatorName = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? LicenceNumber
        {
            get => _facility.LicenceNumber;
            set
            {
                if (_facility.LicenceNumber != value)
                {
                    _facility.LicenceNumber = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public string? LicenseeCode
        {
            get => _facility.LicenseeCode;
            set
            {
                if (_facility.LicenseeCode != value)
                {
                    _facility.LicenseeCode = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

        public List<WasteLocationType> WasteLocationTypes => _dataService.Context.WasteLocationTypes.ToList();

        public WasteLocationType? WasteLocationType
        {
            get => _facility.WasteLocationType;
            set
            {
                if (_facility.WasteLocationType != value)
                {
                    _facility.WasteLocationType = value;
                    _dataService.Context.SaveChanges();
                    OnPropertyChanged();
                }
            }
        }

    }
}
