namespace EnerFlow.Models
{
    public class MapMarker
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }

        public override bool Equals(object? obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            MapMarker other = (MapMarker)obj;
            return Id == other.Id &&
                   Name == other.Name &&
                   Description == other.Description &&
                   Latitude == other.Latitude &&
                   Longitude == other.Longitude;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Id, Name, Description, Latitude, Longitude);
        }
    }
}
