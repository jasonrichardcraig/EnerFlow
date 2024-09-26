using EnerFlow.Models;
using System.Globalization;
using System.Windows.Data;

namespace EnerFlow.Converters
{
    public class FacilityTypeConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is FacilityType facilityType && parameter is string selectedFacilityIdString)
            {
                int selectedFacilityId;
                if (int.TryParse(selectedFacilityIdString, out selectedFacilityId))
                {
                    return facilityType?.Id == selectedFacilityId;
                }
            }
            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
