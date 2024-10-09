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
