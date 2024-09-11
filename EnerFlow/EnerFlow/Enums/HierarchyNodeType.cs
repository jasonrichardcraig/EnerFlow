using NetTopologySuite.Index.Bintree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnerFlow.Enums
{
    public enum HierarchyNodeType : byte
    {

        Root = 1,
        Company = 2,
        District = 3,
        Area = 4,
        Field = 5,
    }
}
