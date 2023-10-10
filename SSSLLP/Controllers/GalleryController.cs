using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class GalleryController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        // GET: Gallery
        public ActionResult Index()
        {
            ViewBag.gallery = db.Gallery_Tbl.ToList();
            ViewBag.AllProducts = db.Product_Tbl.ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            var gallery = db.Gallery_Tbl.OrderBy(x => Guid.NewGuid()).ToList();
            ViewBag.ActivePage = "Gallery";

            return View(gallery);
        }
    }
}