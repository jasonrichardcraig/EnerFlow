using EnerFlow.ViewModels;
using System.Windows.Controls;

namespace EnerFlow.Views.UserControls.Setup
{
    /// <summary>
    /// Interaction logic for StringIoTagControl.xaml
    /// </summary>
    public partial class StringIoTagControl : UserControl
    {
        public StringIoTagControl()
        {
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            if (DataContext is StringIoTagViewModel stringIoTagViewModel)
            {
                stringIoTagViewModel.SetExecuteScriptEditorWebViewScriptAction(async (script) =>
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
