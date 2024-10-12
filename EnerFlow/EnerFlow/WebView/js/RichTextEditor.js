$(document).ready(function () {
    $('#summernote').summernote({
        toolbar: [
            // Font styling
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
            ['fontname', ['fontname']], // Font selection
            ['fontsize', ['fontsize']], // Font size
            ['color', ['color']], // Font color and background color

            // Paragraph formatting
            ['para', ['ul', 'ol', 'paragraph', 'height']],

            // Insert options
            ['insert', ['link', 'picture', 'video', 'table', 'hr']],

            // Miscellaneous options
            ['view', ['help']], // Removed 'fullscreen'
            ['undo', ['undo', 'redo']], // Undo/redo

            // Text alignment
            ['alignment', ['alignleft', 'aligncenter', 'alignright', 'alignjustify']],

            // Table operations
            ['table', ['table']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana'],
        fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana'] // Ignore browser support check
    });
});

function setEditorContent(newText) {
    if ($('#summernote')) {
        $('#summernote').summernote('code', newText);
    }
}

$('#summernote').on('summernote.change', function (we, contents, $editable) {
    window.chrome.webview.postMessage(contents);
});

function OnEndKeyDown() {
    moveCaretToEndOfLine();
}

function OnHomeKeyDown() {
    moveCaretToStartOfLine();
}

function moveCaretToStartOfLine() {
    var editable = $('.note-editable')[0]; // Get the editable area
    var selection = window.getSelection();
    var range = selection.getRangeAt(0); // Get the current caret position

    // If a valid range exists
    if (range) {
        var startContainer = range.startContainer;

        // If the caret is inside a text node
        if (startContainer.nodeType === Node.TEXT_NODE) {
            range.setStart(startContainer, 0); // Move caret to the start of the text node
            range.setEnd(startContainer, 0);
        }

        // If it's not a text node, select the contents of the block element (like a <p>)
        else {
            var blockNode = startContainer.closest('p') || startContainer; // You can customize this for other block elements like <div>
            range.selectNodeContents(blockNode);
            range.collapse(true); // Collapse to the start of the block
        }

        // Clear any existing selection and apply the new range
        selection.removeAllRanges();
        selection.addRange(range);

        editable.focus(); // Ensure the editable area is focused
    }
}

function moveCaretToEndOfLine() {
    var editable = $('.note-editable')[0]; // Get the editable area
    var selection = window.getSelection();
    var range = selection.getRangeAt(0); // Get the current caret position

    // If a valid range exists
    if (range) {
        var endContainer = range.endContainer;

        // If the caret is inside a text node
        if (endContainer.nodeType === Node.TEXT_NODE) {
            range.setStart(endContainer, endContainer.length); // Move caret to the end of the text node
            range.setEnd(endContainer, endContainer.length);
        }

        // If it's not a text node, select the contents of the block element (like a <p>)
        else {
            var blockNode = endContainer.closest('p') || endContainer; // You can customize this for other block elements like <div>
            range.selectNodeContents(blockNode);
            range.collapse(false); // Collapse to the end of the block
        }

        // Clear any existing selection and apply the new range
        selection.removeAllRanges();
        selection.addRange(range);

        editable.focus(); // Ensure the editable area is focused
    }
}