﻿using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DeviceTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? ChannelId { get; set; }

    public bool IsEnabled { get; set; }

    public string IpendPoint { get; set; } = null!;

    public int InterPollDelay { get; set; }

    public int ReadTimeout { get; set; }

    public int Retries { get; set; }

    public int WaitToRetry { get; set; }

    public int DeviceTypeId { get; set; }

    public int DeviceAddress { get; set; }

    public int RocDeviceGroup { get; set; }

    public int RocSourceAddress { get; set; }

    public int RocSourceGroup { get; set; }

    public virtual ICollection<AnalogIoTag> AnalogIoTags { get; set; } = new List<AnalogIoTag>();

    public virtual SerialChannelTag? Channel { get; set; }

    public virtual TcpIpChannelTag? ChannelNavigation { get; set; }

    public virtual DeviceType DeviceType { get; set; } = null!;

    public virtual ICollection<DigitalIoTag> DigitalIoTags { get; set; } = new List<DigitalIoTag>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual MeterRunTag IdNavigation { get; set; } = null!;
}