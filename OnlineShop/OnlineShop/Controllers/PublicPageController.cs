using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineShop.DBModels;

namespace OnlineShop.Controllers
{
    public class PublicPageController : Controller
    {
        DbModels db = new DbModels();
        // GET: PublicPage
        [Route("")]
        [Route("categories/{categoryid}/{name}")]
        public ActionResult Index(int? categoryid, string name)
        {
            var products = db.Products.Where(n => categoryid != null ? n.Categories.Any(c => c.CategoryID == categoryid) : true).Take(20);


            return View(products.ToList());
        }
    }
}