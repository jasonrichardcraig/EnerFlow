using EnerFlow.Helpers;
using Microsoft.Web.WebView2.Core;
using Microsoft.Web.WebView2.Wpf;
using System.IO;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Input;

namespace EnerFlow.Extensions
{
    public static class WebView2RichTextEditorExtensions
    {
        public static readonly DependencyProperty RichTextEditorTextProperty =
            DependencyProperty.RegisterAttached(
                "RichTextEditorText",
                typeof(string),
                typeof(WebView2RichTextEditorExtensions),
                new FrameworkPropertyMetadata(
                    null,
                    FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                    OnRichTextEditorTextChanged));

        // Dictionary to keep track of CoreWebView2 instances and their parent WebView2 controls
        private static readonly Dictionary<CoreWebView2, WebView2> _coreWebViewToWebViewMap = [];

        // ConditionalWeakTable to store flags for each WebView2 instance
        private static readonly ConditionalWeakTable<WebView2, WebViewUpdateState> _webViewUpdateStates = [];

        // ConditionalWeakTable to track initialization state for each WebView2 instance
        private static readonly ConditionalWeakTable<WebView2, WebViewInitializationState> _webViewInitializationStates = [];

        public static string GetRichTextEditorText(DependencyObject obj)
        {
            return (string)obj.GetValue(RichTextEditorTextProperty);
        }

        public static void SetRichTextEditorText(DependencyObject obj, string value)
        {
            obj.SetValue(RichTextEditorTextProperty, value);
        }

        private static async void OnRichTextEditorTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is WebView2 webView)
            {
                // Get or create the initialization state
                var initState = _webViewInitializationStates.GetOrCreateValue(webView);

                // If not initialized, proceed with initialization
                if (!initState.IsInitialized)
                {
                    initState.IsInitialized = true;

                    // Ensure WebView2 is initialized
                    await EnsureWebView2Initialized(webView);

                    // Get the new value from the DependencyPropertyChangedEventArgs
                    string? newText = e.NewValue is string text ? text : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newText != null
                            ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(newText)}`);"
                            : "setEditorContent(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
                else
                {
                    // Regular property change handling
                    // Get the update state for the current WebView2 instance
                    var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                    // If the change is coming from the WebView (tracked by updateState.IsUpdatingFromWebView), do nothing
                    if (updateState.IsUpdatingFromWebView)
                    {
                        return;
                    }

                    // Proceed to set the editor content
                    if (webView.CoreWebView2 != null)
                    {
                        string? newText = e.NewValue is string text ? text : null;
                        string scriptContent = newText != null
                            ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(newText)}`);"
                            : "setEditorContent(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
            }
        }

        private static async Task EnsureWebView2Initialized(WebView2 webView)
        {
            // Ensure that CoreWebView2 is initialized
            if (webView.CoreWebView2 == null)
            {
                await webView.EnsureCoreWebView2Async();

                if (webView.CoreWebView2 != null)
                {
                    // Map the CoreWebView2 to its parent WebView2 for later reference
                    _coreWebViewToWebViewMap[webView.CoreWebView2] = webView;

                    // Add the WebMessageReceived event handler for the RichTextEditor
                    webView.CoreWebView2.WebMessageReceived += CoreWebView2_WebMessageReceived;

                    webView.KeyDown += (sender, args) =>
                    {
                        if (args.Key == Key.End)
                        {
                            args.Handled = true;
                            webView.CoreWebView2.ExecuteScriptAsync("OnEndKeyDown();");
                        }
                        else if (args.Key == Key.Home)
                        {
                            args.Handled = true;
                            webView.CoreWebView2.ExecuteScriptAsync("OnHomeKeyDown();");
                        }
                    };

                    // Unsubscribe and remove references when the WebView2 control is unloaded
                    webView.Unloaded += (sender, args) =>
                    {
                        if (webView.CoreWebView2 != null)
                        {
                            webView.CoreWebView2.WebMessageReceived -= CoreWebView2_WebMessageReceived;
                            _coreWebViewToWebViewMap.Remove(webView.CoreWebView2);
                        }
                    };

                    // Fetch and apply the current value of RichTextEditorText after initialization
                    string currentText = GetRichTextEditorText(webView);

                    // Wait for the page to load and then set the editor's content
                    webView.NavigationCompleted += async (sender, args) =>
                    {
                        if (args.IsSuccess)
                        {
                            string scriptContent = currentText != null
                                ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(currentText)}`);"
                                : "setEditorContent(null);";

                            await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                        }
                    };
                    webView.Source = new Uri(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/RichTextEditor.html"));
                }
            }
        }

        private static void CoreWebView2_WebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
        {
            if (sender is CoreWebView2 coreWebView2 && _coreWebViewToWebViewMap.TryGetValue(coreWebView2, out WebView2? webView))
            {
                // Get the update state for the current WebView2 instance
                var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                // Mark that the update comes from the WebView
                updateState.IsUpdatingFromWebView = true;

                try
                {
                    string newText = e.TryGetWebMessageAsString();
                    string currentText = GetRichTextEditorText(webView);

                    // Update the attached property with the new text from the RichTextEditor only if it's different
                    if (currentText != newText)  // Prevent unnecessary property update
                    {
                        SetRichTextEditorText(webView, newText);
                    }
                }
                finally
                {
                    // Reset the flag once the update is done
                    updateState.IsUpdatingFromWebView = false;
                }
            }
        }
    }

    // Helper class to track the update state for each WebView2 instance
    internal class WebViewUpdateState
    {
        public bool IsUpdatingFromWebView { get; set; }
    }

    // Helper class to track initialization state for each WebView2 instance
    internal class WebViewInitializationState
    {
        public bool IsInitialized { get; set; }
    }
}

