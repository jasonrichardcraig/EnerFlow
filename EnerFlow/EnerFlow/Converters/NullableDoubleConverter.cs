using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class NullableDoubleConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return string.Empty;
            return value.ToString()!;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string? input = value as string;
            if (string.IsNullOrWhiteSpace(input))
            {
                return null!;
            }

            if (double.TryParse(input, out double result))
            {
                return result;
            }

            return DependencyProperty.UnsetValue; // Return this to indicate a conversion error.
        }
    }
}
