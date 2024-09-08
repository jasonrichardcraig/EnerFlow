using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketComponentBasis
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
