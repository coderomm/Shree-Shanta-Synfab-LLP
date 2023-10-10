using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public partial class Customers_Tbl
    {
        public virtual List<Order_Tbl> ot { get; set; }
        public virtual List<Product_Tbl> pt { get; set; }
    }
}