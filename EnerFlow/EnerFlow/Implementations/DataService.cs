using EnerFlow.Data;
using EnerFlow.Interfaces;

namespace EnerFlow.Implementations
{
    public class DataService : IDataService
    {
        public required EnerFlowContext Context { get; set; }

    }
}
