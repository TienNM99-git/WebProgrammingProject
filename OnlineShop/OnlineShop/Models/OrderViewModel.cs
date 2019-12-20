using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineShop.DBModels;

namespace OnlineShop.Models
{
    public class OrderViewModel
    {

        public Order orders { get; set; }

        public Customer customers { get; set; }

        public OrderDetail orDetail { get; set; }

        public Product products { get; set; }
    }

}