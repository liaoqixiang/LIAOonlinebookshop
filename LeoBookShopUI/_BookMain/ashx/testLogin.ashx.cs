using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for testLogin
    /// </summary>
    public class testLogin : BaseHandler
    {
        public override void SubProcessRequst(HttpContext context)
        {
            if (baseuser != null)
            {
                context.Response.Write("yes");
            }
            else
            {
                context.Response.Write("no");
            }
        }

        
    }
}