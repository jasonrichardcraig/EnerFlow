using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class DateOnlyToDateTimeConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // Convert DateOnly? to DateTime?
            if (value is DateOnly dateOnly)
            {
                return (DateTime?)dateOnly.ToDateTime(TimeOnly.MinValue);
            }

            return DependencyProperty.UnsetValue;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // Convert DateTime? to DateOnly?
            if (value is DateTime dateTime)
            {
                return (DateOnly?)DateOnly.FromDateTime(dateTime);
            }

            return DependencyProperty.UnsetValue;
        }
    }
}
