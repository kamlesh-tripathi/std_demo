//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RepoDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Service
    {
        public int ServiceId { get; set; }
        public int StudentId { get; set; }
        public string SchoolYear { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
    
        public virtual Student Student { get; set; }
    }
}
