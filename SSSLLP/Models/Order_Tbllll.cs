using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public class Order_Tbllll
    {
        public int Id { get; set; }
        public int CustomerID { get; set; }
        public int ProductID { get; set; }
        public int ShippingID { get; set; }
        public int Quantity { get; set; }
        public Nullable<int> ColorOrder { get; set; }
        public string OrderColorName { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }

        public virtual Product_Tbl product { get; set; }
        public virtual Customers_Tbl user { get; set; }
        public string ProductName { get; set; }
    }
}