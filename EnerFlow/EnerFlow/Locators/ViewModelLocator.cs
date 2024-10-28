using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.ViewModels;

namespace EnerFlow.Locators
{
    public class ViewModelLocator
    {
#pragma warning disable CA1822 // Mark members as static (false positive), this property is late time bound
        public MainViewModel MainViewModel => Ioc.Default.GetService<MainViewModel>() ?? null!;
#pragma warning restore CA1822 // Mark members as static
    }
}
