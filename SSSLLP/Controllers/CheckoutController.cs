using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class CheckoutController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();
        public ActionResult Index()
        {
            ViewBag.AllProducts = db.Product_Tbl.ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();

            var data = this.GetDefaultData();

            return View(data);
        }

        public class getCheckoutDetailsmodel
        {
            public int Id { get; set; }
            public int CustomerID { get; set; }
            public int ProductID { get; set; }
            public int Quantity { get; set; }
            public Nullable<int> ColorOrder { get; set; }
            public Nullable<System.DateTime> OrderDate { get; set; }
            public int ShippingID { get; set; }
            public Nullable<int> OrderID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Email { get; set; }
            public string Mobile { get; set; }
            public string Address { get; set; }
            public string State { get; set; }
            public string City { get; set; }
            public string PostCode { get; set; }
            public string OrderNote { get; set; }
        }

        public ActionResult PlaceOrder(FormCollection getCheckoutDetails)
        {
            int orderID = 1;
            if (db.Order_Tbl.Count() > 0)
            {
                orderID = db.Order_Tbl.Max(x => x.Id) + 1;
            }

            int shpID = 1;
            if (db.ShippingDetails.Count() > 0)
            {
                shpID = db.ShippingDetails.Max(x => x.ShippingID) + 1;
            }

            int itemCount = getCheckoutDetails.AllKeys.Count(key => key.StartsWith("ProductId_")); // Number of items in the checkout

            for (int i = 0; i < itemCount; i++)
            {
                Order_Tbl o = new Order_Tbl();

                int pID = Convert.ToInt32(getCheckoutDetails["ProductId_" + i]);
                int qty = Convert.ToInt32(getCheckoutDetails["Quantity_" + i]);
                int colorid = Convert.ToInt32(getCheckoutDetails["ColorId_" + i]);
                var OrderColorName = db.Color_Tbl.FirstOrDefault(x => x.Id == colorid)?.ColorName;
                o.Id = orderID;
                o.CustomerID = TempShpData.UserID;
                o.ProductID = pID;
                o.ShippingID = shpID;
                o.Quantity = qty;
                o.ColorOrder = colorid;
                o.OrderColorName = OrderColorName;
                o.OrderDate = DateTime.Now;
                db.Order_Tbl.Add(o);
                db.SaveChanges();

                var item = db.MyCart_Tbl.Find(pID);

                if (item != null)
                {
                    db.MyCart_Tbl.Remove(item);
                    db.SaveChanges();
                }

                ShippingDetail shpDetails = new ShippingDetail();
                shpDetails.ShippingID = shpID;
                shpDetails.OrderID = orderID;
                shpDetails.FirstName = getCheckoutDetails["FirstName"];
                shpDetails.LastName = getCheckoutDetails["LastName"];
                shpDetails.Email = getCheckoutDetails["Email"];
                shpDetails.Mobile = getCheckoutDetails["Mobile"];
                shpDetails.Address = getCheckoutDetails["Address"];
                shpDetails.State = getCheckoutDetails["State"];
                shpDetails.City = getCheckoutDetails["City"];
                shpDetails.PostCode = getCheckoutDetails["PostCode"];
                shpDetails.OrderNote = getCheckoutDetails["OrderNote"];
                db.ShippingDetails.Add(shpDetails);

                orderID++; // Increment order ID for the next item
                shpID++; // Increment shipping ID for the next item
            }

            TempShpData.items.RemoveAll(x => x.CustomerID == TempShpData.UserID);
            var cartItems = db.MyCart_Tbl.Where(x => x.CustomerID == TempShpData.UserID).ToList();
            foreach (var Removeitem in cartItems)
            {
                db.MyCart_Tbl.Remove(Removeitem);
            }
            db.SaveChanges();

            return RedirectToAction("Index", "OrderConfirm");
        }

    }
}