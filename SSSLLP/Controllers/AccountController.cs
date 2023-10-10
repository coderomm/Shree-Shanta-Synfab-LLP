using OfficeOpenXml;
using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class AccountController : BaseController
    {
        SSSLLPEntities db = new SSSLLPEntities();

        public ActionResult Index()
        {
            if (TempShpData.UserID < 1 || Session["username"] == null)
            {
                return RedirectToAction("Login");
            }

            this.GetDefaultData();
            var user = db.Customers_Tbl.Find(TempShpData.UserID);
            var orders = db.Order_Tbl.Where(o => o.CustomerID == TempShpData.UserID);
            ViewBag.orders = orders;

            return View(user);
        }

        [HttpPost]
        public ActionResult Index(Customers_Tbl cust, FormCollection custdata)
        {
            if (ModelState.IsValid)
            {
                if (db.Customers_Tbl.Any(x => x.Email == cust.Email))
                {
                    ViewBag.MailAlreadyExists = "User with this email is already registered ! Use another email to register.";
                    return View();
                }
                else
                {
                    cust.Password = custdata["newpwd"];
                    cust.rts = DateTime.Now;
                    db.Entry(cust).State = EntityState.Modified;
                    db.SaveChanges();
                    Session["username"] = cust.UserName;
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult Register(Customers_Tbl cust)
        {
            if (ModelState.IsValid)
            {
                if (db.Customers_Tbl.Any(x => x.Email == cust.Email))
                {
                    return Json(new { success = false });
                }
                else
                {
                    ViewBag.MailAlreadyExists = "";
                    db.Customers_Tbl.Add(cust);
                    cust.rts = DateTime.Now;
                    db.SaveChanges();
                    Session["username"] = cust.UserName;
                    TempShpData.UserID = GetUser(cust.UserName).Id;
                    return Json(new { success = true });
                }
            }
            return View();
        }

        public ActionResult Login()
        {
            string referringUrl = Request.UrlReferrer?.ToString();
            Session["ReferringUrl"] = referringUrl;

            return View();
        }

        [HttpPost]
        public ActionResult Login(Customers_Tbl login)
        {
            if (ModelState.IsValid)
            {
                var loginInfo = db.Customers_Tbl.FirstOrDefault(m => m.UserName == login.UserName && m.Password == login.Password);

                if (loginInfo != null)
                {
                    Session["username"] = loginInfo.UserName;
                    Session["userid"] = loginInfo.Id;
                    TempShpData.UserID = loginInfo.Id;

                    var crMod = db.ClientReportingPartyAccountTbls.FirstOrDefault(m => m.PrimaryCustId == loginInfo.Id);
                    Session["VerificationName"] = crMod?.VerificationName;

                    string referringUrl = Session["ReferringUrl"]?.ToString();
                    return Json(new { success = true, redirectUrl = referringUrl });
                }
            }

            return Json(new { success = false });
        }

        public Customers_Tbl GetUser(string _usrName)
        {
            var cust = (from c in db.Customers_Tbl
                        where c.UserName == _usrName
                        select c).FirstOrDefault();
            return cust;
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(string email)
        {
            var isEmail1AlreadyExists = db.Customers_Tbl.Any(x => x.Email == email);

            if (!isEmail1AlreadyExists)
            {
                return Json(new { success = false });
            }
            else
            {
                Session["forgotpwdEmail"] = email;
                string otp = GenerateOtp();
                SendOtpEmail(email, otp);
                HttpContext.Cache.Insert(email, otp, null, DateTime.Now.AddMinutes(2), TimeSpan.Zero);
            }
            return Json(new { success = true });
        }

        public ActionResult ResetPassword()
        {
            string email = "";
            if (Session["forgotpwdEmail"] != null)
            {
                email = Session["forgotpwdEmail"].ToString();
            }
            else
            {
                return RedirectToAction("Login");
            }
            ViewBag.forgotpwdEmail = email;
            var model = new ResetPasswordViewModel
            {
                Email = email
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordViewModel model)
        {
            string cachedOtp = HttpContext.Cache[model.Email] as string;
            if (string.IsNullOrEmpty(cachedOtp) || cachedOtp == model.Otp)
            {
                Customers_Tbl cust = db.Customers_Tbl.Where(x => x.Email == model.Email).SingleOrDefault();
                cust.Password = model.NewPassword;
                db.SaveChanges();
                HttpContext.Cache.Remove(model.Email);
                Session["forgotpwdEmail"] = "";
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        [HttpGet]
        public ActionResult PasswordResetSuccessful()
        {
            return View();
        }

        [HttpGet]
        public ActionResult InvalidOtp()
        {
            return View();
        }

        private string GenerateOtp()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        private void SendOtpEmail(string email, string otp)
        {
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage mm = new MailMessage(smtpSection.From, "omopyt2020@gmail.com"))
            {
                mm.Subject = "Password Reset OTP For shreeshantasynfabllp.com: ";
                mm.Body =
                    $"Your OTP for password reset: {otp}";
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
        }

        public ActionResult Logout()
        {
            Session["username"] = null;
            Session["VerificationName"] = null;
            TempShpData.UserID = 0;
            TempShpData.items = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ClientReport()
        {
            if (Session["VerificationName"] != null)
            {
                string verificationName = Session["VerificationName"].ToString(); // Retrieve the value here
                var report = db.ClientReportingTbls.Where(x => x.OwnParty == verificationName).ToList();
                return View(report);
            }
            return RedirectToAction("Login");
        }

        public ActionResult Export()
        {
            // Retrieve VerificationName from session
            string verificationName = Session["VerificationName"] as string;

            if (string.IsNullOrWhiteSpace(verificationName))
            {
                // Handle the case when VerificationName is not available in the session
                ViewBag.ErrorMessage = "VerificationName not found in session.";
                return View("Index"); // Or redirect to another view
            }

            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("ClientReportingData");

                // Add custom headers
                worksheet.Cells["A1:N1"].Merge = true; // Merge cells for custom header
                worksheet.Cells["A1"].Value = "SHREE SHANTA SYNFAB LLP";
                worksheet.Cells["A2:N2"].Merge = true; // Merge cells for custom header
                worksheet.Cells["A2"].Value = "Loom Wise Position As on - " + DateTime.Now.ToString("dd-MMM-yyyy");

                // Set headers
                var headers = new List<string>
        {
            "Loom No", "Own Party", "Quality No", "ReedxPickxRs", "Beam No",
            "Beam Pipe No", "Date of Gaiting/Knotting", "B/fall Date", "Nos",
            "Avg. of Rolling Mtr", "Avg. of Pick", "Total Fabric Reced", "Beam Balance Mtr"
        };

                for (int col = 1; col <= headers.Count; col++)
                {
                    worksheet.Cells[3, col].Value = headers[col - 1];
                }

                // Fetch data from the database and filter based on VerificationName
                var data = db.ClientReportingTbls.Where(item => item.OwnParty == verificationName).ToList();

                // Populate data rows
                for (int row = 4; row <= data.Count + 3; row++)
                {
                    for (int col = 1; col <= headers.Count; col++)
                    {
                        switch (col)
                        {
                            case 1:
                                worksheet.Cells[row, col].Value = data[row - 4].LoomNo;
                                break;
                            case 2:
                                worksheet.Cells[row, col].Value = data[row - 4].OwnParty;
                                break;
                            case 3:
                                worksheet.Cells[row, col].Value = data[row - 4].QualityNo;
                                break;
                            case 4:
                                worksheet.Cells[row, col].Value = data[row - 4].ReedxPickxRs;
                                break;
                            case 5:
                                worksheet.Cells[row, col].Value = data[row - 4].BeamNo;
                                break;
                            case 6:
                                worksheet.Cells[row, col].Value = data[row - 4].BeamPipeNo;
                                break;
                            case 7:
                                worksheet.Cells[row, col].Value = data[row - 4].DateOfGaitingKnotting;
                                break;
                            case 8:
                                worksheet.Cells[row, col].Value = data[row - 4].BillFallDate;
                                break;
                            case 9:
                                worksheet.Cells[row, col].Value = data[row - 4].Nos;
                                break;
                            case 10:
                                worksheet.Cells[row, col].Value = data[row - 4].AvgOfRollingMtr;
                                break;
                            case 11:
                                worksheet.Cells[row, col].Value = data[row - 4].AvgOfPick;
                                break;
                            case 12:
                                worksheet.Cells[row, col].Value = data[row - 4].TotalFabricReced;
                                break;
                            case 13:
                                worksheet.Cells[row, col].Value = data[row - 4].BeamBalanceMtr;
                                break;
                                // ... Add more cases for additional columns
                        }
                    }
                }

                // Auto-fit columns for better visibility
                worksheet.Cells.AutoFitColumns();

                // Return the Excel file as a response
                var stream = new MemoryStream(package.GetAsByteArray());
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "ClientReport.xlsx");
            }
        }
    }
}