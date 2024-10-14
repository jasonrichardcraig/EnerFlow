using EnerFlow.Helpers;
using EnerFlow.Models;
using Microsoft.Web.WebView2.Core;
using Microsoft.Web.WebView2.Wpf;
using System.IO;
using System.Runtime.CompilerServices;
using System.Text.Json;
using System.Windows;

namespace EnerFlow.Extensions
{
    public static class WebView2MapExtensions
    {
        public static readonly DependencyProperty MapMarkersProperty =
            DependencyProperty.RegisterAttached(
                "MapMarkers",
                typeof(List<MapMarker>),
                typeof(WebView2MapExtensions),
                new FrameworkPropertyMetadata(
                    null,
                    FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                    OnMapMarkersChanged));

        // Dictionary to keep track of CoreWebView2 instances and their parent WebView2 controls
        private static readonly Dictionary<CoreWebView2, WebView2> _coreWebViewToWebViewMap = [];

        // ConditionalWeakTable to store flags for each WebView2 instance
        private static readonly ConditionalWeakTable<WebView2, WebViewUpdateState> _webViewUpdateStates = [];

        // ConditionalWeakTable to track initialization state for each WebView2 instance
        private static readonly ConditionalWeakTable<WebView2, WebViewInitializationState> _webViewInitializationStates = [];

        public static List<MapMarker> GetMapMarkers(DependencyObject obj)
        {
            return (List<MapMarker>)obj.GetValue(MapMarkersProperty);
        }

        public static void SetMapMarkers(DependencyObject obj, string value)
        {
            obj.SetValue(MapMarkersProperty, value);
        }

        private static async void OnMapMarkersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
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
                    List<MapMarker>? newMapMarkers = e.NewValue is List<MapMarker> mapMarkers ? mapMarkers : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newMapMarkers != null
                            ? $"setMapMarkers(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapMarkers))}`);"
                            : "setMapMarkers(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
                else
                {
                    // Regular property change handling
                    // Get the update state for the current WebView2 instance
                    var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                    // Proceed to set the editor content
                    if (webView.CoreWebView2 != null)
                    {
                        List<MapMarker>? newMapMarkers = e.NewValue is List<MapMarker> mapMarkers ? mapMarkers : null;
                        string scriptContent = newMapMarkers != null
                            ? $"setMapMarkers(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapMarkers))}`);"
                            : "setMapMarkers(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
            }
        }

        // MapCenter attached property
        public static readonly DependencyProperty MapCenterProperty =
            DependencyProperty.RegisterAttached(
                "MapCenter",
                typeof(MapCenter),
                typeof(WebView2MapExtensions),
                new PropertyMetadata(null, OnMapCenterChanged));

        public static void SetMapCenter(WebView2 webView, MapCenter value)
        {
            webView.SetValue(MapCenterProperty, value);
        }

        public static MapCenter GetMapCenter(WebView2 webView)
        {
            return (MapCenter)webView.GetValue(MapCenterProperty);
        }

        private static async void OnMapCenterChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
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
                    MapCenter? newMapCenter = e.NewValue is MapCenter mapCenter ? mapCenter : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newMapCenter != null
                            ? $"setMapCenter(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapCenter))}`);"
                            : "setMapCenter(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
                else
                {
                    // Regular property change handling
                    // Get the update state for the current WebView2 instance
                    var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                    // If the change is coming from the WebView (tracked by updateState.IsMapCenterUpdatingFromWebView), do nothing
                    if (updateState.IsMapCenterUpdatingFromWebView)
                    {
                        return;
                    }

                    // Get the new value from the DependencyPropertyChangedEventArgs
                    MapCenter? newMapCenter = e.NewValue is MapCenter mapCenter ? mapCenter : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newMapCenter != null
                            ? $"setMapCenter(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapCenter))}`);"
                            : "setMapCenter(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
            }
        }

        // SelectedMapMarker attached property
        public static readonly DependencyProperty SelectedMapMarkerProperty =
            DependencyProperty.RegisterAttached(
                "SelectedMapMarker",
                typeof(MapMarker),
                typeof(WebView2MapExtensions),
                new PropertyMetadata(null, OnSelectedMapMarkerChanged));

        public static void SetSelectedMapMarker(WebView2 webView, MapMarker value)
        {
            webView.SetValue(SelectedMapMarkerProperty, value);
        }

        public static MapMarker GetSelectedMapMarker(WebView2 webView)
        {
            return (MapMarker)webView.GetValue(SelectedMapMarkerProperty);
        }

        private static async void OnSelectedMapMarkerChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
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
                    MapMarker? newMapMarker = e.NewValue is MapMarker mapMarker ? mapMarker : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newMapMarker != null
                            ? $"setSelectedMapMarker(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapMarker))}`);"
                            : "setSelectedMapMarker(null);";

