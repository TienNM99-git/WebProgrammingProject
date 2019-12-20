using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineShop.DBModels;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace OnlineShop.DBModels
{
    public class UserViewModel
    {
        public int Cid { get; set; }


        public string FullName { get; set; }



        [Required(ErrorMessage = "User name is required")]
        [RegularExpression("^[A-z]+[A-z0-9]+$", ErrorMessage = "User name has to begin with a letter and no space or special character")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }


        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        public int Role { get; set; }

        public int Phone { get; set; }

        public string Address { get; set; }

        public void UpdateCustomer(Customer customer)
        {
            customer.Name = FullName;
            customer.Username = Username;
            customer.Password = Password;
            customer.Phone = Phone;
            customer.Address = Address;
            customer.Role = Role;
        }


    }
}