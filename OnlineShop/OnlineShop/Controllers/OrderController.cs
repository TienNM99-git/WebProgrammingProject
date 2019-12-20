using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.DBModels;
using OnlineShop.Models;

namespace OnlineShop.Controllers
{
    public class OrderController : Controller
    {
        DbModels db = new DbModels();
        // GET: Order
        public ActionResult Index()
        {
            List<Product> products = db.Products.ToList();
            List<Order> orders = db.Orders.ToList();
            List<Customer> customers = db.Customers.ToList();
            List<OrderDetail> orderDetails = db.OrderDetails.ToList();

            var orderTable = (from ord in orders
                              join cus in customers on ord.CustomerID equals cus.Cid
                              join ordDetail in orderDetails on ord.OrderId equals ordDetail.OrderID
                              join product in products on ordDetail.ProductID equals product.Pid
                              select new OrderViewModel
                              {
                                  orders = ord,
                                  customers = cus,
                                  orDetail = ordDetail,
                                  products = product
                              });


            return View(orderTable);
        }

        // GET: Order/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Order/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Order/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Order/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Order/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Order/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Order/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
