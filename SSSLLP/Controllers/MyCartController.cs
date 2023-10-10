using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class MyCartController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        // GET: MyCart
        public ActionResult Index()
        {
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();

            if (Session["username"] != null)
            {
                var query = from cart in db.MyCart_Tbl
                            join product in db.Product_Tbl on cart.ProductID equals product.Id
                            where cart.CustomerID == TempShpData.UserID
                            select new CartProductViewModel
                            {
                                CartItem = cart,
                                Product = product
                            };

                var cartProducts = query.ToList();

                return View(cartProducts);
            }

            return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        public ActionResult ProcedToCheckout(FormCollection formcoll)
        {
            if (TempShpData.items == null)
            {
                TempShpData.items = new List<MyCart_Tbl>(); // Assuming ODetails is the type stored in TempShpData.items
            }
            else
            {
                TempShpData.items.Clear();
            }

            for (int i = 0; i < formcoll.Count / 3; i++)
            {
                int pID = Convert.ToInt32(formcoll["CartProductId-" + i + ""]);
                int colorID = Convert.ToInt32(formcoll["CartProductColorId-" + i + ""]);
                var ODetails = db.MyCart_Tbl.FirstOrDefault(x => x.ProductID == pID && x.ColorId == colorID);

                int qty = Convert.ToInt32(formcoll["CartProductQty-" + i + ""]);
                ODetails.Quantity = qty;
                ODetails.Product = db.Product_Tbl.FirstOrDefault(x => x.Id == pID);

                TempShpData.items.Add(ODetails);
            }

            return RedirectToAction("Index", "CheckOut");
        }

        public ActionResult Remove(int id, int colorid)
        {
            if (db.MyCart_Tbl.FirstOrDefault(p => p.ProductID == id && p.ColorId == colorid) != null)
            {
                db.MyCart_Tbl.Remove(db.MyCart_Tbl.FirstOrDefault(p => p.ProductID == id && p.ColorId == colorid));
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}