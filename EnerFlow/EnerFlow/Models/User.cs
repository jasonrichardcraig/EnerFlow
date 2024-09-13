using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class User
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public bool AccountDisabled { get; set; }

    public bool IsManager { get; set; }

    public bool IsSystemAdministrator { get; set; }

    public bool CanConfigure { get; set; }

    public virtual ICollection<Alarm> Alarms { get; set; } = new List<Alarm>();

    public virtual ICollection<MeterException> MeterExceptions { get; set; } = new List<MeterException>();

    public virtual ICollection<Hierarchy> Hierarchies { get; set; } = new List<Hierarchy>();

    public virtual ICollection<Role> Roles { get; set; } = new List<Role>();
}
