using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectMain.Models
{
    public class Scrapyard
    {
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public String Owner { get; set; }
        [Required]
        [StringLength(50)]
        public String Location { get; set; }

    }
}