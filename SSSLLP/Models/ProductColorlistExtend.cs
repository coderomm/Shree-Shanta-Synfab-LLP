using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.Models
{
    public partial class ProductColorlist
    {
        public Product_Tbl Product_Tbl { get; set; }
        public List<Color_Tbl> Color_Tbl { get; set; }
        public List<int> SelectedColorId { get; set; }
    }
}
