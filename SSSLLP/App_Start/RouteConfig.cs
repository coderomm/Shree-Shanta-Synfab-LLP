using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SSSLLP
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
              name: "WeavingPattern",
              url: "OurBusinesses/Suiting/Pattern/{productName}",
              defaults: new { controller = "OurBusinesses", action = "Pattern" }
          );
            routes.MapRoute(
              name: "TeamMember",
              url: "Admin/EditManagementTeam/{id}",
              defaults: new { controller = "Admin", action = "EditManagementTeam" }
          );

        }
    }
}
