//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SSSLLP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PageVisit
    {
        public int Id { get; set; }
        public string PageUrl { get; set; }
        public string IpAddress { get; set; }
        public Nullable<System.DateTime> VisitDateTime { get; set; }
        public string VisitorId { get; set; }
    }
}