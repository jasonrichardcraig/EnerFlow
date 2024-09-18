using EnerFlow.ViewModels;
using System.Globalization;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class SystemTreeViewItemSourceConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is HierarchyViewModel hierarchyViewModel)
            {
                return new List<HierarchyViewModel> { hierarchyViewModel };
            }
            return null!;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
