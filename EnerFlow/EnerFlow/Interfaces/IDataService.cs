using EnerFlow.Data;

namespace EnerFlow.Interfaces
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }
    }
}
