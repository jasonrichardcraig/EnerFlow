﻿//using EnerFlow.Helpers;
//using Microsoft.Web.WebView2.Core;
//using Microsoft.Web.WebView2.Wpf;
//using System.IO;
//using System.Runtime.CompilerServices;
//using System.Windows;
//using System.Windows.Input;

//namespace EnerFlow.Extensions
//{
//    public static class WebView2MapExtensions
//    {
//        public static readonly DependencyProperty MapMarkersProperty =
//            DependencyProperty.RegisterAttached(
//                "MapMarkers",
//                typeof(string),
//                typeof(WebView2MapExtensions),
//                new FrameworkPropertyMetadata(
//                    null,
//                    FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
//                    OnMapMarkersChanged));

//        // Dictionary to keep track of CoreWebView2 instances and their parent WebView2 controls
//        private static readonly Dictionary<CoreWebView2, WebView2> _coreWebViewToWebViewMap = [];

//        // ConditionalWeakTable to store flags for each WebView2 instance
//        private static readonly ConditionalWeakTable<WebView2, WebViewUpdateState> _webViewUpdateStates = [];

//        // ConditionalWeakTable to track initialization state for each WebView2 instance
//        private static readonly ConditionalWeakTable<WebView2, WebViewInitializationState> _webViewInitializationStates = [];

//        public static void SetMapMarkers(DependencyObject obj, string value)
//        {
//            obj.SetValue(MapMarkersProperty, value);
//        }

//        private static async void OnMapMarkersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
//        {
//            if (d is WebView2 webView)
//            {
//                // Get or create the initialization state
//                var initState = _webViewInitializationStates.GetOrCreateValue(webView);

//                // If not initialized, proceed with initialization
//                if (!initState.IsInitialized)
//                {
//                    initState.IsInitialized = true;

//                    // Ensure WebView2 is initialized
//                    await EnsureWebView2Initialized(webView);

//                    // Get the new value from the DependencyPropertyChangedEventArgs
//                    string? newMapMarkers = e.NewValue is IEnumerable<object> text ? text : null;

//                    // Proceed to set the editor content even if newText is null
//                    if (webView.CoreWebView2 != null)
//                    {
//                        string scriptContent = newMapMarkers != null
//                            ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(newMapMarkers)}`);"
//                            : "setEditorContent(null);";

//                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
//                    }
//                }
//                else
//                {
//                    // Regular property change handling
//                    // Get the update state for the current WebView2 instance
//                    var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

//                    // If the change is coming from the WebView (tracked by updateState.IsUpdatingFromWebView), do nothing
//                    if (updateState.IsUpdatingFromWebView)
//                    {
//                        return;
//                    }

//                    // Proceed to set the editor content
//                    if (webView.CoreWebView2 != null)
//                    {
//                        string? newText = e.NewValue is string text ? text : null;
//                        string scriptContent = newText != null
//                            ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(newText)}`);"
//                            : "setEditorContent(null);";

//                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
//                    }
//                }
//            }
//        }

//        private static async Task EnsureWebView2Initialized(WebView2 webView)
//        {
//            // Ensure that CoreWebView2 is initialized
//            if (webView.CoreWebView2 == null)
//            {
//                await webView.EnsureCoreWebView2Async();

//                if (webView.CoreWebView2 != null)
//                {
//                    // Map the CoreWebView2 to its parent WebView2 for later reference
//                    _coreWebViewToWebViewMap[webView.CoreWebView2] = webView;

//                    // Add the WebMessageReceived event handler for the ScriptEditor
//                    webView.CoreWebView2.WebMessageReceived += CoreWebView2_WebMessageReceived;

//                    // Unsubscribe and remove references when the WebView2 control is unloaded
//                    webView.Unloaded += (sender, args) =>
//                    {
//                        if (webView.CoreWebView2 != null)
//                        {
//                            webView.CoreWebView2.WebMessageReceived -= CoreWebView2_WebMessageReceived;
//                            _coreWebViewToWebViewMap.Remove(webView.CoreWebView2);
//                        }
//                    };

//                    // Fetch and apply the current value of ScriptEditorText after initialization
//                    string currentText = GetScriptEditorText(webView);

//                    // Wait for the page to load and then set the editor's content
//                    webView.NavigationCompleted += async (sender, args) =>
//                    {
//                        if (args.IsSuccess)
//                        {
//                            string scriptContent = currentText != null
//                                ? $"setEditorContent(`{JavaScriptUtilities.EscapeJavaScriptString(currentText)}`);"
//                                : "setEditorContent(null);";

//                            await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
//                        }
//                    };
//                    webView.Source = new Uri(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/ScriptEditor.html"));
//                }
//            }
//        }

//        private static void CoreWebView2_WebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
//        {
//            if (sender is CoreWebView2 coreWebView2 && _coreWebViewToWebViewMap.TryGetValue(coreWebView2, out WebView2? webView))
//            {
//                // Get the update state for the current WebView2 instance
//                var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

//                // Mark that the update comes from the WebView
//                updateState.IsUpdatingFromWebView = true;

//                try
//                {
//                    string newText = e.TryGetWebMessageAsString();
//                    string currentText = GetScriptEditorText(webView);

//                    // Update the attached property with the new text from the ScriptEditor only if it's different
//                    if (currentText != newText)  // Prevent unnecessary property update
//                    {
//                        SetScriptEditorText(webView, newText);
//                    }
//                }
//                finally
//                {
//                    // Reset the flag once the update is done
//                    updateState.IsUpdatingFromWebView = false;
//                }
//            }
//        }
//        // Helper class to track the update state for each WebView2 instance
//        internal class WebViewUpdateState
//        {
//            public bool IsUpdatingFromWebView { get; set; }
//        }

//        // Helper class to track initialization state for each WebView2 instance
//        internal class WebViewInitializationState
//        {
//            public bool IsInitialized { get; set; }
//        }
//    }


//}

