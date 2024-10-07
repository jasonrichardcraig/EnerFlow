using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

namespace EnerFlow.ViewModels
{
    public class AnalogIoTagViewModel : HierarchyViewModel
    {
        private UnitClass _selectdUnitClass = null!;
        private readonly AnalogIoTag _analogIoTag = null!;

        public AnalogIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _analogIoTag = hierarchy.AnalogIoTags.First();
            _selectdUnitClass = _analogIoTag?.Unit?.UnitClass!;
        }

        public AnalogIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, AnalogIoTag analogIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _analogIoTag = analogIoTag;
            _selectdUnitClass = _analogIoTag?.Unit?.UnitClass!;

            var defaultAlarmPriority = Ioc.Default.GetService<IDataService>()?.Context.AlarmPriorities.FirstOrDefault()!;

            analogIoTag.Hierarchy = hierarchy;
            UnscaledMinimum = 0;
            UnscaledMaximum = 100;
            ScaledMinimum = 0;
            ScaledMaximum = 100;
            DisplayRangeMinimum = 0;
            DisplayRangeMaximum = 100;
            ExpectedRangeMinimum = 0;
            ExpectedRangeMaximum = 100;
            HighHighAlarmPriority = defaultAlarmPriority;
            HighAlarmPriority = defaultAlarmPriority;
            LowAlarmPriority = defaultAlarmPriority;
            LowLowAlarmPriority = defaultAlarmPriority;
            UseDefaultTrendStyle = true;
            LineColor = "Black";
            LineStyle = "Solid";
            LineWidth = 1;
            ClampScaledValue = false;
        }

        public List<AlarmPriority> AlarmPriorities => [.. Ioc.Default.GetService<IDataService>()?.Context.AlarmPriorities.ToList()];

        public List<UnitClass> UnitClasses => [.. Ioc.Default.GetService<IDataService>()?.Context.UnitClasses.OrderBy(u=>u.Name).ToList()];

        public UnitClass SelectedUnitClass
        {
            get => _selectdUnitClass;
            set
            {
                if (_selectdUnitClass != value)
                {
                    ValidateProperty(value, nameof(SelectedUnitClass));

                    var errors = GetErrors(nameof(SelectedUnitClass));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _selectdUnitClass = value;
                        OnPropertyChanged();
                        Unit = _selectdUnitClass?.Units.FirstOrDefault()!;
                    }
                }
            }
        }

        public bool EnableUnitsOfMeasure
        {
            get => Unit != null;
            set
            {
                if (value && Unit == null)
                {
                    SelectedUnitClass = UnitClasses.FirstOrDefault()!;
                }
                else if (!value)
                {
                    SelectedUnitClass = null!;
                    Unit = null!;
                }
            }
        }
        
        public bool ByteSwap
        {
            get => _analogIoTag.ByteSwap ?? false;
            set
            {
                if (_analogIoTag.ByteSwap != value)
                {
                    ValidateProperty(value, nameof(ByteSwap));
                    var errors = GetErrors(nameof(ByteSwap));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ByteSwap = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool WordSwap
        {
            get => _analogIoTag.WordSwap ?? false;
            set
            {
                if (_analogIoTag.WordSwap != value)
                {
                    ValidateProperty(value, nameof(WordSwap));
                    var errors = GetErrors(nameof(WordSwap));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.WordSwap = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, double.MaxValue, ErrorMessage = "Deadband must be greater than or equal to 0.")]
        [Required(ErrorMessage = "Deadband is required.")]
        public double Deadband
        {
            get => _analogIoTag.Deadband ?? 0;
            set
            {
                if (_analogIoTag.Deadband != value)
                {
                    ValidateProperty(value, nameof(Deadband));
                    var errors = GetErrors(nameof(Deadband));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.Deadband = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Required(ErrorMessage = "Read Address is required.")]
        public string ReadAddress
        {
            get => _analogIoTag.ReadAddress ?? string.Empty;
            set
            {
                if (_analogIoTag.ReadAddress != value)
                {
                    ValidateProperty(value, nameof(ReadAddress));
                    var errors = GetErrors(nameof(ReadAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ReadAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Read Address Scan Interval must be greater than or equal to 0.")]
        [Required(ErrorMessage = "Read Address Scan Interval is required.")]
        public int ReadAddressScanInterval
        {
            get => _analogIoTag.ReadAddressScanInterval ?? 0;
            set
            {
                if (_analogIoTag.ReadAddressScanInterval != value)
                {
                    ValidateProperty(value, nameof(ReadAddressScanInterval));
                    var errors = GetErrors(nameof(ReadAddressScanInterval));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ReadAddressScanInterval = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string HistoryAddress
        {
            get => _analogIoTag.HistoryAddress ?? string.Empty;
            set
            {
                if (_analogIoTag.HistoryAddress != value)
                {
                    ValidateProperty(value, nameof(HistoryAddress));
                    var errors = GetErrors(nameof(HistoryAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HistoryAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "History Address Scan Interval must be greater than or equal to 0.")]
        public int? HistoryAddressScanInterval
        {
            get => _analogIoTag.HistoryAddressScanInterval;
            set
            {
                if (_analogIoTag.HistoryAddressScanInterval != value)
                {
                    ValidateProperty(value, nameof(HistoryAddressScanInterval));
                    var errors = GetErrors(nameof(HistoryAddressScanInterval));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HistoryAddressScanInterval = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string WriteAddress
        {
            get => _analogIoTag.WriteAddress ?? string.Empty;
            set
            {
                if (_analogIoTag.WriteAddress != value)
                {
                    ValidateProperty(value, nameof(WriteAddress));
                    var errors = GetErrors(nameof(WriteAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.WriteAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Required(ErrorMessage = "Is Calculated is required.")]
        public bool IsCalculated
        {
            get => _analogIoTag.IsCalculated ?? false;
            set
            {
                if (_analogIoTag.IsCalculated != value)
                {
                    ValidateProperty(value, nameof(IsCalculated));
                    var errors = GetErrors(nameof(IsCalculated));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.IsCalculated = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Script
        {
            get => _analogIoTag.Script ?? string.Empty;
            set
            {
                if (_analogIoTag.Script != value)
                {
                    ValidateProperty(value, nameof(Script));
                    var errors = GetErrors(nameof(Script));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.Script = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Unscaled Minimum must be greater than or equal to -1.7976931348623157E+308.")]
        public double? UnscaledMinimum
        {
            get => _analogIoTag.UnscaledMinimum;
            set
            {
                if (_analogIoTag.UnscaledMinimum != value)
                {
                    ValidateProperty(value, nameof(UnscaledMinimum));
                    var errors = GetErrors(nameof(UnscaledMinimum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.UnscaledMinimum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Unscaled Maximum must be greater than or equal to -1.7976931348623157E+308.")]
        public double? UnscaledMaximum
        {
            get => _analogIoTag.UnscaledMaximum;
            set
            {
                if (_analogIoTag.UnscaledMaximum != value)
                {
                    ValidateProperty(value, nameof(UnscaledMaximum));
                    var errors = GetErrors(nameof(UnscaledMaximum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.UnscaledMaximum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Scaled Minimum must be greater than or equal to -1.7976931348623157E+308.")]
        public double? ScaledMinimum
        {
            get => _analogIoTag.ScaledMinimum;
            set
            {
                if (_analogIoTag.ScaledMinimum != value)
                {
                    ValidateProperty(value, nameof(ScaledMinimum));
                    var errors = GetErrors(nameof(ScaledMinimum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ScaledMinimum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Scaled Maximum must be greater than or equal to -1.7976931348623157E+308.")]
        public double? ScaledMaximum
        {
            get => _analogIoTag.ScaledMaximum;
            set
            {
                if (_analogIoTag.ScaledMaximum != value)
                {
                    ValidateProperty(value, nameof(ScaledMaximum));
                    var errors = GetErrors(nameof(ScaledMaximum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ScaledMaximum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? ClampScaledValue
        {
            get => _analogIoTag.ClampScaledValue;
            set
            {
                if (_analogIoTag.ClampScaledValue != value)
                {
                    ValidateProperty(value, nameof(ClampScaledValue));
                    var errors = GetErrors(nameof(ClampScaledValue));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ClampScaledValue = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? EnableLogging
        {
            get => _analogIoTag.EnableLogging;
            set
            {
                if (_analogIoTag.EnableLogging != value)
                {
                    ValidateProperty(value, nameof(EnableLogging));
                    var errors = GetErrors(nameof(EnableLogging));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.EnableLogging = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public double? DisplayRangeMinimum
        {
            get => _analogIoTag.DisplayRangeMinimum;
            set
            {
                if (_analogIoTag.DisplayRangeMinimum != value)
                {
                    ValidateProperty(value, nameof(DisplayRangeMinimum));
                    var errors = GetErrors(nameof(DisplayRangeMinimum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.DisplayRangeMinimum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }

        }

        public double? DisplayRangeMaximum
        {
            get => _analogIoTag.DisplayRangeMaximum;
            set
            {
                if (_analogIoTag.DisplayRangeMaximum != value)
                {
                    ValidateProperty(value, nameof(DisplayRangeMaximum));
                    var errors = GetErrors(nameof(DisplayRangeMaximum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.DisplayRangeMaximum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public double? ExpectedRangeMinimum
        {
            get => _analogIoTag.ExpectedRangeMinimum;
            set
            {
                if (_analogIoTag.ExpectedRangeMinimum != value)
                {
                    ValidateProperty(value, nameof(ExpectedRangeMinimum));
                    var errors = GetErrors(nameof(ExpectedRangeMinimum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ExpectedRangeMinimum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }

            }

        }

        public double? ExpectedRangeMaximum
        {
            get => _analogIoTag.ExpectedRangeMaximum;
            set
            {
                if (_analogIoTag.ExpectedRangeMaximum != value)
                {
                    ValidateProperty(value, nameof(ExpectedRangeMaximum));
                    var errors = GetErrors(nameof(ExpectedRangeMaximum));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ExpectedRangeMaximum = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public AlarmPriority HighHighAlarmPriority
        {
            get => _analogIoTag.HighHighAlarmPriority!;
            set
            {
                if (_analogIoTag.HighHighAlarmPriority != value)
                {
                    ValidateProperty(value, nameof(HighHighAlarmPriority));
                    var errors = GetErrors(nameof(HighHighAlarmPriority));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighHighAlarmPriority = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "High High Alarm Delay must be greater than or equal to 0.")]
        public int? HighHighAlarmDelay
        {
            get => _analogIoTag.HighHighAlarmDelay;
            set
            {
                if (_analogIoTag.HighHighAlarmDelay != value)
                {
                    ValidateProperty(value, nameof(HighHighAlarmDelay));
                    var errors = GetErrors(nameof(HighHighAlarmDelay));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighHighAlarmDelay = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "High High Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double? HighHighAlarmSetpoint
        {
            get => _analogIoTag.HighHighAlarmSetpoint;
            set
            {
                if (_analogIoTag.HighHighAlarmSetpoint != value)
                {
                    ValidateProperty(value, nameof(HighHighAlarmSetpoint));
                    var errors = GetErrors(nameof(HighHighAlarmSetpoint));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighHighAlarmSetpoint = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, double.MaxValue, ErrorMessage = "High High Alarm Deadband must be greater than or equal to 0.")]
        public double? HighHighAlarmDeadband
        {
            get => _analogIoTag.HighHighAlarmDeadband;
            set
            {
                if (_analogIoTag.HighHighAlarmDeadband != value)
                {
                    ValidateProperty(value, nameof(HighHighAlarmDeadband));
                    var errors = GetErrors(nameof(HighHighAlarmDeadband));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighHighAlarmDeadband = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? HighHighAlarmDisable
        {
            get => _analogIoTag.HighHighAlarmDisable;
            set
            {
                if (_analogIoTag.HighHighAlarmDisable != value)
                {
                    ValidateProperty(value, nameof(HighHighAlarmDisable));
                    var errors = GetErrors(nameof(HighHighAlarmDisable));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighHighAlarmDisable = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public AlarmPriority HighAlarmPriority
        {
            get => _analogIoTag.HighAlarmPriority!;
            set
            {
                if (_analogIoTag.HighAlarmPriority != value)
                {
                    ValidateProperty(value, nameof(HighAlarmPriority));
                    var errors = GetErrors(nameof(HighAlarmPriority));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighAlarmPriority = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "High Alarm Delay must be greater than or equal to 0.")]
        public int? HighAlarmDelay
        {
            get => _analogIoTag.HighAlarmDelay;
            set
            {
                if (_analogIoTag.HighAlarmDelay != value)
                {
                    ValidateProperty(value, nameof(HighAlarmDelay));
                    var errors = GetErrors(nameof(HighAlarmDelay));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighAlarmDelay = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "High Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double? HighAlarmSetpoint
        {
            get => _analogIoTag.HighAlarmSetpoint;
            set
            {
                if (_analogIoTag.HighAlarmSetpoint != value)
                {
                    ValidateProperty(value, nameof(HighAlarmSetpoint));
                    var errors = GetErrors(nameof(HighAlarmSetpoint));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighAlarmSetpoint = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, double.MaxValue, ErrorMessage = "High Alarm Deadband must be greater than or equal to 0.")]
        public double? HighAlarmDeadband
        {
            get => _analogIoTag.HighAlarmDeadband;
            set
            {
                if (_analogIoTag.HighAlarmDeadband != value)
                {
                    ValidateProperty(value, nameof(HighAlarmDeadband));
                    var errors = GetErrors(nameof(HighAlarmDeadband));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighAlarmDeadband = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? HighAlarmDisable
        {
            get => _analogIoTag.HighAlarmDisable;
            set
            {
                if (_analogIoTag.HighAlarmDisable != value)
                {
                    ValidateProperty(value, nameof(HighAlarmDisable));
                    var errors = GetErrors(nameof(HighAlarmDisable));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.HighAlarmDisable = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public AlarmPriority LowAlarmPriority
        {
            get => _analogIoTag.LowAlarmPriority!;
            set
            {
                if (_analogIoTag.LowAlarmPriority != value)
                {
                    ValidateProperty(value, nameof(LowAlarmPriority));
                    var errors = GetErrors(nameof(LowAlarmPriority));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowAlarmPriority = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Low Alarm Delay must be greater than or equal to 0.")]
        public int? LowAlarmDelay
        {
            get => _analogIoTag.LowAlarmDelay;
            set
            {
                if (_analogIoTag.LowAlarmDelay != value)
                {
                    ValidateProperty(value, nameof(LowAlarmDelay));
                    var errors = GetErrors(nameof(LowAlarmDelay));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowAlarmDelay = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Low Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double? LowAlarmSetpoint
        {
            get => _analogIoTag.LowAlarmSetpoint;
            set
            {
                if (_analogIoTag.LowAlarmSetpoint != value)
                {
                    ValidateProperty(value, nameof(LowAlarmSetpoint));
                    var errors = GetErrors(nameof(LowAlarmSetpoint));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowAlarmSetpoint = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, double.MaxValue, ErrorMessage = "Low Alarm Deadband must be greater than or equal to 0.")]
        public double? LowAlarmDeadband
        {
            get => _analogIoTag.LowAlarmDeadband;
            set
            {
                if (_analogIoTag.LowAlarmDeadband != value)
                {
                    ValidateProperty(value, nameof(LowAlarmDeadband));
                    var errors = GetErrors(nameof(LowAlarmDeadband));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowAlarmDeadband = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? LowAlarmDisable
        {
            get => _analogIoTag.LowAlarmDisable;
            set
            {
                if (_analogIoTag.LowAlarmDisable != value)
                {
                    ValidateProperty(value, nameof(LowAlarmDisable));
                    var errors = GetErrors(nameof(LowAlarmDisable));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowAlarmDisable = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public AlarmPriority LowLowAlarmPriority
        {
            get => _analogIoTag.LowLowAlarmPriority!;
            set
            {
                if (_analogIoTag.LowLowAlarmPriority != value)
                {
                    ValidateProperty(value, nameof(LowLowAlarmPriority));
                    var errors = GetErrors(nameof(LowLowAlarmPriority));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowLowAlarmPriority = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Low Low Alarm Delay must be greater than or equal to 0.")]
        public int? LowLowAlarmDelay
        {
            get => _analogIoTag.LowLowAlarmDelay;
            set
            {
                if (_analogIoTag.LowLowAlarmDelay != value)
                {
                    ValidateProperty(value, nameof(LowLowAlarmDelay));
                    var errors = GetErrors(nameof(LowLowAlarmDelay));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowLowAlarmDelay = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Low Low Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double? LowLowAlarmSetpoint
        {
            get => _analogIoTag.LowLowAlarmSetpoint;
            set
            {
                if (_analogIoTag.LowLowAlarmSetpoint != value)
                {
                    ValidateProperty(value, nameof(LowLowAlarmSetpoint));
                    var errors = GetErrors(nameof(LowLowAlarmSetpoint));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowLowAlarmSetpoint = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, double.MaxValue, ErrorMessage = "Low Low Alarm Deadband must be greater than or equal to 0.")]
        public double LowLowAlarmDeadband
        {
            get => _analogIoTag.LowLowAlarmDeadband ?? 0;
            set
            {
                if (_analogIoTag.LowLowAlarmDeadband != value)
                {
                    ValidateProperty(value, nameof(LowLowAlarmDeadband));
                    var errors = GetErrors(nameof(LowLowAlarmDeadband));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowLowAlarmDeadband = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? LowLowAlarmDisable
        {
            get => _analogIoTag.LowLowAlarmDisable;
            set
            {
                if (_analogIoTag.LowLowAlarmDisable != value)
                {
                    ValidateProperty(value, nameof(LowLowAlarmDisable));
                    var errors = GetErrors(nameof(LowLowAlarmDisable));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LowLowAlarmDisable = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Display Order must be greater than or equal to 0.")]
        public int? DisplayOrder
        {
            get => _analogIoTag.DisplayOrder;
            set
            {
                if (_analogIoTag.DisplayOrder != value)
                {
                    ValidateProperty(value, nameof(DisplayOrder));
                    var errors = GetErrors(nameof(DisplayOrder));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.DisplayOrder = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Number Of Digits After Decimal must be greater than or equal to 0.")]
        public int? NumberOfDigitsAfterDecimal
        {
            get => _analogIoTag.NumberOfDigitsAfterDecimal;
            set
            {
                if (_analogIoTag.NumberOfDigitsAfterDecimal != value)
                {
                    ValidateProperty(value, nameof(NumberOfDigitsAfterDecimal));
                    var errors = GetErrors(nameof(NumberOfDigitsAfterDecimal));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.NumberOfDigitsAfterDecimal = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? UseDefaultTrendStyle
        {
            get => _analogIoTag.UseDefaultTrendStyle;
            set
            {
                if (_analogIoTag.UseDefaultTrendStyle != value)
                {
                    ValidateProperty(value, nameof(UseDefaultTrendStyle));
                    var errors = GetErrors(nameof(UseDefaultTrendStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.UseDefaultTrendStyle = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string LineStyle
        {
            get => _analogIoTag.LineStyle ?? string.Empty;
            set
            {
                if (_analogIoTag.LineStyle != value)
                {
                    ValidateProperty(value, nameof(LineStyle));
                    var errors = GetErrors(nameof(LineStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LineStyle = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public int? LineWidth
        {
            get => _analogIoTag.LineWidth;
            set
            {
                if (_analogIoTag.LineWidth != value)
                {
                    ValidateProperty(value, nameof(LineWidth));
                    var errors = GetErrors(nameof(LineWidth));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LineWidth = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string LineColor
        {
            get => _analogIoTag.LineColor ?? string.Empty;
            set
            {
                if (_analogIoTag.LineColor != value)
                {
                    ValidateProperty(value, nameof(LineColor));
                    var errors = GetErrors(nameof(LineColor));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.LineColor = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public Unit Unit
        {
            get => _analogIoTag.Unit!;
            set
            {
                if (_analogIoTag.Unit != value)
                {
                    ValidateProperty(value, nameof(Unit));
                    var errors = GetErrors(nameof(Unit));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.Unit = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public TagValueEnumeration TagValueEnumeration
        {
            get => _analogIoTag.TagValueEnumeration!;
            set
            {
                if (_analogIoTag.TagValueEnumeration != value)
                {
                    ValidateProperty(value, nameof(TagValueEnumeration));
                    var errors = GetErrors(nameof(TagValueEnumeration));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.TagValueEnumeration = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool IsBadQuality
        {
            get => _analogIoTag.IsBadQuality ?? false;
        }

        public double? ManualData
        {
            get => _analogIoTag.ManualData;
            set
            {
                if (_analogIoTag.ManualData != value)
                {
                    ValidateProperty(value, nameof(ManualData));
                    var errors = GetErrors(nameof(ManualData));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _analogIoTag.ManualData = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public double? Value
        {
            get => _analogIoTag.Value;
        }

        public DateTime DateTimeCreated
        {
            get => _analogIoTag.DateTimeCreated;
        }
    }
}
