using EnerFlow.ViewModels;
using System.Text.Json;
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
        private void ScriptEditorWebView_NavigationCompleted(object sender, Microsoft.Web.WebView2.Core.CoreWebView2NavigationCompletedEventArgs e)
        {
            if (e.IsSuccess)
            {
                if (DataContext is StringIoTagViewModel stringIoTagViewModel)
                {
                    SetCodeInMonacoEditor(stringIoTagViewModel.Script);
                }
            }
        }

        // Set code in Monaco Editor by calling JavaScript from C#
        private async void SetCodeInMonacoEditor(string code)
        {
            // Execute JavaScript to set the code in Monaco Editor
            string script = $"setCodeInEditor(`{EscapeJavaScriptString(code)}`);";
            await ScriptEditorWebView.CoreWebView2.ExecuteScriptAsync(script);
        }

        // Escape JavaScript string to handle special characters like newlines
        private string EscapeJavaScriptString(string code)
        {
            return code.Replace("\\", "\\\\").Replace("`", "\\`").Replace("\n", "\\n").Replace("\r", "\\r");
        }

        private void ScriptEditorWebView_WebMessageReceived(object sender, Microsoft.Web.WebView2.Core.CoreWebView2WebMessageReceivedEventArgs e)
        {
            // Get the message as a string
            string message = e.WebMessageAsJson;

            // Example: Process the message by deserializing it into a C# object using System.Text.Json
            try
            {
                // Deserialize the JSON string into a .NET object (defined below)
                WebMessage? webMessage = JsonSerializer.Deserialize<WebMessage>(message);

                // Check the message type and act accordingly
                if (webMessage?.MessageType == "Code")
                {
                    // Now you have access to the code from the Monaco Editor
                    string receivedCode = webMessage.Code;

                    if (DataContext is StringIoTagViewModel stringIoTagViewModel)
                    {
                        stringIoTagViewModel.Script = webMessage.Code;
                    }
                }
            }
            catch (JsonException jsonEx)
            {
                // Handle any errors that occur during deserialization
                Console.WriteLine("Error parsing message: " + jsonEx.Message);
            }
        }

        private void ScriptEditorWebView_Initialized(object sender, EventArgs e)
        {
            ScriptEditorWebView.Source = new Uri(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/ScriptEditor.html"));
        }

        class WebMessage
        {
            public required string MessageType { get; set; }
            public required string Code { get; set; }
        }
    }
}
