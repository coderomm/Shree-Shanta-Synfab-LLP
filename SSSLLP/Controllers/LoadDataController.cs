using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public static class LoadDataController
    {
        static SSSLLPEntities db = new SSSLLPEntities();

        // GET: LoadData
        public static List<MyCart_Tbl> GetDefaultData(this ControllerBase controller)
        {
            if (TempShpData.items == null)
            {
                TempShpData.items = new List<MyCart_Tbl>();
            }
            var data = TempShpData.items.ToList();

            controller.ViewBag.cartBox = data.Count == 0 ? null : data;
            controller.ViewBag.CartItemCount = db.MyCart_Tbl.Where(x => x.CustomerID == TempShpData.UserID).ToList().Count();
            controller.ViewBag.Review = db.Review_Tbl.ToList();
            controller.ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            controller.ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            return data;
        }

    }
}