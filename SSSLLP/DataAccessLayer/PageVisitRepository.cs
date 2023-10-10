using SSSLLP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSSLLP.DataAccessLayer
{
    public class PageVisitRepository
    {
        SSSLLPEntities db = new SSSLLPEntities();

        public PageVisitRepository(SSSLLPEntities dbContext)
        {
            db = dbContext;
        }

        public void AddPageVisit(PageVisit pageVisit)
        {
            db.PageVisits.Add(pageVisit);
            db.SaveChanges();
        }

        public int GetTotalVisitCount()
        {
            return db.PageVisits.Count();
        }

        public int GetUniqueVisitorCount()
        {
            return db.PageVisits.Select(p => p.VisitorId).Distinct().Count();
        }
    }

}