using System.Globalization;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    /// <summary>
    /// Converts a boolean value to a visibility value, where true is converted to Visibility.Collapsed and false is converted to Visibility.Visible.
    /// </summary>
    public class InvertedBooleanToVisibilityConverter : IValueConverter
    {
        /// <summary>
        /// Converts a boolean value to a visibility value.
        /// </summary>
        /// <param name="value">The boolean value to convert.</param>
        /// <param name="targetType">The type of the binding target property.</param>
        /// <param name="parameter">An optional parameter to be used in the conversion.</param>
        /// <param name="culture">The culture to use in the conversion.</param>
        /// <returns>The converted visibility value.</returns>
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool booleanValue)
            {
                return booleanValue ? System.Windows.Visibility.Collapsed : System.Windows.Visibility.Visible;
            }
            return System.Windows.Visibility.Collapsed;
        }

        /// <summary>
        /// Converts a visibility value back to a boolean value.
        /// </summary>
        /// <param name="value">The visibility value to convert.</param>
        /// <param name="targetType">The type of the binding target property.</param>
        /// <param name="parameter">An optional parameter to be used in the conversion.</param>
        /// <param name="culture">The culture to use in the conversion.</param>
        /// <returns>The converted boolean value.</returns>
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is System.Windows.Visibility visibility)
            {
                return visibility != System.Windows.Visibility.Visible;
            }
            return false;
        }
    }
}
