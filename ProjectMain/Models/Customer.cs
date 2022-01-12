using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ProjectMain.Models
{
    public class Customer
    {
        [Required]
        public int Id { get; set; }
        [StringLength(50)]
        [Required]
        [Display(Name = "Your Full Name ")]
        public String Name { get; set; }
        [Required]
        [Display(Name = "Mobile Number")]
        public long Phone_No { get; set; }
        [Required]
        [Display(Name="Enter Password")]
        public String Password { get; set; }
    }
}