using System.Globalization;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class FloatConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is float floatValue)
            {
                return floatValue.ToString(culture);
            }
            return string.Empty;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string stringValue = value as string ?? string.Empty;
            if (float.TryParse(stringValue, NumberStyles.Float, culture, out float result))
            {
                return result;
            }
            return 0f; // Return 0 or any default value on conversion failure
        }
    }
}
