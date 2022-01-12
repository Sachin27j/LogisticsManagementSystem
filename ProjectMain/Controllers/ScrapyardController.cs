using ProjectMain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectMain.Controllers
{
    public class ScrapyardController : Controller
    {
        private ApplicationDbContext _context;
        public ScrapyardController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        public ActionResult Index()
        {
            var scrapyards = _context.Scrapyards.ToList();
            return View(scrapyards);
        }
        public ActionResult Save(Scrapyard scrapyard)
        {
            if (!ModelState.IsValid)
            {
                var scrap = new Scrapyard();
                return View("ScrapyardForm",scrapyard);
            }
            else
            if (scrapyard.Id == 0)
                _context.Scrapyards.Add(scrapyard);
            else
            {
                var scrapyardInDb = _context.Scrapyards.Single(c => c.Id == scrapyard.Id);
                scrapyardInDb.Owner = scrapyard.Owner;
                scrapyard.Location =scrapyard.Location;
            }
            _context.SaveChanges();
            return RedirectToAction("Index", "Scrapyard");
        }
        public ActionResult New()
        {
            var scrapyard = new Scrapyard();
            return View("ScrapyardForm", scrapyard);
        }

    }
}