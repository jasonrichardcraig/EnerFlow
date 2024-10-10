using CommunityToolkit.Mvvm.DependencyInjection;
using CommunityToolkit.Mvvm.Messaging;
using EnerFlow.Messages;
using EnerFlow.ViewModels;
using System.Windows;
namespace EnerFlow.Views
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {

            InitializeComponent();

            WeakReferenceMessenger.Default.Register<CloseWindowMessage>(this, (r, m) =>
            {
                Close();
            });

            Ioc.Default.GetService<MainViewModel>()?.SetExecuteMapScriptAction(async (script) =>
            {
                var result = string.Empty;
                if (MapWebView.CoreWebView2 != null)
                {
                    result = await MapWebView.CoreWebView2.ExecuteScriptAsync(script);
                }
                return result;
            });

        }
    }
}