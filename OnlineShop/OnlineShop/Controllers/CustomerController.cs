using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using OnlineShop.DBModels;

namespace OnlineShop.Controllers
{
    public class CustomerController : Controller
    {
        public static string EncMD5(string password)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            UTF8Encoding encoder = new UTF8Encoding();
            Byte[] originalBytes = encoder.GetBytes(password);
            Byte[] encodedBytes = md5.ComputeHash(originalBytes);
            password = BitConverter.ToString(encodedBytes).Replace("-", "");
            var result = password.ToLower();
            return result;
        }

        private DbModels db = new DbModels();
        // GET: Customer
        public ActionResult Index()
        {
            var customers = db.Customers.ToList();
            return View(customers.ToList());
        }

        // GET: Customer/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Customer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customer/Create
        [HttpPost]
        public JsonResult CreateUser([Bind(Include = "Cid, Name, Username, Password, Phone, Address, Role")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.Password = EncMD5(customer.Password);
                db.Customers.Add(customer);
                db.SaveChanges();
                return Json(new { Result = true });
            }

            return Json(new { Result = false });
        }

        // GET: Customer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customer/Edit/5
        [HttpPost]
        public JsonResult EditUser([Bind(Include = "Cid, Name, Username, Password, Phone, Address, Role")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.Password = EncMD5(customer.Password);

                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new { Result = true });
            }

            return Json(new { Result = false });
        }

        // GET: Customer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            customer.Orders.Clear();
            db.Customers.Remove(customer);

            db.SaveChanges();
            return RedirectToAction("Index");
        }


    }
}
