using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.DBModels;
using System.Net;
using System.Data.Entity;
using System.IO;

namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        private DbModels db = new DbModels();
        // GET: Product
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            return View(products.ToList());
        }

        // GET: Product/Details/5
        [Route("Product/ProductDetail-{id}")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product prod = db.Products.Find(id);
            if (prod == null)
            {
                return HttpNotFound();
            }
            return View(prod);
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers, "Sid", "SupplierName");

            ViewBag.Categories =
                new SelectList(
                    db.Categories.Select(c => new { Text = c.CategoryName, Value = c.CategoryID }).ToList()
                    , "Value"
                    , "Text");
            ProductViewModel productViewModel = new ProductViewModel();
            return View(productViewModel);
        }

        // POST: Product/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProductViewModel productViewModel, HttpPostedFileBase ImageFile)
        {
            if (ModelState.IsValid)
            {
                var newProducts = new Product();

                //crate relatvie path
                string relativePath = "/ProductImages/" + DateTime.Now.Ticks.ToString() + "_" + ImageFile.FileName;
                // map the relative to physical path
                string physicalPath = Server.MapPath(relativePath);

                // check if the image folder exists
                string imageFolder = Path.GetDirectoryName(physicalPath);
                if (!Directory.Exists(imageFolder))
                {
                    Directory.CreateDirectory(imageFolder);
                }

                // save the image to physical path
                ImageFile.SaveAs(physicalPath);

                productViewModel.ImageURL = relativePath;

                productViewModel.UpdateProducts(newProducts);


                if (productViewModel.CategoryID != null)
                {
                    foreach (var cID in productViewModel.CategoryID)
                    {
                        var category = db.Categories.Find(cID);
                        if (category != null)
                        {
                            newProducts.Categories.Add(category);
                        }
                    }
                }

                db.Products.Add(newProducts);
                db.SaveChanges();
                return RedirectToAction("Index");

            }

            return View();
        }

        // GET: Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            ViewBag.Categories =
                new SelectList(
                    db.Categories.Select(c => new { Text = c.CategoryName, Value = c.CategoryID }).ToList()
                    , "Value"
                    , "Text");

            ProductViewModel productViewModel = new ProductViewModel(product);

            ViewBag.SupplierID = new SelectList(db.Suppliers, "Sid", "SupplierName", productViewModel.SupplierID);

            return View(productViewModel);
        }

        // POST: Product/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProductViewModel productViewModel, HttpPostedFileBase ImageFile)
        {
            if (ModelState.IsValid)
            {
                var newProducts = db.Products.Find(productViewModel.Pid);
                if (newProducts == null)
                {
                    return HttpNotFound();
                }

                if (ImageFile != null)
                {

                    string relativePath = "/NewsImages/" + DateTime.Now.Ticks.ToString() + "_" + ImageFile.FileName;

                    string physicalPath = Server.MapPath(relativePath);


                    string imageFolder = Path.GetDirectoryName(physicalPath);
                    if (!Directory.Exists(imageFolder))
                    {
                        Directory.CreateDirectory(imageFolder);

                    }

                    ImageFile.SaveAs(physicalPath);
                    productViewModel.ImageURL = relativePath;


                }

                productViewModel.UpdateProducts(newProducts);

                newProducts.Categories.Clear();

                if (productViewModel.CategoryID != null)
                {
                    foreach (var cID in productViewModel.CategoryID)
                    {
                        var category = db.Categories.Find(cID);
                        if (category != null)
                        {
                            newProducts.Categories.Add(category);
                        }
                    }
                }

                db.Entry(newProducts).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productViewModel);
        }

        // GET: Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            product.Categories.Clear();
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}

