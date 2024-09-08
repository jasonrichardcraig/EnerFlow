using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Role
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public bool ManageAccounts { get; set; }

    public bool ManageTags { get; set; }

    public bool ManageAlarms { get; set; }

    public bool ManageHistoricalData { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
