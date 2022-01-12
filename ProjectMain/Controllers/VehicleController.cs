using ProjectMain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectMain.Controllers
{
    public class VehicleController : Controller
    {
        // GET: Vehicle
        private ApplicationDbContext _context;
        public VehicleController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        public ActionResult Index()
        {
            var vehicles = _context.Vehicles.ToList();
            return View(vehicles);
        }
        public ActionResult Save(Vehicle vehicle)
        {
            if (!ModelState.IsValid)
            {
                var vehic = new Vehicle();
                return View("VehicleForm", vehicle);
            }
            else
            if (vehicle.Id == 0)
                _context.Vehicles.Add(vehicle);
            else
            {
                var vehicleInDb = _context.Vehicles.Single(c => c.Id == vehicle.Id);
                vehicleInDb.Type = vehicle.Type;
                vehicle.Capacity = vehicle.Capacity;
            }
            _context.SaveChanges();
            return RedirectToAction("Index", "Vehicle");
        }
        public ActionResult New()
        {
            var vehicle = new Vehicle();
            return View("VehicleForm", vehicle);
        }
    }
}