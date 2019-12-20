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
    public class CategoryController : Controller
    {
        private DbModels db = new DbModels();
        // GET: Category
        public ActionResult Index()
        {
            var category = db.Categories.ToList();
            return View(category.ToList());
        }

        // GET: Category/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Category/Create
        public ActionResult Create()
        {

            return View();
        }

        // POST: Category/Create
        [HttpPost]
        public JsonResult CreateCategory([Bind(Include = "CategoryID, CategoryName")] Category category)
        {

            if (ModelState.IsValid)
            {
                db.Categories.Add(category);
                db.SaveChanges();
                return Json(new { Result = true });
            }
            return Json(new { Result = false });
        }

        // GET: Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Category/Edit/5
        [HttpPost]
        public JsonResult EditCate([Bind(Include = "CategoryID, CategoryName")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new { Result = true });
            }
            return Json(new { Result = false });
        }

        // GET: Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Category/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Category category = db.Categories.Find(id);
            category.Products.Clear();
            db.Categories.Remove(category);

            db.SaveChanges();
            return RedirectToAction("Index", "Category");

        }
    }
}
