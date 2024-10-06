var editor;
require.config({ paths: { 'vs': 'https://cdn.jsdelivr.net/npm/monaco-editor@0.52.0/min/vs' } });
require(['vs/editor/editor.main'], function () {
    editor = monaco.editor.create(document.getElementById('container'), {
        language: 'javascript'
    });

    editor.onDidChangeModelContent(throttle(sendCodeToHost, 500));

});

function onDidChangeModelContent(event) {
    window.alert(event);
}

// Function to resize the editor
function resizeEditor() {
    if (editor) {
        editor.layout();  // Recalculate layout when container size changes
    }
}

// Attach the resize listener
window.addEventListener('resize', resizeEditor);

/**
  * Throttle function: ensures the callback is called at most once every `limit` milliseconds.
  * @param {Function} func - The function to throttle.
  * @param {number} limit - The time limit in milliseconds.
  * @returns {Function} - The throttled function.
  */
function throttle(func, limit) {
    let lastFunc;
    return function (...args) {
        const context = this;
        clearTimeout(lastFunc); // Clear the previous timer
        lastFunc = setTimeout(function () {
            func.apply(context, args); // Execute the function after the limit
        }, limit); // Wait for the limit before executing
    }
}

/**
 * Sends the current code to the host application via WebView2.
 */
function sendCodeToHost() {
    const currentCode = editor.getValue();
    window.chrome.webview.postMessage({ MessageType: "Code", Code: currentCode });
}

// JavaScript function to set code in Monaco Editor
function setCodeInEditor(newCode) {
    if (editor) {
        editor.setValue(newCode);
    }
}