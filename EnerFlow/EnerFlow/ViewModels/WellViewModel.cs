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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                                Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                            }
                        }
                    }
                }
            }
        }

    }

}