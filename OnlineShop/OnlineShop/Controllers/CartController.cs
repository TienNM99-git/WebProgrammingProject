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
using OnlineShop.Models;

namespace OnlineShop.Controllers
{
    public class CartController : Controller
    {
        private DbModels db = new DbModels();

        private string strCart = "Cart";

        // GET: Cart
        public ActionResult Index()
        {

            return View();

        }

        public ActionResult AddItem(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Session[strCart] == null)
            {
                List<CartItem> lsCart = new List<CartItem>
                {
                    new CartItem(db.Products.Find(id),1)
                };
                Session[strCart] = lsCart;
            }
            else
            {
                List<CartItem> lsCart = (List<CartItem>)Session[strCart];
                int check = isExistingCheck(id);

                if (check == -1)
                {
                    lsCart.Add(new CartItem(db.Products.Find(id), 1));
                }
                else
                {
                    lsCart[check].Quantity++;
                }

                Session[strCart] = lsCart;
            }
            return View("Index");
        }

        private int isExistingCheck(int? id)
        {
            List<CartItem> lsCart = (List<CartItem>)Session[strCart];
            for (int i = 0; i < lsCart.Count; i++)
            {
                if (lsCart[i].Product.Pid == id)
                {
                    return i;
                }
            }
            return -1;
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int check = isExistingCheck(id);
            List<CartItem> lsCart = (List<CartItem>)Session[strCart];
            lsCart.RemoveAt(check);
            return View("Index");
        }

        public ActionResult UpdateCart(FormCollection frc)
        {
            string[] quantities = frc.GetValues("quantity");
            List<CartItem> lsCart = (List<CartItem>)Session[strCart];
            for (int i = 0; i < lsCart.Count; i++)
            {
                lsCart[i].Quantity = Convert.ToInt32(quantities[i]);
            }

            Session[strCart] = lsCart;
            return View("Index");
        }

        public ActionResult CheckOut(FormCollection frc)
        {

            return View("CheckOut");
        }

        public ActionResult ProcessOrder(FormCollection frc)
        {
            int ID = 0;
            List<CartItem> lsCart = (List<CartItem>)Session[strCart];
            if (Session["AdminID"] != null)
            {
                ID = (int)Session["AdminID"];
            }
            else
            {
                ID = (int)Session["UserID"];
            }
            //1. Save the order into Order table
            Order order = new Order()
            {
                OrderDate = DateTime.Now,
                CustomerID = ID,
                PaymentType = "Cash",
                Status = "Processing"

            };
            db.Orders.Add(order);
            db.SaveChanges();

            //2. Save the order detail into dbo.OrderDetail
            foreach (CartItem cart in lsCart)
            {
                OrderDetail orderDetail = new OrderDetail()
                {
                    OrderID = order.OrderId,
                    ProductID = cart.Product.Pid,
                    Quantity = cart.Quantity,
                    Price = cart.Product.Price * cart.Quantity
                };

                Product product = new Product();
                product = db.Products.Find(cart.Product.Pid);
                product.Quantitty = product.Quantitty - cart.Quantity;

                db.Entry(product).State = EntityState.Modified;
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
            }



            //3. Remove shopping cart session
            Session.Remove(strCart);

            return View("OrderSuccess");
        }

    }
}