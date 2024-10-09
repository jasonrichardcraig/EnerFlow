using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

namespace EnerFlow.ViewModels
{
    public class StringIoTagViewModel : HierarchyViewModel
    {
        private readonly StringIoTag _stringIoTag = null!;

        public StringIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _stringIoTag = hierarchy.StringIoTag!;

            ShowReadAddressBrowserCommand = new RelayCommand(ShowReadAddressBrowser, CanShowReadAddressBrowser);
            ShowWriteAddressBrowserCommand = new RelayCommand(ShowWriteAddressBrowser, CanShowWriteAddressBrowser);

        }

        public StringIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, StringIoTag stringIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _stringIoTag = stringIoTag;
            stringIoTag.Hierarchy = hierarchy;

            ShowReadAddressBrowserCommand = new RelayCommand(ShowReadAddressBrowser, CanShowReadAddressBrowser);
            ShowWriteAddressBrowserCommand = new RelayCommand(ShowWriteAddressBrowser, CanShowWriteAddressBrowser);

            SetDefaultValues();
        }

        public IEnumerable<StringIoTagTrendValueDictionary> StringIoTagTrendValueDictionaries => [.. Ioc.Default.GetService<IDataService>()?.Context.StringIoTagTrendValueDictionaries];

        public RelayCommand ShowReadAddressBrowserCommand { get; set; }
        public RelayCommand ShowWriteAddressBrowserCommand { get; set; }


        public string ReadAddress
        {
            get => _stringIoTag.ReadAddress ?? string.Empty;
            set
            {
                if (_stringIoTag.ReadAddress != value)
                {
                    ValidateProperty(value, nameof(ReadAddress));
                    var errors = GetErrors(nameof(ReadAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.ReadAddress = value;
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
        public int? ReadAddressScanInterval
        {
            get => _stringIoTag.ReadAddressScanInterval;
            set
            {
                if (_stringIoTag.ReadAddressScanInterval != value)
                {
                    ValidateProperty(value, nameof(ReadAddressScanInterval));
                    var errors = GetErrors(nameof(ReadAddressScanInterval));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.ReadAddressScanInterval = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

       public bool? IsCalculated
        {
            get => _stringIoTag.IsCalculated;
            set
            {
                if (_stringIoTag.IsCalculated != value)
                {
                    ValidateProperty(value, nameof(IsCalculated));
                    var errors = GetErrors(nameof(IsCalculated));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.IsCalculated = value;
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
            get => _stringIoTag.Script ?? string.Empty;
            set
            {
                if (_stringIoTag.Script != value)
                {
                    ValidateProperty(value, nameof(Script));
                    var errors = GetErrors(nameof(Script));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.Script = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        [Range(0, int.MaxValue, ErrorMessage = "Length must be greater than or equal to 0.")]
        public int Length
        {
            get => _stringIoTag.Length ?? 0;
            set
            {
                if (_stringIoTag.Length != value)
                {
                    ValidateProperty(value, nameof(Length));
                    var errors = GetErrors(nameof(Length));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.Length = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string PaddingCharacter
        {
            get => _stringIoTag.PaddingCharacter ?? string.Empty;
            set
            {
                if (_stringIoTag.PaddingCharacter != value)
                {
                    ValidateProperty(value, nameof(PaddingCharacter));
                    var errors = GetErrors(nameof(PaddingCharacter));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.PaddingCharacter = value;
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
            get => _stringIoTag.WriteAddress ?? string.Empty;
            set
            {
                if (_stringIoTag.WriteAddress != value)
                {
                    ValidateProperty(value, nameof(WriteAddress));
                    var errors = GetErrors(nameof(WriteAddress));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.WriteAddress = value;
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
        public int DisplayOrder
        {
            get => _stringIoTag.DisplayOrder ?? 0;
            set
            {
                if (_stringIoTag.DisplayOrder != value)
                {
                    ValidateProperty(value, nameof(DisplayOrder));
                    var errors = GetErrors(nameof(DisplayOrder));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.DisplayOrder = value;
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
            get => _stringIoTag.UseDefaultTrendStyle;
            set
            {
                if (_stringIoTag.UseDefaultTrendStyle != value)
                {
                    ValidateProperty(value, nameof(UseDefaultTrendStyle));
                    var errors = GetErrors(nameof(UseDefaultTrendStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.UseDefaultTrendStyle = value;
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
            get => _stringIoTag.LineStyle ?? string.Empty;
            set
            {
                if (_stringIoTag.LineStyle != value)
                {
                    ValidateProperty(value, nameof(LineStyle));
                    var errors = GetErrors(nameof(LineStyle));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.LineStyle = value;
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
            get => _stringIoTag.LineWidth;
            set
            {
                if (_stringIoTag.LineWidth != value)
                {
                    ValidateProperty(value, nameof(LineWidth));
                    var errors = GetErrors(nameof(LineWidth));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.LineWidth = value;
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
            get => _stringIoTag.LineColor ?? string.Empty;
            set
            {
                if (_stringIoTag.LineColor != value)
                {
                    ValidateProperty(value, nameof(LineColor));
                    var errors = GetErrors(nameof(LineColor));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.LineColor = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public StringIoTagTrendValueDictionary StringIoTagTrendValueDictionary
        {
            get => _stringIoTag.StringIoTagTrendValueDictionary!;
            set
            {
                if (_stringIoTag.StringIoTagTrendValueDictionary != value)
                {
                    ValidateProperty(value, nameof(StringIoTagTrendValueDictionary));
                    var errors = GetErrors(nameof(StringIoTagTrendValueDictionary));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.StringIoTagTrendValueDictionary = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }


        public bool? IsBadQuality
        {
            get => _stringIoTag.StringIoTagCurrentValue?.IsBadQuality;
        }

        public double? ManualData
        {
            get => _stringIoTag.ManualData;
            set
            {
                if (_stringIoTag.ManualData != value)
                {
                    ValidateProperty(value, nameof(ManualData));
                    var errors = GetErrors(nameof(ManualData));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _stringIoTag.ManualData = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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

        private void ShowWriteAddressBrowser()
        {
            Ioc.Default.GetService<IDialogService>()?.ShowWarningDialog("Feature Not Implemented", "Not Implemented");
        }

        private bool CanShowWriteAddressBrowser()
        {
            return true;
        }

        private void SetDefaultValues()
        {
            ReadAddressScanInterval = 1000;
            IsCalculated = false;
            DisplayOrder = 0;
            PaddingCharacter = " ";
            Length = 0;
            UseDefaultTrendStyle = true;
            LineColor = "Black";
            LineStyle = "Solid";
            LineWidth = 1;
        }
    }
}
