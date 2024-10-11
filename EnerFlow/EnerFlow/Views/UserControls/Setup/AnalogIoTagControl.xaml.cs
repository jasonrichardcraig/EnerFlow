using EnerFlow.ViewModels;
using System.Windows.Controls;
using System.Windows.Input;

namespace EnerFlow.Views.UserControls.Setup
{
    /// <summary>
    /// Interaction logic for AnalogIoTagControl.xaml
    /// </summary>
    public partial class AnalogIoTagControl : UserControl
    {
        public AnalogIoTagControl()
        {
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            if (DataContext is AnalogIoTagViewModel analogIoTagViewModel)
            {
                analogIoTagViewModel.SetExecuteScriptEditorWebViewScriptAction(async (script) =>
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
