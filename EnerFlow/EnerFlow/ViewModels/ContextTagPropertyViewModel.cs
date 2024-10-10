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

        public void ValidateAll()
        {
            ValidateAllProperties();
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
                            Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
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
                        Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                    }
                    OnPropertyChanged();
                }
            }
        }

        public object Value
        {
            get => _contextTagProperty.Value ?? 0;
            set
            {
                if (_contextTagProperty.Value != value)
                {
                    _contextTagProperty.Value = value;
                    if (!_contextTagViewModel.DisableAutoSave)
                    {
                        Ioc.Default.GetService<IDataService>()?.Context.SaveChanges();
                    }
                    OnPropertyChanged();
                }
            }
        }

        public string Type
        {
            get
            {
                if (_contextTagProperty.Value == null)
                {
                    return "String";
                }

                switch (_contextTagProperty.Value.GetType().Name)
                {
                    case "Boolean":
                        return "Boolean";
                    case "Double":
                        return "Float";
                    default:
                        return "String";
                }
            }
            set
            {
                if (Type != value)
                {
                    switch (value)
                    {
                        case "Boolean":
                            _contextTagProperty.Value = false;
                            break;
                        case "Float":
                            _contextTagProperty.Value = 0.0;
                            break;
                        default:
                            _contextTagProperty.Value = string.Empty;
                            break;
                    }
                    OnPropertyChanged();
                }
            }
        }
        public static ValidationResult ValidateName(string name, ValidationContext context)
        {
            var dataService = Ioc.Default.GetService<IDataService>();

            if (dataService == null)
            {
                return new ValidationResult("Data service not found");
            }

            // Perform a check against the service/database for uniqueness 
            bool isUnique = dataService.Context.ContextTagProperties.Count(c => c.Name == name) == 0;

            if (isUnique)
            {
                return ValidationResult.Success!;
            }

            return new ValidationResult("The name must be unique.");
        }
    }
}
