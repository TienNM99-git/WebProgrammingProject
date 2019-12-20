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
    public class LoginController : Controller
    {
        private DbModels db = new DbModels();

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



        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public JsonResult LoginUser(UserViewModel userViewModel)
        {
            string pwd = EncMD5(userViewModel.Password.Trim());


            Customer customer = db.Customers.SingleOrDefault(x => x.Username == userViewModel.Username && x.Password == pwd);

            if (customer != null && customer.Role == 0)
            {
                Session["UserID"] = customer.Cid;
                return Json(new { Result = true });
            }
            if (customer != null && customer.Role == 1)
            {
                Session["AdminID"] = customer.Cid;
                return Json(new { Result = true });
            }
            return Json(new { Result = false });

        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");

        }


    }
}