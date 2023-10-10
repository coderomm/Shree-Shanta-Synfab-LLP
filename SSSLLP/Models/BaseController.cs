using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSSLLP.Models;

namespace SSSLLP.Models
{
    public class BaseController : Controller
    {
        SSSLLPEntities db = new SSSLLPEntities();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ViewBag.CartItemCount = db.MyCart_Tbl.Where(x => x.CustomerID == TempShpData.UserID).ToList().Count();
            ViewBag.AllProducts = db.Product_Tbl.OrderBy(x => Guid.NewGuid()).ToList();
            ViewBag.Review = db.Review_Tbl.OrderBy(x => Guid.NewGuid()).ToList();
            ViewBag.footer_listings = db.Product_Tbl.OrderBy(x => Guid.NewGuid()).Take(4).ToList();
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();

            base.OnActionExecuting(filterContext);
        }

        public ActionResult VerificationNameAction()
        {
            

            // ... other code
            return View();
        }

        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            // Perform any post-action operations here if needed

            base.OnActionExecuted(filterContext);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose(); // Dispose the database context
            }

            base.Dispose(disposing);
        }

    }
}
