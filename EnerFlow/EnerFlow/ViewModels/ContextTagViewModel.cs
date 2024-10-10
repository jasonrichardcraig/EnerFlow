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

                    _contextTagPropertyViewModels.CollectionChanged += _contextTagPropertyViewModels_CollectionChanged;

                    loaded = true;
                }
                return _contextTagPropertyViewModels;
            }
        }

        private void _contextTagPropertyViewModels_CollectionChanged(object? sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            var dataService = Ioc.Default.GetService<IDataService>() ?? null!;

            switch (e.Action)
            {
                case NotifyCollectionChangedAction.Add:
                    if (e.NewItems != null)
                    {
                        foreach (ContextTagPropertyViewModel contextTagPropertyViewModel in e.NewItems)
                        {
                            contextTagPropertyViewModel.ContextTagViewModel = this;
                            contextTagPropertyViewModel.ContextTagProperty = new ContextTagProperty()
                            {
                                ContextTag = _contextTag,
                                Name = "New Property",
                                Description = string.Empty,
                                Value = string.Empty,
                                DateTimeCreated = DateTime.Now
                            };

                            //_contextTag.ContextTagProperties.Add(contextTagPropertyViewModel.ContextTagProperty);

                            dataService.Context.ContextTagProperties.Add(contextTagPropertyViewModel.ContextTagProperty);
                        }
                    }
                    break;
                case NotifyCollectionChangedAction.Remove:
                    if (e.OldItems != null)
                    {
                        foreach (ContextTagPropertyViewModel contextTagPropertyViewModel in e.OldItems)
                        {
                           // _contextTag.ContextTagProperties.Remove(contextTagPropertyViewModel.ContextTagProperty);
                           dataService.Context.ContextTagProperties.Remove(contextTagPropertyViewModel.ContextTagProperty);
                        }
                    }
                    break;
            }
            //if (!DisableAutoSave)
            //{
            //    dataService.Context.SaveChanges();
            //}
        }

    }
}
