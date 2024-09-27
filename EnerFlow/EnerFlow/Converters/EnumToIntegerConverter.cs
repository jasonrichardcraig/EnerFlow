using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class EnumToIntegerConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is Enum enumValue)
            {
                return System.Convert.ToInt32(enumValue);
            }

            return DependencyProperty.UnsetValue;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int intValue)
            {
                return Enum.ToObject(targetType, intValue);
            }

            return DependencyProperty.UnsetValue;
        }
    }

}
