using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Input;
using EnerFlow.Helpers;
using EnerFlow.Models;
using EnerFlow.Services;
using Microsoft.Web.WebView2.Core;
using System.IO;
using System.Text.Json;
using System.Windows.Input;

namespace EnerFlow.ViewModels
{
    public class EquipmentViewModel : HierarchyViewModel
    {
        private EquipmentType _selectdEquipmentType = null!;
        private readonly Equipment _equipment = null!;
        public EquipmentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _equipment = hierarchy.Equipment!;
            _selectdEquipmentType = _equipment.EquipmentSubType?.EquipmentType ?? EquipmentTypes.First();
        }

        public EquipmentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Equipment equipment) : base(parentHierarchyViewModel, hierarchy)
        {
            _equipment = equipment;
            equipment.Hierarchy = hierarchy;
            SetDefaultValues();
        }

        public static IEnumerable<EquipmentStatus> EquipmentStatuses => Ioc.Default.GetService<IDataService>()?.Context.EquipmentStatuses.Local.OrderBy(e => e.Name).ToArray()!;

        public static IEnumerable<string> Manufacturers => Ioc.Default.GetService<IDataService>()?.Context.Equipment.OrderBy(e => e.Manufacturer).Select(e => e.Manufacturer).Distinct().ToArray()!;

        public IEnumerable<string> Models => Ioc.Default.GetService<IDataService>()?.Context.Equipment.Where(e => e.Manufacturer == Manufacturer).OrderBy(e => e.Model).Select(e => e.Model).Distinct().ToArray()!;
        
        public static IEnumerable<EquipmentType> EquipmentTypes => Ioc.Default.GetService<IDataService>()?.Context.EquipmentTypes.Local.OrderBy(e => e.Name).ToArray()!;

        public EquipmentType SelectedEquipmentType
        {
            get => _selectdEquipmentType;
            set
            {
                if (_selectdEquipmentType != value)
                {
                    ValidateProperty(value, nameof(SelectedEquipmentType));
                    var errors = GetErrors(nameof(SelectedEquipmentType));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _selectdEquipmentType = value;
                        OnPropertyChanged();
                        OnSelectedEquipmentTypeChanged();
                        
                    }
                }
            }
        }

        public IEnumerable<EquipmentSubType> EquipmentSubTypes => SelectedEquipmentType.EquipmentSubTypes.OrderBy(e => e.Name).ToArray()!;

        public EquipmentSubType EquipmentSubType
        {
            get => _equipment.EquipmentSubType!;
            set
            {
                if (_equipment.EquipmentSubType != value)
                {
                    ValidateProperty(value, nameof(EquipmentSubType));
                    var errors = GetErrors(nameof(EquipmentSubType));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.EquipmentSubType = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public EquipmentStatus EquipmentStatus
        {
            get => _equipment.EquipmentStatus!;
            set
            {
                if (_equipment.EquipmentStatus != value)
                {
                    ValidateProperty(value, nameof(EquipmentStatus));
                    var errors = GetErrors(nameof(EquipmentStatus));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.EquipmentStatus = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string SerialNumber
        {
            get => _equipment.SerialNumber!;
            set
            {
                if (_equipment.SerialNumber != value)
                {
                    ValidateProperty(value, nameof(SerialNumber));
                    var errors = GetErrors(nameof(SerialNumber));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.SerialNumber = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string AssetTag
        {
            get => _equipment.AssetTag!;
            set
            {
                if (_equipment.AssetTag != value)
                {
                    ValidateProperty(value, nameof(AssetTag));
                    var errors = GetErrors(nameof(AssetTag));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.AssetTag = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Model
        {
            get => _equipment.Model!;
            set
            {
                if (_equipment.Model != value)
                {
                    ValidateProperty(value, nameof(Model));
                    var errors = GetErrors(nameof(Model));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.Model = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Manufacturer
        {
            get => _equipment.Manufacturer!;
            set
            {
                if (_equipment.Manufacturer != value)
                {
                    ValidateProperty(value, nameof(Manufacturer));
                    var errors = GetErrors(nameof(Manufacturer));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.Manufacturer = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public DateOnly? InstallationDate
        {
            get => _equipment.InstallationDate;
            set
            {
                if (_equipment.InstallationDate != value)
                {
                    ValidateProperty(value, nameof(InstallationDate));
                    var errors = GetErrors(nameof(InstallationDate));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.InstallationDate = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Notes
        {
            get => _equipment.Notes ?? string.Empty;
            set
            {
                if (_equipment.Notes != value)
                {
                    ValidateProperty(value, nameof(Notes));
                    var errors = GetErrors(nameof(Notes));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _equipment.Notes = value;
                        if (!DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public DateTime DateTimeCreated => _equipment.DateTimeCreated;

        private void OnSelectedEquipmentTypeChanged()
        {
            OnPropertyChanged(nameof(EquipmentSubTypes));
            EquipmentSubType = _selectdEquipmentType.EquipmentSubTypes.FirstOrDefault()!;
        }

        private void SetDefaultValues()
        {
            SelectedEquipmentType = EquipmentTypes.First();
        }

    }
}
