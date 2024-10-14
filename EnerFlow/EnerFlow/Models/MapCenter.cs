namespace EnerFlow.Models
{
    public class MapCenter
    {
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public double ZoomLevel { get; set; }

        public override bool Equals(object? obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            MapCenter other = (MapCenter)obj;
            return Latitude == other.Latitude &&
                   Longitude == other.Longitude &&
                   ZoomLevel == other.ZoomLevel;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Latitude, Longitude, ZoomLevel);
        }
    }
}
