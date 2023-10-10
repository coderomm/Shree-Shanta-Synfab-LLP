using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
namespace SSSLLP.Controllers
{
    public class SuitingController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        // GET: Weaving
        public ActionResult Index()
        {
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.pcount = db.Product_Tbl.Count();

            var products = db.Product_Tbl.ToList();
            var productColorLists = db.ProductColorlists.ToList();
            // Prepare a dictionary to store color options for each product
            var colorOptionsDict = new Dictionary<int, List<ProductColorlist>>();

            // Iterate over the products and group the color options by product ID
            foreach (var product in products)
            {
                var colorOptions = productColorLists.Where(x => x.pid == product.Id).ToList();
                colorOptionsDict.Add(product.Id, colorOptions);
            }
            ViewBag.AllProducts = products;
            ViewBag.ColorOptionsDict = colorOptionsDict;
            return View();
        }
        public ActionResult Pattern(string id)
        {
            ViewBag.SingleProduct = db.Product_Tbl.Where(x => x.pname == id).ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.pcount = db.Product_Tbl.Count();

            var productitem = db.Product_Tbl.Single(x => x.pname == id);
            ViewBag.pclist = db.ProductColorlists.Where(x => x.pid == productitem.Id).ToList();
            var query = from pc in db.ProductColorlists
                        join c in db.Color_Tbl on pc.cid equals c.Id
                        select c.ColorName;

            ViewBag.procolors = query.ToList();

            var products = db.Product_Tbl.ToList();
            var productColorLists = db.ProductColorlists.ToList();
            // Prepare a dictionary to store color options for each product
            var colorOptionsDict = new Dictionary<int, List<ProductColorlist>>();

            // Iterate over the products and group the color options by product ID
            foreach (var product in products)
            {
                var colorOptions = productColorLists.Where(x => x.pid == product.Id).ToList();
                colorOptionsDict.Add(product.Id, colorOptions);
            }
            ViewBag.AllProducts = products;
            ViewBag.ColorOptionsDict = colorOptionsDict;
            return View(productitem);
        }
        [HttpPost]
        public ActionResult Pattern(Product_Tbl product)
        {
            if (Session["username"] != null)
            {
                // Check if the product is already in the cart

                foreach (var cid in product.SelectedColors)
                {
                    bool isProductInCart = db.MyCart_Tbl.Any(cartItem =>
    cartItem.CustomerID == TempShpData.UserID &&
    cartItem.ProductID == product.Id &&
    cartItem.ColorId == cid
);
                    if (isProductInCart)
                    {
                        ViewBag.alreadyAdded = "<script>alert('Product Already Added In Cart !')</script>";
                    }
                    if (!isProductInCart)
                    {
                        var cart = new MyCart_Tbl
                        {
                            CustomerID = TempShpData.UserID,
                            ProductID = product.Id,
                            Quantity = 1,
                            ColorId = cid,
                            ColorName = db.Color_Tbl.Find(cid).ColorName,
                            Product = db.Product_Tbl.Find(product.Id)
                        };

                        db.MyCart_Tbl.Add(cart);
                        db.SaveChanges();

                        if (TempShpData.items == null)
                        {
                            TempShpData.items = new List<MyCart_Tbl>();
                        }
                        TempShpData.items.Add(cart);
                    }
                }

                return RedirectToAction("Index", "MyCart");
            }

            return RedirectToAction("Login", "Account");
        }

    }
}