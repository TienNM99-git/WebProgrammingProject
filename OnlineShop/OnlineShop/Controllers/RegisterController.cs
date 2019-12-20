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
    public class RegisterController : Controller
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
        // GET: Register
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public JsonResult Register(UserViewModel userViewModel)
        {
            if (ModelState.IsValid)
            {
                var newCustomer = new Customer();
                if (!string.IsNullOrEmpty(userViewModel.Username)
                    && !string.IsNullOrEmpty(userViewModel.Password) && !string.IsNullOrEmpty(userViewModel.Phone.ToString())
                    && !string.IsNullOrEmpty(userViewModel.FullName) && !string.IsNullOrEmpty(userViewModel.ConfirmPassword))
                {
                    string pwd = EncMD5(userViewModel.Password.Trim());
                    string cpwd = EncMD5(userViewModel.ConfirmPassword.Trim());
                    var data = db.Customers.Where(s => s.Username.Equals(userViewModel.Username.Trim())).ToList();
                    if (pwd != cpwd)
                    {
                        return Json(new { Result = false, Confirm = false });
                    }
                    else if (data.Count() > 0)
                    {
                        return Json(new { Result = false, Exist = true });
                    }
                    else
                    {
                        userViewModel.Password = pwd;
                        userViewModel.Role = 0;
                        userViewModel.UpdateCustomer(newCustomer);
                        db.Customers.Add(newCustomer);
                        db.SaveChanges();
                        ModelState.Clear();
                        return Json(new { Result = true });
                    }
                }
            }
            return Json(new { Result = false });
        }
    }
}