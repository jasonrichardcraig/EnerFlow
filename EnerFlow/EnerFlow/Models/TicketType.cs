using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketType
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
