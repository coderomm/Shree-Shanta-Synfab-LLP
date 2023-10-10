using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class MissionAndVisionController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        // GET: MissionAndVision
        public ActionResult Index()
        {
            ViewBag.AllProducts = db.Product_Tbl.ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.ActivePage = "MissionAndVision";

            return View();
        }
    }
}