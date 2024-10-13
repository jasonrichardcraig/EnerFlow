using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Helpers;
using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Web.WebView2.Core;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Text.Json;
using System.Windows.Input;


namespace EnerFlow.ViewModels
{
    public class DigitalIoTagViewModel : HierarchyViewModel
    {
        private readonly DigitalIoTag _digitalIoTag = null!;

        public DigitalIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {

            _digitalIoTag = hierarchy.DigitalIoTag!;
            ShowReadAddressBrowserCommand = new RelayCommand(ShowReadAddressBrowser, CanShowReadAddressBrowser);
            ShowHistoryAddressBrowserCommand = new RelayCommand(ShowHistoryAddressBrowser, CanShowHistoryAddressBrowser);
            ShowWriteAddressBrowserCommand = new RelayCommand(ShowWriteAddressBrowser, CanShowWriteAddressBrowser);
        }

        public DigitalIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, DigitalIoTag digitalIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _digitalIoTag = digitalIoTag;
            digitalIoTag.Hierarchy = hierarchy;
            ShowReadAddressBrowserCommand = new RelayCommand(ShowReadAddressBrowser, CanShowReadAddressBrowser);
            ShowHistoryAddressBrowserCommand = new RelayCommand(ShowHistoryAddressBrowser, CanShowHistoryAddressBrowser);
            ShowWriteAddressBrowserCommand = new RelayCommand(ShowWriteAddressBrowser, CanShowWriteAddressBrowser);
            SetDefaultValues();
        }

        public static List<AlarmPriority> AlarmPriorities => [.. Ioc.Default.GetService<IDataService>()?.Context.AlarmPriorities.Local.ToList()];

        public RelayCommand ShowReadAddressBrowserCommand { get; set; }
        public RelayCommand ShowHistoryAddressBrowserCommand { get; set; }
        public RelayCommand ShowWriteAddressBrowserCommand { get; set; }

        public bool UseTextValues
        {
            get => FalseValueText != null || FalseValueText == string.Empty || TrueValueText != null || TrueValueText == string.Empty;
            set
            {
                if (value)
                {
                    TrueValueText = "True";
                    FalseValueText = "False";
                }
                else
                {
                    TrueValueText = null;
                    FalseValueText = null;
                }
            }
        }

