// Initialize the map
var map = L.map('map').setView([55.15005079202691, -115.06870554500053], 5);

// Add OpenStreetMap tiles
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

// Function to add a marker from C#
function addMarker(lat, lng, message) {
    var marker = L.marker([lat, lng]).addTo(map);
    marker.bindPopup(message).openPopup();

    // Send a message to C# when the marker is clicked
    marker.on('click', function () {
        // Sending a message to WebView
        window.chrome.webview.postMessage({ event: "markerClicked", lat: lat, lng: lng, message: message });
    });
}