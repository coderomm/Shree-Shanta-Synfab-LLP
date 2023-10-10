using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class AboutController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        public ActionResult Index()
        {
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.ceo = db.Teams.Where(x => x.Id == 1).SingleOrDefault().image;
            var CompanyDetails = db.Company_Details_Tbl.SingleOrDefault();

            var Teams = db.Teams.ToList();

            ViewBag.team = db.Teams.ToList();
            ViewBag.ActivePage = "About";
            return View(CompanyDetails);
        }
    }
}