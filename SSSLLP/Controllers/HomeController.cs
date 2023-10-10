using SSSLLP.DataAccessLayer;
using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class HomeController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();
        private readonly PageVisitRepository _pageVisitRepository;

        public HomeController()
        {
            var dbContext = new SSSLLPEntities(); // Instantiate your database context
            _pageVisitRepository = new PageVisitRepository(dbContext);
        }
        public ActionResult Index()
        {
            // Get the visitor's IP address
            string ipAddress = Request.UserHostAddress;

            // Check if the visitor identifier cookie exists
            string visitorId;
            if (Request.Cookies["VisitorId"] != null)
            {
                visitorId = Request.Cookies["VisitorId"].Value;
            }
            else
            {
                // Generate a new visitor identifier
                visitorId = System.Guid.NewGuid().ToString();

                // Create a new cookie to store the visitor identifier
                HttpCookie cookie = new HttpCookie("VisitorId", visitorId);
                cookie.Expires = System.DateTime.Now.AddYears(1); // Set cookie expiration date to 1 year
                Response.Cookies.Add(cookie);
            }

            // Record the page visit with the visitor identifier
            _pageVisitRepository.AddPageVisit(new PageVisit
            {
                PageUrl = Request.Url.AbsoluteUri,
                IpAddress = ipAddress,
                VisitDateTime = System.DateTime.Now,
                VisitorId = visitorId
            });

            int totalVisitCount = _pageVisitRepository.GetTotalVisitCount();
            int uniqueVisitorCount = _pageVisitRepository.GetUniqueVisitorCount();

            ViewBag.TotalVisitCount = totalVisitCount;
            ViewBag.UniqueVisitorCount = uniqueVisitorCount;

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
            ViewBag.ActivePage = "Home";
            return View();
        }
    }

}