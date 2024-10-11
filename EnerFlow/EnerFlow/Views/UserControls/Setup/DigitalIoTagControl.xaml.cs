using EnerFlow.ViewModels;
using System.Text.Json;
using System.Windows.Controls;

namespace EnerFlow.Views.UserControls.Setup
{
    /// <summary>
    /// Interaction logic for DigitalIoTagControl.xaml
    /// </summary>
    public partial class DigitalIoTagControl : UserControl
    {
        public DigitalIoTagControl()
        {
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            if (DataContext is DigitalIoTagViewModel digitalIoTagViewModel)
            {
                digitalIoTagViewModel.SetExecuteScriptEditorWebViewScriptAction(async (script) =>
                {
                    var result = string.Empty;
                    if (ScriptEditorWebView.CoreWebView2 != null)
                    {
                        result = await ScriptEditorWebView.CoreWebView2.ExecuteScriptAsync(script);
                    }
                    return result;
                });
            }

        }
    }
}
