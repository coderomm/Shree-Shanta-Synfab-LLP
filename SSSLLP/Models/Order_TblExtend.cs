using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public partial class Order_Tbl
    {
        public virtual Product_Tbl product { get; set; }
        public virtual Customers_Tbl user { get; set; }
        public string ProductName { get; set; }
    }
}