using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.DBModels;
using System.Net;
using System.Data.Entity;

namespace OnlineShop.Controllers
{

    public class SupplierController : Controller
    {
        DbModels db = new DbModels();
        // GET: Supplier
        public ActionResult Index()
        {
            var suppliers = db.Suppliers.ToList();
            return View(suppliers);
        }

        // GET: Supplier/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Supplier/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Supplier/Create
        [HttpPost]
        public JsonResult CreateSup([Bind(Include = "Sid, SupplierName")] Supplier suppliers)
        {
            if (ModelState.IsValid)
            {
                db.Suppliers.Add(suppliers);
                db.SaveChanges();
                return Json(new { Result = true });
            }
            return Json(new { Result = false });
        }

        // GET: Supplier/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplier suppliers = db.Suppliers.Find(id);
            if (suppliers == null)
            {
                return HttpNotFound();
            }
            return View(suppliers);
        }

        // POST: Supplier/Edit/5
        [HttpPost]
        public JsonResult EditSup([Bind(Include = "Sid, SupplierName")] Supplier suppliers)
        {
            if (ModelState.IsValid)
            {
                db.Entry(suppliers).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new { Result = true });
            }

            return Json(new { Result = false });
        }

        // GET: Supplier/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplier suppliers = db.Suppliers.Find(id);
            if (suppliers == null)
            {
                return HttpNotFound();
            }
            return View(suppliers);
        }

        // POST: Supplier/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Supplier suppliers = db.Suppliers.Find(id);
            suppliers.Products.Clear();
            db.Suppliers.Remove(suppliers);
            db.SaveChanges();
            return RedirectToAction("Index", "Supplier");
        }
    }
}
