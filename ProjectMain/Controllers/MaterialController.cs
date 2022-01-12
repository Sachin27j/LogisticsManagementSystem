using ProjectMain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace ProjectMain.Controllers
{
    public class MaterialController : Controller
    {
        private ApplicationDbContext _context;
        // GET: Customer
        public MaterialController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        // GET: Material
        public ActionResult Index()
        {
            var materials = _context.Materials.ToList();
            return View(materials);
        }
        public ActionResult Save(Material material)
        {
            if (!ModelState.IsValid)
            {
                var mat = new Material();
                return View("MaterialForm", material);
            }
            else
            if (material.Id == 0)
                _context.Materials.Add(material);
            else
            {
                var materialInDb = _context.Materials.Single(c => c.Id == material.Id);
                materialInDb.Name = material.Name;
                material.Value = material.Value;
            }
            _context.SaveChanges();
            return RedirectToAction("Index", "Material");
        }

        public ActionResult New()
        {
            var material = new Material();
            return View("MaterialForm", material);
        }
       
    }
}