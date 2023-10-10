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
    public class ContactController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();
        public ActionResult Index()
        {
            ViewBag.AllProducts = db.Product_Tbl.ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.ActivePage = "Contact";

            return View();
        }

        [HttpPost]
        public ActionResult Index(Contact_Enqtbl enqry)
        {
            //Read SMTP section from Web.Config.
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

            using (MailMessage mm = new MailMessage(smtpSection.From, "omopyt2020@gmail.com"))
            {
                mm.Subject ="Enquiry To Shree Shanta Synfab LLP";
                mm.Body = 
                    "Customer Name : " + enqry.uname + "<br />" +
                    "Customer Email : " + enqry.uemail + "<br />" +
                    "Customer Mobile Number : " + enqry.umob + "<br />" +
                    "Customer Enquiry Subject : " + enqry.usub + "<br />" +
                    "Customer Enquiry Message : " + enqry.umsg ;
                mm.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient())
                {
                    smtp.Host = smtpSection.Network.Host;
                    smtp.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkCred;
                    smtp.Port = smtpSection.Network.Port;
                    smtp.Send(mm);
                }
            }
            enqry.rts = DateTime.Now.ToString();
            db.Contact_Enqtbl.Add(enqry);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Enquiry()
        {
            ViewBag.AllProducts = db.Product_Tbl.ToList();
            ViewBag.Review = db.Review_Tbl.ToList();
            ViewBag.footer_listings = db.Product_Tbl.ToList().Take(4);
            ViewBag.CompanyDetails = db.Company_Details_Tbl.ToList();
            ViewBag.ActivePage = "Enquiry";

            return View();
        }

        [HttpPost]
        public ActionResult CallEnquiry(FormCollection CallEnquiry,CallEnquiry call)
        {
            //Read SMTP section from Web.Config.
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

            using (MailMessage mm = new MailMessage(smtpSection.From, "omopyt2020@gmail.com"))
            {
                mm.Subject = "Enquiry To Shree Shanta Synfab LLP";
                mm.Body =
                    "Customer Name : " + CallEnquiry["cname"] + "<br />" +
                    "Customer Mobile Number : " + CallEnquiry["cmobile"] + "<br />" +
                    "Customer Desired Pattern : " + CallEnquiry["cpattern"] + "<br />" +
                    "Customer Desired Specifications : " + CallEnquiry["cspecification"] + "<br />" +
                    "Customer Desired Quantity : " + CallEnquiry["cqty"] + "<br />" +
                    "Customer Venture Name : " + CallEnquiry["cventure"];
                mm.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient())
                {
                    smtp.Host = smtpSection.Network.Host;
                    smtp.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkCred;
                    smtp.Port = smtpSection.Network.Port;
                    smtp.Send(mm);
                }
            }
            call.cspec = CallEnquiry["cspecification"].ToString();
            call.rts = DateTime.Now;
            db.CallEnquiries.Add(call);
            db.SaveChanges();
            return RedirectToAction("Index","Home");
        }


    }
}











