using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

namespace EnerFlow.ViewModels
{
    public class WellViewModel : HierarchyViewModel
    {

        private readonly Well _well = null!;

        public WellViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _well = hierarchy.Well!;
        }

        public WellViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Well well) : base(parentHierarchyViewModel, hierarchy)
        {
            _well = well;
            well.Hierarchy = hierarchy;
        }

        public string? WellIdentifier
        {
            get => _well.WellIdentifier;
            set
            {
                if (_well.WellIdentifier != value)
                {
                    if (_well.WellIdentifier != value)
                    {
                        ValidateProperty(value, nameof(WellIdentifier));
                        var errors = GetErrors(nameof(WellIdentifier));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.WellIdentifier = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public string? WellName
        {
            get => _well.WellName;
            set
            {
                if (_well.WellName != value)
                {
                    if (_well.WellName != value)
                    {
                        ValidateProperty(value, nameof(WellName));
                        var errors = GetErrors(nameof(WellName));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.WellName = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public string? Location
        {
            get => _well.Location;
            set
            {
                if (_well.Location != value)
                {
                    if (_well.Location != value)
                    {
                        ValidateProperty(value, nameof(Location));
                        var errors = GetErrors(nameof(Location));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.Location = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public string? LocationAlias
        {
            get => _well.LocationAlias;
            set
            {
                if (_well.LocationAlias != value)
                {
                    if (_well.LocationAlias != value)
                    {
                        ValidateProperty(value, nameof(LocationAlias));
                        var errors = GetErrors(nameof(LocationAlias));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LocationAlias = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public string? LocationAlternateAlias
        {
            get => _well.LocationAlternateAlias;
            set
            {
                if (_well.LocationAlternateAlias != value)
                {
                    if (_well.LocationAlternateAlias != value)
                    {
                        ValidateProperty(value, nameof(LocationAlternateAlias));
                        var errors = GetErrors(nameof(LocationAlternateAlias));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LocationAlternateAlias = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? FormattedUwi
        {
            get => _well.FormattedUwi;
            set
            {
                if (_well.FormattedUwi != value)
                {
                    if (_well.FormattedUwi != value)
                    {
                        ValidateProperty(value, nameof(FormattedUwi));
                        var errors = GetErrors(nameof(FormattedUwi));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.FormattedUwi = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? UnformattedUwi
        {
            get => _well.UnformattedUwi;
            set
            {
                if (_well.UnformattedUwi != value)
                {
                    if (_well.UnformattedUwi != value)
                    {
                        ValidateProperty(value, nameof(UnformattedUwi));
                        var errors = GetErrors(nameof(UnformattedUwi));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.UnformattedUwi = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? SurfaceLocation
        {
            get => _well.SurfaceLocation;
            set
            {
                if (_well.SurfaceLocation != value)
                {
                    if (_well.SurfaceLocation != value)
                    {
                        ValidateProperty(value, nameof(SurfaceLocation));
                        var errors = GetErrors(nameof(SurfaceLocation));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.SurfaceLocation = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? DownholeLocation
        {
            get => _well.DownholeLocation;
            set
            {
                if (_well.DownholeLocation != value)
                {
                    if (_well.DownholeLocation != value)
                    {
                        ValidateProperty(value, nameof(DownholeLocation));
                        var errors = GetErrors(nameof(DownholeLocation));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.DownholeLocation = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? FieldCode
        {
            get => _well.FieldCode;
            set
            {
                if (_well.FieldCode != value)
                {
                    if (_well.FieldCode != value)
                    {
                        ValidateProperty(value, nameof(FieldCode));
                        var errors = GetErrors(nameof(FieldCode));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.FieldCode = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? PoolCode
        {
            get => _well.PoolCode;
            set
            {
                if (_well.PoolCode != value)
                {
                    if (_well.PoolCode != value)
                    {
                        ValidateProperty(value, nameof(PoolCode));
                        var errors = GetErrors(nameof(PoolCode));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.PoolCode = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LicenseeCode
        {
            get => _well.LicenseeCode;
            set
            {
                if (_well.LicenseeCode != value)
                {
                    if (_well.LicenseeCode != value)
                    {
                        ValidateProperty(value, nameof(LicenseeCode));
                        var errors = GetErrors(nameof(LicenseeCode));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LicenseeCode = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? AgentCode
        {
            get => _well.AgentCode;
            set
            {
                if (_well.AgentCode != value)
                {
                    if (_well.AgentCode != value)
                    {
                        ValidateProperty(value, nameof(AgentCode));
                        var errors = GetErrors(nameof(AgentCode));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.AgentCode = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? OperatorCode
        {
            get => _well.OperatorCode;
            set
            {
                if (_well.OperatorCode != value)
                {
                    if (_well.OperatorCode != value)
                    {
                        ValidateProperty(value, nameof(OperatorCode));
                        var errors = GetErrors(nameof(OperatorCode));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.OperatorCode = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public string? OperatorName
        {
            get => _well.OperatorName;
            set
            {
                if (_well.OperatorName != value)
                {
                    if (_well.OperatorName != value)
                    {
                        ValidateProperty(value, nameof(OperatorName));
                        var errors = GetErrors(nameof(OperatorName));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.OperatorName = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LicenseNumber
        {
            get => _well.LicenseNumber;
            set
            {
                if (_well.LicenseNumber != value)
                {
                    if (_well.LicenseNumber != value)
                    {
                        ValidateProperty(value, nameof(LicenseNumber));
                        var errors = GetErrors(nameof(LicenseNumber));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LicenseNumber = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public DateOnly? LicenseDate
        {
            get => _well.LicenseDate;
            set
            {
                if (_well.LicenseDate != value)
                {
                    if (_well.LicenseDate != value)
                    {
                        ValidateProperty(value, nameof(LicenseDate));
                        var errors = GetErrors(nameof(LicenseDate));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LicenseDate = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        [MaxLength(128)]
        public string? LicenseStatus
        {
            get => _well.LicenseStatus;
            set
            {
                if (_well.LicenseStatus != value)
                {
                    if (_well.LicenseStatus != value)
                    {
                        ValidateProperty(value, nameof(LicenseStatus));
                        var errors = GetErrors(nameof(LicenseStatus));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.LicenseStatus = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public DateOnly? SpudDate
        {
            get => _well.SpudDate;
            set
            {
                if (_well.SpudDate != value)
                {
                    if (_well.SpudDate != value)
                    {
                        ValidateProperty(value, nameof(SpudDate));
                        var errors = GetErrors(nameof(SpudDate));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.SpudDate = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public DateOnly? FinalDrillDate
        {
            get => _well.FinalDrillDate;
            set
            {
                if (_well.FinalDrillDate != value)
                {
                    if (_well.FinalDrillDate != value)
                    {
                        ValidateProperty(value, nameof(FinalDrillDate));
                        var errors = GetErrors(nameof(FinalDrillDate));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.FinalDrillDate = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

        public double? WellTotalDepth
        {
            get => _well.WellTotalDepth ?? 0.0;
            set
            {
                if (_well.WellTotalDepth != value)
                {
                    if (_well.WellTotalDepth != value)
                    {
                        ValidateProperty(value, nameof(WellTotalDepth));
                        var errors = GetErrors(nameof(WellTotalDepth));
                        if (errors == null || !errors.Cast<object>().Any())
                        {
                            _well.WellTotalDepth = value;
                            if (!DisableAutoSave)
                            {
                                Ioc.Default.GetService<IDataService>()?.SaveChanges();
                            }
                        }
                    }
                }
            }
        }
    }
}