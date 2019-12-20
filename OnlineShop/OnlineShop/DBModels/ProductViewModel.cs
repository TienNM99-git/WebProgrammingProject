using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShop.DBModels
{
    public class ProductViewModel
    {
        public int Pid { get; set; }
        public string ProductName { get; set; }
        public double Price { get; set; }
        public string ImageURL { get; set; }
        public int Quantitty { get; set; }
        public int SupplierID { get; set; }


        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual Supplier Supplier { get; set; }

        public virtual ICollection<Category> Categories { get; set; }

        public List<int> CategoryID { get; set; }

        private Product _product;

        public ProductViewModel(Product product)
        {
            _product = product;
            Pid = product.Pid;
            ProductName = product.ProductName;
            ImageURL = product.ImageURL;
            Price = product.Price;
            Quantitty = product.Quantitty;
            SupplierID = (int)product.SupplierID;
            Categories = product.Categories;
            CategoryID = product.Categories.Select(c => c.CategoryID).ToList();
        }

        public void UpdateProducts(Product product)
        {

            product.Pid = Pid;
            product.ProductName = ProductName;
            product.Price = Price;
            product.Quantitty = Quantitty;
            product.ImageURL = ImageURL;
            product.SupplierID = SupplierID;

        }

        public ProductViewModel()
        {

        }
    }
}