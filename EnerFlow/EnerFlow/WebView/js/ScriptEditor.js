var editor;
require.config({ paths: { 'vs': 'https://cdn.jsdelivr.net/npm/monaco-editor@0.52.0/min/vs' } });
require(['vs/editor/editor.main'], function () {
    editor = monaco.editor.create(document.getElementById('container'), {
        language: 'javascript'
    });
    editor.onDidChangeModelContent(sendCodeToHost);
    // Define a command to print the editor content
    editor.addAction({
        // Unique ID for the action
        id: 'printEditorContent',
        // Label that will appear in the command palette
        label: 'Print Editor Content',
        // Optional keybinding (Ctrl+P for example)
        keybindings: [
            monaco.KeyMod.CtrlCmd | monaco.KeyCode.KeyP // Ctrl+P (or Cmd+P on macOS)
        ],
        // Command precondition (leave as null to always allow it)
        precondition: null,
        // Context menu group ID and order (optional)
        contextMenuGroupId: 'navigation',
        contextMenuOrder: 1,
        // Function that will be executed when the action is triggered
        run: function () {
            printPlainTextEditorContent();
        }
    });
});

// Function to resize the editor
function resizeEditor() {
    if (editor) {
        editor.layout();  // Recalculate layout when container size changes
    }
}

// Attach the resize listener
window.addEventListener('resize', resizeEditor);
function OnEndKeyDown() {
    editor.trigger('keyboard', 'cursorEnd', null);
}

function OnHomeKeyDown() {
    editor.trigger('keyboard', 'cursorHome', null);
}
/**
 * Sends the current code to the host application via WebView2.
 */
function sendCodeToHost() {
    const currentCode = editor.getValue();
    window.chrome.webview.postMessage(currentCode);
}

// JavaScript function to set code in Monaco Editor
function setEditorContent(newCode) {
    if (editor) {
        editor.setValue(newCode);
    }
}

function printPlainTextEditorContent() {
    // Get the plain text content from the Monaco Editor
    const code = editor.getValue();

    // Open a new window for printing
    const printWindow = window.open('', '_blank', 'width=800,height=600');

    // Write the plain text content into the new window
    printWindow.document.open();
    printWindow.document.write(`
        <html>
        <head>
            <title>Print Code</title>
            <style>
                body {
                    font-family: monospace;
                    padding: 20px;
                }
                pre {
                    white-space: pre;
                }
            </style>
        </head>
        <body>
            <pre>${escapeHtml(code)}</pre>
        </body>
        </html>
    `);
    printWindow.document.close();

    // Trigger the print dialog when the content is loaded
    printWindow.onload = function () {
        printWindow.onafterprint = function () {
            printWindow.close();
        };

        printWindow.focus();
        printWindow.print();
    };
}

// Helper function to escape HTML special characters
function escapeHtml(text) {
    const map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
    };
    return text.replace(/[&<>]/g, function (m) { return map[m]; });
}