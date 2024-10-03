using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

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

        public bool ByteSwap
        {
            get => _analogIoTag.ByteSwap ?? false;
            set
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

        public bool WordSwap
        {
            get => _analogIoTag.WordSwap ?? false;
            set
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

        [Range(0, double.MaxValue, ErrorMessage = "Deadband must be greater than or equal to 0.")]
        [Required(ErrorMessage = "Deadband is required.")]
        public double Deadband
        {
            get => _analogIoTag.Deadband ?? 0;
            set
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

        [Required(ErrorMessage = "Read Address is required.")]
        public string ReadAddress
        {
            get => _analogIoTag.ReadAddress ?? string.Empty;
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "Read Address Scan Interval must be greater than or equal to 0.")]
        [Required(ErrorMessage = "Read Address Scan Interval is required.")]
        public int ReadAddressScanInterval
        {
            get => _analogIoTag.ReadAddressScanInterval ?? 0;
            set
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

        public string HistoryAddress
        {
            get => _analogIoTag.HistoryAddress ?? string.Empty;
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "History Address Scan Interval must be greater than or equal to 0.")]
        public int HistoryAddressScanInterval
        {
            get => _analogIoTag.HistoryAddressScanInterval ?? 0;
            set
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

        public string WriteAddress
        {
            get => _analogIoTag.WriteAddress ?? string.Empty;
            set
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

        [Required(ErrorMessage = "Is Calculated is required.")]
        public bool IsCalculated
        {
            get => _analogIoTag.IsCalculated ?? false;
            set
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

        public string Script
        {
            get => _analogIoTag.Script ?? string.Empty;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Unscaled Minimum must be greater than or equal to -1.7976931348623157E+308.")]
        public double UnscaledMinimum
        {
            get => _analogIoTag.UnscaledMinimum ?? double.MinValue;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Unscaled Maximum must be greater than or equal to -1.7976931348623157E+308.")]
        public double UnscaledMaximum
        {
            get => _analogIoTag.UnscaledMaximum ?? double.MinValue;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Scaled Minimum must be greater than or equal to -1.7976931348623157E+308.")]
        public double ScaledMinimum
        {
            get => _analogIoTag.ScaledMinimum ?? double.MinValue;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Scaled Maximum must be greater than or equal to -1.7976931348623157E+308.")]
        public double ScaledMaximum
        {
            get => _analogIoTag.ScaledMaximum ?? double.MinValue;
            set
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

        public bool ClampScaledValue
        {
            get => _analogIoTag.ClampScaledValue ?? false;
            set
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

        public bool EnableLogging
        {
            get => _analogIoTag.EnableLogging ?? false;
            set
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

        public AlarmPriority HighHighAlarmPriority
        {
            get => _analogIoTag.HighHighAlarmPriority ?? new AlarmPriority();
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "High High Alarm Delay must be greater than or equal to 0.")]
        public int HighHighAlarmDelay
        {
            get => _analogIoTag.HighHighAlarmDelay ?? 0;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "High High Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double HighHighAlarmSetpoint
        {
            get => _analogIoTag.HighHighAlarmSetpoint ?? double.MinValue;
            set
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

        [Range(0, double.MaxValue, ErrorMessage = "High High Alarm Deadband must be greater than or equal to 0.")]
        public double HighHighAlarmDeadband
        {
            get => _analogIoTag.HighHighAlarmDeadband ?? 0;
            set
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

        public bool HighHighAlarmDisable
        {
            get => _analogIoTag.HighHighAlarmDisable ?? false;
            set
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

        public AlarmPriority HighAlarmPriority
        {
            get => _analogIoTag.HighAlarmPriority ?? new AlarmPriority();
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "High Alarm Delay must be greater than or equal to 0.")]
        public int HighAlarmDelay
        {
            get => _analogIoTag.HighAlarmDelay ?? 0;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "High Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double HighAlarmSetpoint
        {
            get => _analogIoTag.HighAlarmSetpoint ?? double.MinValue;
            set
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

        [Range(0, double.MaxValue, ErrorMessage = "High Alarm Deadband must be greater than or equal to 0.")]
        public double HighAlarmDeadband
        {
            get => _analogIoTag.HighAlarmDeadband ?? 0;
            set
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

        public bool HighAlarmDisable
        {
            get => _analogIoTag.HighAlarmDisable ?? false;
            set
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

        public AlarmPriority LowAlarmPriority
        {
            get => _analogIoTag.LowAlarmPriority ?? new AlarmPriority();
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "Low Alarm Delay must be greater than or equal to 0.")]
        public int LowAlarmDelay
        {
            get => _analogIoTag.LowAlarmDelay ?? 0;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Low Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double LowAlarmSetpoint
        {
            get => _analogIoTag.LowAlarmSetpoint ?? double.MinValue;
            set
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

        [Range(0, double.MaxValue, ErrorMessage = "Low Alarm Deadband must be greater than or equal to 0.")]
        public double LowAlarmDeadband
        {
            get => _analogIoTag.LowAlarmDeadband ?? 0;
            set
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

        public bool LowAlarmDisable
        {
            get => _analogIoTag.LowAlarmDisable ?? false;
            set
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

        public AlarmPriority LowLowAlarmPriority
        {
            get => _analogIoTag.LowLowAlarmPriority ?? new AlarmPriority();
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "Low Low Alarm Delay must be greater than or equal to 0.")]
        public int LowLowAlarmDelay
        {
            get => _analogIoTag.LowLowAlarmDelay ?? 0;
            set
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

        [Range(double.MinValue, double.MaxValue, ErrorMessage = "Low Low Alarm Setpoint must be greater than or equal to -1.7976931348623157E+308.")]
        public double LowLowAlarmSetpoint
        {
            get => _analogIoTag.LowLowAlarmSetpoint ?? double.MinValue;
            set
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

        [Range(0, double.MaxValue, ErrorMessage = "Low Low Alarm Deadband must be greater than or equal to 0.")]
        public double LowLowAlarmDeadband
        {
            get => _analogIoTag.LowLowAlarmDeadband ?? 0;
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "Display Order must be greater than or equal to 0.")]
        public int DisplayOrder
        {
            get => _analogIoTag.DisplayOrder ?? 0;
            set
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

        [Range(0, int.MaxValue, ErrorMessage = "Number Of Digits After Decimal must be greater than or equal to 0.")]
        public int NumberOfDigitsAfterDecimal
        {
            get => _analogIoTag.NumberOfDigitsAfterDecimal ?? 0;
            set
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

        public Unit Unit
        {
            get => _analogIoTag.Unit ?? null!;
            set
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

        public TagValueEnumeration TagValueEnumeration
        {
            get => _analogIoTag.TagValueEnumeration ?? null!;
            set
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

        public bool IsBadQuality
        {
            get => _analogIoTag.IsBadQuality ?? false;
        }

        public double? ManualData
        {
            get => _analogIoTag.ManualData;
            set
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
