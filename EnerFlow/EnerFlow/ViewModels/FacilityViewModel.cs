using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

namespace EnerFlow.ViewModels
{
    public class FacilityViewModel : HierarchyViewModel
    {

        private readonly Facility _facility = null!;

        private FacilityType _selectdFacilityType = null!;

        public FacilityViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _facility = hierarchy.Facility!;
            _selectdFacilityType = _facility.FacilitySubType?.FacilityType ?? FacilityTypes.First();
        }

        public FacilityViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Facility facility) : base(parentHierarchyViewModel, hierarchy)
        {
            _facility = facility;
            facility.Hierarchy = hierarchy;
            _selectdFacilityType = _facility.FacilitySubType?.FacilityType ?? FacilityTypes.First();
        }

        public static List<FacilityType> FacilityTypes => [.. Ioc.Default.GetService<IDataService>()?.Context.FacilityTypes.Local];

        public static List<EnergyDevelopmentCategoryType> EnergyDevelopmentCategoryTypes => [.. Ioc.Default.GetService<IDataService>()?.Context.EnergyDevelopmentCategoryTypes.Local];

        public FacilityType SelectedFacilityType
        {
            get => _selectdFacilityType;
            set
            {
                if (_selectdFacilityType != value)
                {
                    ValidateProperty(value, nameof(SelectedFacilityType));

                    var errors = GetErrors(nameof(SelectedFacilityType));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _selectdFacilityType = value;
                        OnPropertyChanged();
                        FacilitySubType = _selectdFacilityType.FacilitySubTypes.FirstOrDefault();
                    }
                }
            }
        }

        public FacilitySubType? FacilitySubType
        {
            get => _facility.FacilitySubType;
            set
            {
                if (_facility.FacilitySubType != value)
                {
                    ValidateProperty(value, nameof(FacilitySubType));
                    var errors = GetErrors(nameof(FacilitySubType));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.FacilitySubType = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
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
                    ValidateProperty(value, nameof(EnergyDevelopmentCategoryType));
                    var errors = GetErrors(nameof(EnergyDevelopmentCategoryType));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.EnergyDevelopmentCategoryType = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? UniqueFacilityIdentifier
        {
            get => _facility.UniqueFacilityIdentifier;
            set
            {
                if (_facility.UniqueFacilityIdentifier != value)
                {
                    if (_facility.UniqueFacilityIdentifier != value)
                    {
                        ValidateProperty(value, nameof(UniqueFacilityIdentifier));
                        var errors = GetErrors(nameof(UniqueFacilityIdentifier));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _facility.UniqueFacilityIdentifier = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                            OnPropertyChanged();
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LocationName
        {
            get => _facility.LocationName;
            set
            {
                if (_facility.LocationName != value)
                {
                    ValidateProperty(value, nameof(LocationName));
                    var errors = GetErrors(nameof(LocationName));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.LocationName = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? OperatorCode
        {
            get => _facility.OperatorCode;
            set
            {
                if (_facility.OperatorCode != value)
                {
                    ValidateProperty(value, nameof(OperatorCode));
                    var errors = GetErrors(nameof(OperatorCode));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.OperatorCode = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? OperatorName
        {
            get => _facility.OperatorName;
            set
            {
                if (_facility.OperatorName != value)
                {
                    ValidateProperty(value, nameof(OperatorName));
                    var errors = GetErrors(nameof(OperatorName));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.OperatorName = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LicenceNumber
        {
            get => _facility.LicenceNumber;
            set
            {
                if (_facility.LicenceNumber != value)
                {
                    ValidateProperty(value, nameof(LicenceNumber));
                    var errors = GetErrors(nameof(LicenceNumber));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.LicenceNumber = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LicenseeCode
        {
            get => _facility.LicenseeCode;
            set
            {
                if (_facility.LicenseeCode != value)
                {
                    ValidateProperty(value, nameof(LicenseeCode));
                    var errors = GetErrors(nameof(LicenseeCode));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _facility.LicenseeCode = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public static List<WasteLocationType> WasteLocationTypes => [.. Ioc.Default.GetService<IDataService>()?.Context.WasteLocationTypes];

        public WasteLocationType? WasteLocationType
        {
            get => _facility.WasteLocationType;
            set
            {
                if (_facility.WasteLocationType != value)
                {

                    ValidateProperty(value, nameof(WasteLocationType)); 

                    if(!HasErrors)
                    {
                        _facility.WasteLocationType = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }

                }
            }
        }

    }
}
