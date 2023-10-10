using OfficeOpenXml;
using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSSLLP.Controllers
{
    public class AdminController : Controller
    {
        SSSLLPEntities db = new SSSLLPEntities();

        public ActionResult Index()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.TotalProductCount = db.Product_Tbl.Count();
            ViewBag.TotalCallEnquiresCount = db.CallEnquiries.Count();
            ViewBag.TotalSampleEnquiresCount = db.Order_Tbl.Count();
            ViewBag.TotalCustomersCount = db.Customers_Tbl.Count();
            return View();
        }

        public ActionResult ContactEnquiry()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.Enquiry = db.Contact_Enqtbl.ToList();
            return View();
        }

        public ActionResult CallEnquiry()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.Enquiry = db.CallEnquiries.ToList();
            return View();
        }

        public ActionResult ProductSampleOrderEnquires()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var ProductSampleOrderEnquires = db.Order_Tbl.ToList();
            return View(ProductSampleOrderEnquires);
        }

        public ActionResult ShippingDetails(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var ShippingDetails = db.ShippingDetails.Where(x => x.OrderID == id).SingleOrDefault();
            return View(ShippingDetails);
        }

        public ActionResult RegisteredUsers()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var RegisteredUsers = db.Customers_Tbl.ToList();
            return View(RegisteredUsers);
        }

        public ActionResult CompanyDetails()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            Company_Details_Tbl comp = db.Company_Details_Tbl.Single();

            return View("CompanyDetails", comp);
        }

        [HttpPost]
        public ActionResult CompanyDetails(Company_Details_Tbl model, HttpPostedFileBase cLogo, HttpPostedFileBase cSliderImage1, HttpPostedFileBase cSliderImage2, HttpPostedFileBase cSliderImage3)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                if (cLogo != null && cLogo.ContentLength > 0)
                {
                    model.cLogo = cLogo.FileName;
                    cLogo.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/Images/About/"), cLogo.FileName));
                }

                if (cSliderImage1 != null && cSliderImage1.ContentLength > 0)
                {
                    model.cSliderImage1 = cSliderImage1.FileName;
                    SliderImageResize(cSliderImage1.InputStream, cSliderImage1.FileName);
                }

                if (cSliderImage2 != null && cSliderImage2.ContentLength > 0)
                {
                    model.cSliderImage2 = cSliderImage2.FileName;
                    SliderImageResize(cSliderImage2.InputStream, cSliderImage2.FileName);
                }

                if (cSliderImage3 != null && cSliderImage3.ContentLength > 0)
                {
                    model.cSliderImage3 = cSliderImage3.FileName;
                    SliderImageResize(cSliderImage3.InputStream, cSliderImage3.FileName);
                }
            }
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("CompanyDetails", "Admin");
        }

        private void SliderImageResize(Stream stream, string fname)
        {
            System.Drawing.Image photo = new Bitmap(stream);

            Bitmap bmp1 = new Bitmap(photo, 1920, 682);
            ImageCodecInfo jgpEncoder = GetEncoder2(ImageFormat.Jpeg);
            System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 90L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            bmp1.Save(Server.MapPath("~/Content/assets/Images/About/" + fname), jgpEncoder, myEncoderParameters);
            bmp1.Dispose();
        }

        private ImageCodecInfo GetEncoder2(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        public ActionResult AddNewColor()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.Color_Tbl = db.Color_Tbl.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult AddNewColor(Color_Tbl model)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                db.Color_Tbl.Add(model);
                db.SaveChanges();
            }
            return RedirectToAction("AddNewColor");
        }

        public ActionResult AddProduct()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var colors = db.Color_Tbl.ToList();

            var pc = new ProductColorlist
            {
                Product_Tbl = new Product_Tbl(),
                Color_Tbl = colors,
                SelectedColorId = new List<int>()
            };

            ViewBag.AllProduct = db.Product_Tbl.ToList();
            ViewBag.Color_Tbl = db.Color_Tbl.ToList();

            return View(pc);
        }
        [HttpPost]
        public ActionResult AddProduct(ProductColorlist pc, Product_Tbl p, HttpPostedFileBase pimg1, HttpPostedFileBase pimg2, HttpPostedFileBase pimg3)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                if (pimg1 != null && pimg1.ContentLength > 0)
                {
                    p.pimg1 = pimg1.FileName;
                    VaryQualityLevel(pimg1.InputStream, pimg1.FileName);
                }

                if (pimg2 != null && pimg2.ContentLength > 0)
                {
                    p.pimg2 = pimg2.FileName;
                    VaryQualityLevel(pimg2.InputStream, pimg2.FileName);
                }

                if (pimg3 != null && pimg3.ContentLength > 0)
                {
                    p.pimg3 = pimg3.FileName;
                    VaryQualityLevel(pimg3.InputStream, pimg3.FileName);
                }

                int addProductId = 1;
                if (db.Product_Tbl.Count() > 0)
                {
                    addProductId = db.Product_Tbl.Max(x => x.Id) + 1;
                }

                int addProductColorId = 1;
                if (db.ProductColorlists.Count() > 0)
                {
                    addProductColorId = db.ProductColorlists.Max(x => x.id) + 1;
                }

                p.rts = DateTime.Now;
                p.Id = addProductId;
                p.status = true;
                db.Product_Tbl.Add(p);
                db.SaveChanges();

                // Save the selected colors to the database
                foreach (var CID in pc.SelectedColorId)
                {
                    var colorName = db.Color_Tbl.FirstOrDefault(x => x.Id == CID)?.ColorName;
                    if (colorName != null)
                    {
                        pc = new ProductColorlist
                        {
                            pid = p.Id,
                            cid = CID,
                            colorname = colorName
                        };
                    }
                    db.ProductColorlists.Add(pc);
                    db.SaveChanges();
                }
                db.SaveChanges();
            }
            return RedirectToAction("AddProduct", "Admin");
        }

        public ActionResult EditProduct(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var product = db.Product_Tbl.Single(x => x.Id == id);

            var associatedColorsID = db.ProductColorlists.Where(x => x.pid == product.Id).Select(x => x.cid).ToList();

            var colors = db.Color_Tbl.ToList();

            var pc = new ProductColorlist
            {
                Product_Tbl = product,
                Color_Tbl = colors,
                SelectedColorId = associatedColorsID
            };

            return View(pc);
        }

        [HttpPost]
        public ActionResult EditProduct(List<int> SelectedColorId, Product_Tbl p, HttpPostedFileBase pimg1, HttpPostedFileBase pimg2, HttpPostedFileBase pimg3)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                if (pimg1 != null && pimg1.ContentLength > 0)
                {
                    p.pimg1 = pimg1.FileName;
                    VaryQualityLevel(pimg1.InputStream, pimg1.FileName);
                }

                if (pimg2 != null && pimg2.ContentLength > 0)
                {
                    p.pimg2 = pimg2.FileName;
                    VaryQualityLevel(pimg2.InputStream, pimg2.FileName);
                }

                if (pimg3 != null && pimg3.ContentLength > 0)
                {
                    p.pimg3 = pimg3.FileName;
                    VaryQualityLevel(pimg3.InputStream, pimg3.FileName);
                }
                var existingProductColors = db.ProductColorlists.Where(x => x.pid == p.Id).ToList();

                foreach (var existingProductColor in existingProductColors)
                {
                    if (!SelectedColorId.Contains(existingProductColor.cid))
                    {
                        db.ProductColorlists.Remove(existingProductColor);
                        db.SaveChanges();
                    }
                }

                foreach (var colorId in SelectedColorId)
                {
                    if (existingProductColors.Any(x => x.cid == colorId))
                    {

                    }
                    else
                    {
                        var colorName = db.Color_Tbl.FirstOrDefault(x => x.Id == colorId)?.ColorName;
                        if (colorName != null)
                        {
                            var newProductColor = new ProductColorlist
                            {
                                pid = p.Id,
                                cid = colorId,
                                colorname = colorName
                            };
                            db.ProductColorlists.Add(newProductColor);
                            db.SaveChanges();
                        }
                    }
                }
            }
            db.Entry(p).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("EditProduct", "Admin");
        }

        public ActionResult ChangeToActive(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            Product_Tbl product = db.Product_Tbl.Single(x => x.Id == id);
            product.status = true;
            db.SaveChanges();
            return RedirectToAction("AddProduct");
        }

        public ActionResult ChangeToDeactive(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            Product_Tbl product = db.Product_Tbl.Single(x => x.Id == id);
            product.status = false;
            db.SaveChanges();
            return RedirectToAction("AddProduct");
        }

        public ActionResult DeleteProduct(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            db.Product_Tbl.Remove(db.Product_Tbl.Where(x => x.Id == id).SingleOrDefault());
            db.SaveChanges();
            return RedirectToAction("AddProduct");
        }

        [HttpPost, ActionName("DeleteProduct")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            Product_Tbl product = db.Product_Tbl.Find(id);
            db.Product_Tbl.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        private void VaryQualityLevel(Stream stream, string fname)
        {
            System.Drawing.Image photo = new Bitmap(stream);

            Bitmap bmp1 = new Bitmap(photo, 270, 300);
            ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);
            System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 90L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            bmp1.Save(Server.MapPath("~/Content/assets/Images/Products/" + fname), jgpEncoder, myEncoderParameters);
            bmp1.Dispose();
        }

        private ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Admin_Tbl login)
        {
            if (ModelState.IsValid)
            {
                var model = db.Admin_Tbl.Any(m => m.uName == login.uName && m.uPassword == login.uPassword);
                if (model)
                {
                    var loginInfo = db.Admin_Tbl.FirstOrDefault(x => x.uName == login.uName && x.uPassword == login.uPassword);

                    Session["username"] = loginInfo.uName;
                    Session["userid"] = loginInfo.Id;

                    return Json(new { success = true }); // Return JSON response indicating successful login
                }
                else
                {
                    return Json(new { success = false }); // Return JSON response indicating failed login
                }
            }

            return View("Login");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }

        public ActionResult AddGallery()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.gallery = db.Gallery_Tbl.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult AddGallery(Gallery_Tbl model, HttpPostedFileBase image)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                int ID = 1;
                if (image != null && image.ContentLength > 0)
                {
                    if (db.Gallery_Tbl.Count() > 0)
                    {
                        ID = db.Gallery_Tbl.Max(x => x.Id) + 1;
                    }
                    var fileName = ID + ".jpg";
                    model.gimage = fileName;
                    galleryResize(image.InputStream, fileName);
                }
                model.Id = ID;
                db.Gallery_Tbl.Add(model);
                db.SaveChanges();
            }
            return RedirectToAction("AddGallery");
        }

        public ActionResult DeleteGallery(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }

            var galleryItem = db.Gallery_Tbl.Find(id);
            if (galleryItem != null)
            {
                // Delete the image file from the folder
                string imagePath = Path.Combine(Server.MapPath("~/Content/assets/Images/Gallery/"), galleryItem.gimage);
                if (System.IO.File.Exists(imagePath))
                {
                    System.IO.File.Delete(imagePath);
                }

                // Remove the gallery item from the database
                db.Gallery_Tbl.Remove(galleryItem);
                db.SaveChanges();
            }

            return RedirectToAction("AddGallery");
        }

        private void galleryResize(Stream stream, string fname)
        {
            System.Drawing.Image photo = new Bitmap(stream);
            Bitmap bmp1 = new Bitmap(photo, 300, 300);
            ImageCodecInfo jgpEncoder = GetEncoder10(ImageFormat.Jpeg);
            System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 90L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            bmp1.Save(Server.MapPath("~/Content/assets/Images/Gallery/" + fname), jgpEncoder, myEncoderParameters);
            bmp1.Dispose();
        }

        private ImageCodecInfo GetEncoder10(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        public ActionResult AddReview()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.AllReview = db.Review_Tbl.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult AddReview(Review_Tbl model, HttpPostedFileBase uimg)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                if (uimg != null && uimg.ContentLength > 0)
                {
                    model.uimg = uimg.FileName;
                    ReviewResizeImage(uimg.InputStream, uimg.FileName);
                }
            }
            db.Review_Tbl.Add(model);
            db.SaveChanges();

            return RedirectToAction("AddReview");
        }

        public ActionResult EditReview(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            Review_Tbl rv = db.Review_Tbl.Single(x => x.Id == id);
            if (rv == null)
            {
                return HttpNotFound();
            }
            return View("EditReview", rv);
        }

        [HttpPost]
        public ActionResult EditReview(Review_Tbl model, HttpPostedFileBase uimg)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                if (uimg != null && uimg.ContentLength > 0)
                {
                    model.uimg = uimg.FileName;
                    ReviewResizeImage(uimg.InputStream, uimg.FileName);
                }
            }
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("AddReview", "Admin");
        }

        public ActionResult DeleteReview(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            db.Review_Tbl.Remove(db.Review_Tbl.Where(x => x.Id == id).SingleOrDefault());
            db.SaveChanges();
            return RedirectToAction("AddReview");
        }

        private void ReviewResizeImage(Stream stream, string fname)
        {
            System.Drawing.Image photo = new Bitmap(stream);

            Bitmap bmp1 = new Bitmap(photo, 100, 100);
            // without size
            //  Bitmap bmp1 = new Bitmap(stream);
            ImageCodecInfo jgpEncoder = GetEncoder3(ImageFormat.Jpeg);
            System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters myEncoderParameters = new EncoderParameters(1);
            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 90L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            bmp1.Save(Server.MapPath("~/Content/assets/Images/Review/" + fname), jgpEncoder, myEncoderParameters);
            bmp1.Dispose();
        }

        private ImageCodecInfo GetEncoder3(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;

        }

        public ActionResult ManagementTeam()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var team = db.Teams.ToList();
            return View(team);
        }

        [HttpPost]
        public ActionResult ManagementTeam(Team team, HttpPostedFileBase image)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                int memberID = 1;

                if (image != null && image.ContentLength > 0)
                {
                    if (db.Teams.Count() > 0)
                    {
                        memberID = db.Teams.Max(x => x.Id) + 1;
                    }
                    var fileName = memberID + ".jpg";
                    image.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/Images/Team/"), fileName));
                    team.image = fileName;
                }
                team.Id = memberID;
                db.Teams.Add(team);
                db.SaveChanges();
            }
            return RedirectToAction("ManagementTeam");
        }

        public ActionResult EditManagementTeam(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var team = db.Teams.Single(x => x.Id == id);
            return View(team);
        }

        [HttpPost]
        public ActionResult EditManagementTeam(Team team, HttpPostedFileBase image)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (image != null && image.ContentLength > 0)
            {
                var fileName = team.Id + ".jpg";
                image.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/Images/Team/"), fileName));
                team.image = fileName;
            }
            db.Entry(team).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("ManagementTeam", "Admin");
        }

        public ActionResult DeleteManagementTeam(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            db.Teams.Remove(db.Teams.Where(x => x.Id == id).SingleOrDefault());
            db.SaveChanges();
            return RedirectToAction("ManagementTeam");
        }

        //------------------------------------------------------------------
        
        public ActionResult GetCustomerAccounts()
        {
            // Replace this with your actual data retrieval logic
            List<Customers_Tbl> customers = db.Customers_Tbl.ToList();

            return Json(customers, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddClientReportingPartyAccount()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ViewBag.ClientReportingPartyAccount = db.ClientReportingPartyAccountTbls.ToList();

            return View();
        }
        [HttpPost]
        public ActionResult AddClientReportingPartyAccount(ClientReportingPartyAccountTbl model,int SelectedCustomerId)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }

            if (ModelState.IsValid)
            {
                model.PrimaryCustId = SelectedCustomerId;
                model.Status = true;
                db.ClientReportingPartyAccountTbls.Add(model);
                db.SaveChanges();
            }
            return RedirectToAction("AddClientReportingPartyAccount", "Admin");
        }

        public ActionResult EditClientReportingPartyAccount(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            return View(db.ClientReportingPartyAccountTbls.Single(x => x.Id == id));
        }

        [HttpPost]
        public ActionResult EditClientReportingPartyAccount(ClientReportingPartyAccountTbl model)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            if (ModelState.IsValid)
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
            }
            return RedirectToAction("EditClientReportingPartyAccount", "Admin");
        }

        public ActionResult ChangeToActiveClientReportingPartyAccount(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ClientReportingPartyAccountTbl model = db.ClientReportingPartyAccountTbls.Single(x => x.Id == id);
            model.Status = true;
            db.SaveChanges();
            return RedirectToAction("AddClientReportingPartyAccount");
        }

        public ActionResult ChangeToDeactiveClientReportingPartyAccount(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            ClientReportingPartyAccountTbl model = db.ClientReportingPartyAccountTbls.Single(x => x.Id == id);
            model.Status = false;
            db.SaveChanges();
            return RedirectToAction("AddClientReportingPartyAccount");
        }

        public ActionResult DeleteClientReportingPartyAccount(int id)
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            db.ClientReportingPartyAccountTbls.Remove(db.ClientReportingPartyAccountTbls.Where(x => x.Id == id).SingleOrDefault());
            db.SaveChanges();
            return RedirectToAction("AddClientReportingPartyAccount");
        }

        public ActionResult ViewClientReport()
        {
            if (Session["userid"] == null)
            {
                return RedirectToAction("Login");
            }
            var ClientReportingTbl = db.ClientReportingTbls.ToList();

            return View(ClientReportingTbl);
        }

        [HttpPost]
        public ActionResult UploadClientReport()
        {
            string fixedPath = @"D:\a\b\c";
            string filePath = Path.Combine(fixedPath, "ClientReporting.xlsx"); // Update with the actual file name

            if (System.IO.File.Exists(filePath))
            {
                // Delete existing data
                var entitiesToRemove = db.ClientReportingTbls.ToList();
                foreach (var entity in entitiesToRemove)
                {
                    db.ClientReportingTbls.Remove(entity);
                }
                db.SaveChanges();

                using (var package = new ExcelPackage(new FileInfo(filePath)))
                {
                    var worksheet = package.Workbook.Worksheets[0];
                    int rowCount = worksheet.Dimension.Rows;

                    int startingRow = FindStartingRow(worksheet);
                    int endingRow = FindEndingRow(worksheet);

                    for (int row = startingRow; row <= endingRow; row++)
                    {
                        string LoomNo = worksheet.Cells[row, 1].Value?.ToString(); // Use Value? to handle null values
                        if (string.IsNullOrWhiteSpace(LoomNo))
                        {
                            // Stop processing when an empty LoomNo is encountered
                            break;
                        }
                        string OwnParty = worksheet.Cells[row, 2].Value.ToString();
                        string QualityNo = worksheet.Cells[row, 3].Value.ToString();
                        string ReedxPickxRs = worksheet.Cells[row, 4].Value.ToString();
                        string BeamNo = worksheet.Cells[row, 5].Value.ToString();
                        string BeamPipeNo = worksheet.Cells[row, 6].Value.ToString();
                        string DateOfGaitingKnotting = worksheet.Cells[row, 7].Value.ToString();
                        string BillFallDate = worksheet.Cells[row, 8].Value.ToString();
                        string Nos = worksheet.Cells[row, 9].Value.ToString();
                        string AvgOfRollingMtr = worksheet.Cells[row, 10].Value.ToString();
                        string AvgOfPick = worksheet.Cells[row, 11].Value.ToString();
                        string TotalFabricReced = worksheet.Cells[row, 12].Value.ToString();
                        string BeamBalanceMtr = worksheet.Cells[row, 13].Value.ToString();
                        // ... similar for other columns

                        var newItem = new ClientReportingTbl
                        {
                            LoomNo = LoomNo,
                            OwnParty = OwnParty,
                            QualityNo = QualityNo,
                            ReedxPickxRs = ReedxPickxRs,
                            BeamNo = BeamNo,
                            BeamPipeNo = BeamPipeNo,
                            DateOfGaitingKnotting = DateOfGaitingKnotting,
                            BillFallDate = BillFallDate,
                            Nos = Nos,
                            AvgOfRollingMtr = AvgOfRollingMtr,
                            AvgOfPick = AvgOfPick,
                            TotalFabricReced = TotalFabricReced,
                            BeamBalanceMtr = BeamBalanceMtr,
                            // ... set other properties
                        };

                        db.ClientReportingTbls.Add(newItem);
                        db.SaveChanges();
                        TempData["msg"] = "<script>alert('Upload successfully');</script>";
                    }

                    ViewBag.SuccessMessage = "Data uploaded successfully.";
                }
            }
            else
            {
                ViewBag.ErrorMessage = "File not found at the specified path.";
            }

            return View("Index");
        }

        private int FindStartingRow(ExcelWorksheet worksheet)
        {
            int rowCount = worksheet.Dimension.Rows;
            for (int row = 1; row <= rowCount; row++)
            {
                string firstColumnValue = worksheet.Cells[row, 1].Value?.ToString();
                if (!string.IsNullOrWhiteSpace(firstColumnValue) && firstColumnValue.Trim().Equals("Loom No", StringComparison.OrdinalIgnoreCase))
                {
                    return row + 1; // Start from the row after the "Loom No" header
                }
            }
            return -1; // Return -1 if "Loom No" header is not found
        }

        private int FindEndingRow(ExcelWorksheet worksheet)
        {
            int rowCount = worksheet.Dimension.Rows;
            for (int row = 1; row <= rowCount; row++)
            {
                string firstColumnValue = worksheet.Cells[row, 1].Value?.ToString();
                if (!string.IsNullOrWhiteSpace(firstColumnValue) && firstColumnValue.Trim().Equals("Grand Total", StringComparison.OrdinalIgnoreCase))
                {
                    return row - 1; // End at the row before the "Grand Total" row
                }
            }
            return rowCount; // Return the last row if "Grand Total" header is not found
        }

        public ActionResult Export()
        {
            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("ClientReporting");

                // Set headers
                var headers = new List<string>
        {
            "Loom No", "Own Party", "Quality No", "ReedxPickxRs", "Beam No",
            "Beam Pipe No", "Date of Gaiting/Knotting", "B/fall Date", "Nos",
            "Avg. of Rolling Mtr", "Avg. of Pick", "Total Fabric Reced", "Beam Balance Mtr"
        };

                for (int col = 1; col <= headers.Count; col++)
                {
                    worksheet.Cells[1, col].Value = headers[col - 1];
                }

                // Fetch data from the database
                var data = db.ClientReportingTbls.ToList();

                // Populate data rows
                // Populate data rows
                for (int row = 2; row <= data.Count + 1; row++)
                {
                    for (int col = 1; col <= headers.Count; col++)
                    {
                        switch (col)
                        {
                            case 1:
                                worksheet.Cells[row, col].Value = data[row - 2].LoomNo;
                                break;
                            case 2:
                                worksheet.Cells[row, col].Value = data[row - 2].OwnParty;
                                break;
                            case 3:
                                worksheet.Cells[row, col].Value = data[row - 2].QualityNo;
                                break;
                            case 4:
                                worksheet.Cells[row, col].Value = data[row - 2].ReedxPickxRs;
                                break;
                            case 5:
                                worksheet.Cells[row, col].Value = data[row - 2].BeamNo;
                                break;
                            case 6:
                                worksheet.Cells[row, col].Value = data[row - 2].BeamPipeNo;
                                break;
                            case 7:
                                worksheet.Cells[row, col].Value = data[row - 2].DateOfGaitingKnotting;
                                break;
                            case 8:
                                worksheet.Cells[row, col].Value = data[row - 2].BillFallDate;
                                break;
                            case 9:
                                worksheet.Cells[row, col].Value = data[row - 2].Nos;
                                break;
                            case 10:
                                worksheet.Cells[row, col].Value = data[row - 2].AvgOfRollingMtr;
                                break;
                            case 11:
                                worksheet.Cells[row, col].Value = data[row - 2].AvgOfPick;
                                break;
                            case 12:
                                worksheet.Cells[row, col].Value = data[row - 2].TotalFabricReced;
                                break;
                            case 13:
                                worksheet.Cells[row, col].Value = data[row - 2].BeamBalanceMtr;
                                break;
                                // ... Add more cases for additional columns
                        }
                    }
                }

                // Auto-fit columns for better visibility
                worksheet.Cells.AutoFitColumns();

                // Return the Excel file as a response
                var stream = new MemoryStream(package.GetAsByteArray());
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "ClientReportingExport.xlsx");
            }
        }

    }
}