        public string ReadAddress
        {
            get => _digitalIoTag.ReadAddress ?? string.Empty;
            set
            {
                if (_digitalIoTag.ReadAddress != value)
                {
                    ValidateProperty(value, nameof(ReadAddress));
                    var errors = GetErrors(nameof(ReadAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.ReadAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public int? ReadAddressScanInterval
        {
            get => _digitalIoTag.ReadAddressScanInterval;
            set
            {
                if (_digitalIoTag.ReadAddressScanInterval != value)
                {
                    ValidateProperty(value, nameof(ReadAddressScanInterval));
                    var errors = GetErrors(nameof(ReadAddressScanInterval));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.ReadAddressScanInterval = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? HistoryAddress
        {
            get => _digitalIoTag.HistoryAddress;
            set
            {
                if (_digitalIoTag.HistoryAddress != value)
                {
                    ValidateProperty(value, nameof(HistoryAddress));
                    var errors = GetErrors(nameof(HistoryAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.HistoryAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public int? HistoryAddressScanInterval
        {
            get => _digitalIoTag.HistoryAddressScanInterval;
            set
            {
                if (_digitalIoTag.HistoryAddressScanInterval != value)
                {
                    ValidateProperty(value, nameof(HistoryAddressScanInterval));
                    var errors = GetErrors(nameof(HistoryAddressScanInterval));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.HistoryAddressScanInterval = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? WriteAddress
        {
            get => _digitalIoTag.WriteAddress;
            set
            {
                if (_digitalIoTag.WriteAddress != value)
                {
                    ValidateProperty(value, nameof(WriteAddress));
                    var errors = GetErrors(nameof(WriteAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.WriteAddress = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? IsCalculated
        {
            get => _digitalIoTag.IsCalculated;
            set
            {
                if (_digitalIoTag.IsCalculated != value)
                {
                    ValidateProperty(value, nameof(IsCalculated));
                    var errors = GetErrors(nameof(IsCalculated));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.IsCalculated = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Script
        {
            get => _digitalIoTag.Script ?? string.Empty;
            set
            {
                if (_digitalIoTag.Script != value)
                {
                    ValidateProperty(value, nameof(Script));
                    var errors = GetErrors(nameof(Script));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.Script = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public AlarmPriority AlarmPriority
        {
            get => _digitalIoTag.AlarmPriority!;
            set
            {
                if (_digitalIoTag.AlarmPriority != value)
                {
                    ValidateProperty(value, nameof(AlarmPriority));
                    var errors = GetErrors(nameof(AlarmPriority));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.AlarmPriority = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public int? AlarmDelay
        {
            get => _digitalIoTag.AlarmDelay;
            set
            {
                if (_digitalIoTag.AlarmDelay != value)
                {
                    ValidateProperty(value, nameof(AlarmDelay));
                    var errors = GetErrors(nameof(AlarmDelay));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.AlarmDelay = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? AlarmDisabled
        {
            get => _digitalIoTag.AlarmDisabled;
            set
            {
                if (_digitalIoTag.AlarmDisabled != value)
                {
                    ValidateProperty(value, nameof(AlarmDisabled));
                    var errors = GetErrors(nameof(AlarmDisabled));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.AlarmDisabled = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? InvertState
        {
            get => _digitalIoTag.InvertState;
            set
            {
                if (_digitalIoTag.InvertState != value)
                {
                    ValidateProperty(value, nameof(InvertState));
                    var errors = GetErrors(nameof(InvertState));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.InvertState = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? TrueValueText
        {
            get => _digitalIoTag.TrueValueText;
            set
            {
                if (_digitalIoTag.TrueValueText != value)
                {
                    ValidateProperty(value, nameof(TrueValueText));
                    var errors = GetErrors(nameof(TrueValueText));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.TrueValueText = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? FalseValueText
        {
            get => _digitalIoTag.FalseValueText;
            set
            {
                if (_digitalIoTag.FalseValueText != value)
                {
                    ValidateProperty(value, nameof(FalseValueText));
                    var errors = GetErrors(nameof(FalseValueText));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.FalseValueText = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Display Order must be greater than or equal to 0.")]
        public int DisplayOrder
        {
            get => _digitalIoTag.DisplayOrder ?? 0;
            set
            {
                if (_digitalIoTag.DisplayOrder != value)
                {
                    ValidateProperty(value, nameof(DisplayOrder));
                    var errors = GetErrors(nameof(DisplayOrder));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.DisplayOrder = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? UseDefaultTrendStyle
        {
            get => _digitalIoTag.UseDefaultTrendStyle;
            set
            {
                if (_digitalIoTag.UseDefaultTrendStyle != value)
                {
                    ValidateProperty(value, nameof(UseDefaultTrendStyle));
                    var errors = GetErrors(nameof(UseDefaultTrendStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.UseDefaultTrendStyle = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? LineStyle
        {
            get => _digitalIoTag.LineStyle;
            set
            {
                if (_digitalIoTag.LineStyle != value)
                {
                    ValidateProperty(value, nameof(LineStyle));
                    var errors = GetErrors(nameof(LineStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.LineStyle = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Line Width must be greater than or equal to 0.")]
        public int? LineWidth
        {
            get => _digitalIoTag.LineWidth;
            set
            {
                if (_digitalIoTag.LineWidth != value)
                {
                    ValidateProperty(value, nameof(LineWidth));
                    var errors = GetErrors(nameof(LineWidth));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.LineWidth = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string? LineColor
        {
            get => _digitalIoTag.LineColor;
            set
            {
                if (_digitalIoTag.LineColor != value)
                {
                    ValidateProperty(value, nameof(LineColor));
                    var errors = GetErrors(nameof(LineColor));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.LineColor = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public bool? IsBadQuality
        {
            get => _digitalIoTag.DigitalIoTagCurrentValue?.IsBadQuality;
        }

        public bool? ManualData
        {
            get => _digitalIoTag.ManualData;
            set
            {
                if (_digitalIoTag.ManualData != value)
                {
                    ValidateProperty(value, nameof(ManualData));
                    var errors = GetErrors(nameof(ManualData));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _digitalIoTag.ManualData = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        private void ShowReadAddressBrowser()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowWarningDialog("Feature Not Implemented", "Not Implemented");
        }

        private bool CanShowReadAddressBrowser()
        {
            return true;
        }

        private void ShowHistoryAddressBrowser()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowWarningDialog("Feature Not Implemented", "Not Implemented");
        }

        private bool CanShowHistoryAddressBrowser()
        {
            return true;
        }

        private void ShowWriteAddressBrowser()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowWarningDialog("Feature Not Implemented", "Not Implemented");
        }

        private bool CanShowWriteAddressBrowser()
        {
            return true;
        }

        public bool? Value
        {
            get => _digitalIoTag.Value;
        }

        public DateTime DateTimeCreated
        {
            get => _digitalIoTag.DateTimeCreated;
        }

        private void SetDefaultValues()
        {
            AlarmPriority = Ioc.Default.GetService<IDataService>()?.Context.AlarmPriorities.FirstOrDefault()!;
            ReadAddressScanInterval = 1000;
            HistoryAddressScanInterval = 60000;
            IsCalculated = false;
            InvertState = false;
            AlarmDelay = 0;
            UseDefaultTrendStyle = true;
            LineColor = "Black";
            LineStyle = "Solid";
            LineWidth = 1;
        }
    }
}
