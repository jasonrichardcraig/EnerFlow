using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

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

        private void MonacoWebView_NavigationCompleted(object sender, Microsoft.Web.WebView2.Core.CoreWebView2NavigationCompletedEventArgs e)
        {

        }

        private void MonacoWebView_WebMessageReceived(object sender, Microsoft.Web.WebView2.Core.CoreWebView2WebMessageReceivedEventArgs e)
        {

        }

        private void MonacoWebView_Initialized(object sender, EventArgs e)
        {
            MonacoWebView.Source = new Uri(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/Monaco.html"));
        }
    }
}
