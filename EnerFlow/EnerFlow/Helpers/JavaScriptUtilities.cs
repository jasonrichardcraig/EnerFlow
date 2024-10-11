namespace EnerFlow.Helpers
{
    public class JavaScriptUtilities
    {
        public static string EscapeJavaScriptString(string code)
        {
            return code.Replace("\\", "\\\\").Replace("`", "\\`").Replace("\n", "\\n").Replace("\r", "\\r");
        }
    }
}
