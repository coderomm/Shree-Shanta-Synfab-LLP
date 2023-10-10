using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public class ClientReportPartyAccountViewModel
    {
        public virtual Customers_Tbl Customers { get; set; }
        public virtual ClientReportingPartyAccountTbl Clients { get; set; }

    }
}