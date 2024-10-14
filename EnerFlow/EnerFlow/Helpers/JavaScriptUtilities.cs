namespace EnerFlow.Helpers
{
    public class JavaScriptUtilities
    {
        public static string EscapeJavaScriptString(string code)
        {
            if (string.IsNullOrEmpty(code))
            {
                return code;
            }

            return code
                .Replace("\\", "\\\\")   // Escape backslashes
                .Replace("`", "\\`")      // Escape backticks (for template literals)
                .Replace("\"", "\\\"")    // Escape double quotes
                .Replace("'", "\\'")      // Escape single quotes
                .Replace("\n", "\\n")     // Escape newlines
                .Replace("\r", "\\r")     // Escape carriage returns
                .Replace("\t", "\\t")     // Escape tabs
                .Replace("</", "<\\/");   // Avoid breaking out of HTML script tag context
        }
    }
}
