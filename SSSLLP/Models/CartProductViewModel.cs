using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public class CartProductViewModel
    {
        public MyCart_Tbl CartItem { get; set; }
        public Product_Tbl Product { get; set; }
    }
}