                        await webView.CoreWebView2.ExecuteScriptAsync(scriptContent);
                    }
                }
                else
                {
                    // Regular property change handling
                    // Get the update state for the current WebView2 instance
                    var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                    // If the change is coming from the WebView (tracked by updateState.IsSelectedMapMarkerUpdatingFromWebView), do nothing
                    if (updateState.IsSelectedMapMarkerUpdatingFromWebView)
                    {
                        return;
                    }

                    // Get the new value from the DependencyPropertyChangedEventArgs
                    MapMarker? newMapMarker = e.NewValue is MapMarker mapMarker ? mapMarker : null;

                    // Proceed to set the editor content even if newText is null
                    if (webView.CoreWebView2 != null)
                    {
                        string scriptContent = newMapMarker != null
                            ? $"setSelectedMapMarker(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(newMapMarker))}`);"
                            : "setSelectedMapMarker(null);";

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

                    // Add the WebMessageReceived event handler for the ScriptEditor
                    webView.CoreWebView2.WebMessageReceived += CoreWebView2_WebMessageReceived;

                    // Unsubscribe and remove references when the WebView2 control is unloaded
                    webView.Unloaded += (sender, args) =>
                    {
                        if (webView.CoreWebView2 != null)
                        {
                            webView.CoreWebView2.WebMessageReceived -= CoreWebView2_WebMessageReceived;
                            _coreWebViewToWebViewMap.Remove(webView.CoreWebView2);
                        }
                    };

                    // Fetch and apply the current value of MapMarkers after initialization
                    List<MapMarker> currentMapMarkers = GetMapMarkers(webView);

                    // Fetch and apply the current value of MapCenter after initialization
                    MapCenter currentMapCenter = GetMapCenter(webView);

                    // Fetch and apply the current value of SelectedMapMarker after initialization
                    MapMarker currentSelectedMapMarker = GetSelectedMapMarker(webView);

                    // Wait for the page to load and then set the editor's content
                    webView.NavigationCompleted += async (sender, args) =>
                    {
                        if (args.IsSuccess)
                        {
                            string currentMapMarkersScriptContent = currentMapMarkers != null
                                ? $"setMapMarkers(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(currentMapMarkers))}`);"
                                : "setMapMarkers(null);";

                            await webView.CoreWebView2.ExecuteScriptAsync(currentMapMarkersScriptContent);

                            string currentMapCenterScriptContent = currentMapMarkers != null
                                ? $"setSelectedMapMarker(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(currentSelectedMapMarker))}`);"
                                : "setSelectedMapMarker(null);";

                            await webView.CoreWebView2.ExecuteScriptAsync(currentMapCenterScriptContent);

                            string currentSelectedMapMarkerScriptContent = currentMapMarkers != null
                                ? $"setMapMarkers(`{JavaScriptUtilities.EscapeJavaScriptString(JsonSerializer.Serialize(currentMapMarkers))}`);"
                                : "setMapMarkers(null);";

                            await webView.CoreWebView2.ExecuteScriptAsync(currentSelectedMapMarkerScriptContent);
                        }
                    };
                    webView.Source = new Uri(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "WebView/Map.html"));
                }
            }
        }

        private static void CoreWebView2_WebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
        {
            if (sender is CoreWebView2 coreWebView2 && _coreWebViewToWebViewMap.TryGetValue(coreWebView2, out WebView2? webView))
            {
                // Get the update state for the current WebView2 instance
                var updateState = _webViewUpdateStates.GetOrCreateValue(webView);

                try
                {
                    string webMessage = e.WebMessageAsJson;

                    using (JsonDocument doc = JsonDocument.Parse(webMessage))
                    {
                        // Get the root element
                        var root = doc.RootElement;

                        // Access the individual properties
                        string? messageType = root.GetProperty("MessageType").GetString();

                        switch (messageType)
                        {
                            case "MapMarkerSelected":
                                // Deserialize the MapMarker object
                                MapMarker currentSelectedMapMarker = GetSelectedMapMarker(webView);
                                MapMarker? newSelectedMapMarker = JsonSerializer.Deserialize<MapMarker>(root.GetProperty("SelectedMapMarker").GetRawText());
                                // Update the attached property with the new MapMarker from the Map only if it's different
                                if (currentSelectedMapMarker != newSelectedMapMarker)  // Prevent unnecessary property update
                                {
                                    updateState.IsSelectedMapMarkerUpdatingFromWebView = true;
                                    SetSelectedMapMarker(webView, newSelectedMapMarker!);
                                }
                                break;
                            case "MapCenterChanged":
                                // Deserialize the MapCenter object
                                MapCenter currentMapCenter = GetMapCenter(webView);
                                MapCenter? newMapCenter = JsonSerializer.Deserialize<MapCenter>(root.GetProperty("MapCenter").GetRawText());
                                // Update the attached property with the new MapCenter from the Map only if it's different
                                if (currentMapCenter != newMapCenter)  // Prevent unnecessary property update
                                {
                                    updateState.IsMapCenterUpdatingFromWebView = true;
                                    SetMapCenter(webView, newMapCenter!);
                                }
                                break;
                        }

                    }
                }
                finally
                {
                    // Reset the flags once the update is done
                    updateState.IsSelectedMapMarkerUpdatingFromWebView = false;
                    updateState.IsMapCenterUpdatingFromWebView = false;
                }
            }
        }
        // Helper class to track the update state for each WebView2 instance
        internal class WebViewUpdateState
        {
            public bool IsMapCenterUpdatingFromWebView { get; set; }
            public bool IsSelectedMapMarkerUpdatingFromWebView { get; set; }
        }

        // Helper class to track initialization state for each WebView2 instance
        internal class WebViewInitializationState
        {
            public bool IsInitialized { get; set; }
        }
    }


}

