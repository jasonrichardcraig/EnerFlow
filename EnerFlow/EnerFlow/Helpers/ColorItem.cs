using System.Windows.Media;

namespace EnerFlow.Helpers
{
    public class ColorItem
    {
        public required string Name { get; set; }
        public required string DisplayName { get; set; }
        public required Brush Color { get; set; }
    }
}
