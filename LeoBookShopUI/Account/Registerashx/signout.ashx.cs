using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeoBookShopUI.Account.Registerashx
{
    /// <summary>
    /// Summary description for signout
    /// </summary>
    public class signout : BaseHandler
    {


        public override void SubProcessRequst(HttpContext context)
        {
            if (baseuser != null)
            {
                context.Session["userInfo"] = null;
                context.Request.Cookies["cp1"].Value = null;
                context.Response.Write("Sign out Successfully");
            }
           
        }

    }
}