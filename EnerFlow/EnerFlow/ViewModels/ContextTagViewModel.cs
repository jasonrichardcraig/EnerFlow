using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.Models;
using EnerFlow.Services;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace EnerFlow.ViewModels
{
    public class ContextTagViewModel : HierarchyViewModel
    {
        private bool loaded = false;
        private readonly ObservableCollection<ContextTagPropertyViewModel> _contextTagPropertyViewModels = [];
        private readonly ContextTag _contextTag = null!;

        public ContextTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _contextTag = hierarchy.ContextTag!;
        }

        public ContextTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, ContextTag contextTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _contextTag = contextTag;
            contextTag.Hierarchy = hierarchy;
        }

        public ObservableCollection<ContextTagPropertyViewModel> ContextTagPropertyViewModels
        {
            get
            {
                if (!loaded)
                {
                    foreach (var contextTagProperty in _contextTag.ContextTagProperties)
                    {
                        _contextTagPropertyViewModels.Add(new ContextTagPropertyViewModel()
                        {
                            ContextTagViewModel = this,
                            ContextTagProperty = contextTagProperty
                        });
                    }
                    _contextTagPropertyViewModels.CollectionChanged += ContextTagPropertyViewModels_CollectionChanged;
                    loaded = true;
                }
                return _contextTagPropertyViewModels;
            }
        }

        private void ContextTagPropertyViewModels_CollectionChanged(object? sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            var dataService = Ioc.Default.GetService<IDataService>() ?? null!;

            switch (e.Action)
            {
                case NotifyCollectionChangedAction.Add:
                    if (e.NewItems != null)
                    {
                        foreach (ContextTagPropertyViewModel contextTagPropertyViewModel in e.NewItems)
                        {
                            var newName = GenerateUniqueName("New Property");
                            contextTagPropertyViewModel.ContextTagViewModel = this;
                            contextTagPropertyViewModel.ContextTagProperty = new ContextTagProperty()
                            {
                                ContextTag = _contextTag,
                                Name = newName,
                                Description = string.Empty,
                                Value = string.Empty,
                                DateTimeCreated = DateTime.Now
                            };
                            dataService.Context.ContextTagProperties.Add(contextTagPropertyViewModel.ContextTagProperty);
                        }
                    }
                    break;
                case NotifyCollectionChangedAction.Remove:
                    if (e.OldItems != null)
                    {
                        foreach (ContextTagPropertyViewModel contextTagPropertyViewModel in e.OldItems)
                        {
                           dataService.Context.ContextTagProperties.Remove(contextTagPropertyViewModel.ContextTagProperty);
                        }
                    }
                    break;
            }
            if (!DisableAutoSave)
            {
                dataService.SaveChanges();
            }
        }
        private string GenerateUniqueName(string baseName)
        {
            // Get all current names of ContextTagProperties within this ContextTag
            var existingNames = _contextTag.ContextTagProperties
                .Select(c => c.Name)
                .ToList();
            var newName = baseName;
            int counter = 1;
            // Increment the name until it is unique
            while (existingNames.Contains(newName))
            {
                newName = $"{baseName} {counter++}";
            }
            return newName;
        }
    }
}
