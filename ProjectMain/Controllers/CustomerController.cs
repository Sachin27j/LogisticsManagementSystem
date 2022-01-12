using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity.EntityFramework;
using ProjectMain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectMain.Controllers
{
    public class CustomerController : Controller
    {
        private ApplicationDbContext _context;
        // GET: Customer
        public CustomerController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        public ViewResult Index()
            {
            var customers = _context.Customers.ToList();
                return View(customers);
            }
        public ActionResult New()
        {
            var customer = new Customer();
            return View("CustomerForm", customer);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Save(Customer customer)
        {
            if (!ModelState.IsValid)
            {
                var cust = new Customer();
                return View("CustomerForm", customer);
            }
            else
            if (customer.Id == 0)
            {
                var pass = customer.Password;
                int a = pass.GetHashCode();
                String p = a.ToString();
                customer.Password = p;
                _context.Customers.Add(customer);
            }
            else
            {
                var customerInDb = _context.Customers.Single(c => c.Id == customer.Id);
                customerInDb.Name = customer.Name;
                customerInDb.Phone_No = customer.Phone_No;
            }
            _context.SaveChanges();
            return RedirectToAction("Index", "Customer");
        }
    }
}