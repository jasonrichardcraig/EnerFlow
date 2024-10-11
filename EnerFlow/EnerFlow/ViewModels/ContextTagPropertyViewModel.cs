using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.ComponentModel.DataAnnotations;

namespace EnerFlow.ViewModels
{
    public class ContextTagPropertyViewModel : ObservableValidator
    {
        private ContextTagViewModel _contextTagViewModel = null!;
        private ContextTagProperty _contextTagProperty = null!;

        public ContextTagViewModel ContextTagViewModel
        {
            get => _contextTagViewModel;
            set
            {
                _contextTagViewModel = value;
                OnPropertyChanged();
            }
        }

        public ContextTagProperty ContextTagProperty
        {
            get => _contextTagProperty;
            set
            {
                _contextTagProperty = value;
                OnPropertyChanged();
            }
        }

        [Required(ErrorMessage = "Name is required.", AllowEmptyStrings = false)]
        [CustomValidation(typeof(ContextTagPropertyViewModel), nameof(ValidateName))]
        public string Name
        {
            get => _contextTagProperty.Name;
            set
            {
                if (_contextTagProperty.Name != value)
                {
                    ValidateProperty(value, nameof(Name));
                    var errors = GetErrors(nameof(Name));
                    if (errors == null || !errors.Cast<object>().Any())
                    {
                        _contextTagProperty.Name = value;
                        if (!_contextTagViewModel.DisableAutoSave)
                        {
                            Ioc.Default.GetService<IDataService>()?.SaveChanges();
                        }
                        OnPropertyChanged();
                    }
                }
            }
        }

        public string Description
        {
            get => _contextTagProperty.Description ?? string.Empty;
            set
            {
                if (_contextTagProperty.Description != value)
                {
                    _contextTagProperty.Description = value;
                    if (!_contextTagViewModel.DisableAutoSave)
                    {
                        Ioc.Default.GetService<IDataService>()?.SaveChanges();
                    }
                    OnPropertyChanged();
                }
            }
        }

        public string Value
        {
            get => _contextTagProperty.Value ?? string.Empty;
            set
            {
                if (_contextTagProperty.Value != value)
                {
                    _contextTagProperty.Value = value;
                    if (!_contextTagViewModel.DisableAutoSave)
                    {
                        Ioc.Default.GetService<IDataService>()?.SaveChanges();
                    }
                    OnPropertyChanged();
                }
            }
        }

        public static ValidationResult ValidateName(string name)
        {
            bool isUnique = !Ioc.Default.GetService<IDataService>()!.Context.ContextTagProperties.Any(c => c.Name == name);
            if (isUnique)
            {
                return ValidationResult.Success!;
            }
            return new ValidationResult("The name must be unique.");
        }
    }
}
