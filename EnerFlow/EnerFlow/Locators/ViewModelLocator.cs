using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.ViewModels;

namespace EnerFlow.Locators
{
    public class ViewModelLocator
    {
        public MainViewModel MainViewModel => Ioc.Default.GetService<MainViewModel>() ?? null!;
    }
}
