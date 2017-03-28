using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.Model;
using LeoBookShop.BLL;
namespace LeoBookShopUI
{

    public abstract class BaseHandler : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
        UsersManager um = new UsersManager();
        public Users baseuser;
        public bool IsReusable
        {
            get
            {
                return false;
            }
        } 
        /// <summary>
        /// this method is for some webpages which needs to check session and cookie
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {

            if (context.Request.Cookies["cp1"] == null)
            {
                if (context.Session["userInfo"] == null)
                {
                    SubProcessRequst(context);
                    return;
                    //context.Response.Redirect("~/Account/Login.aspx");
                }
                else
                {
                    baseuser = context.Session["userInfo"] as Users;
                    SubProcessRequst(context);
                    return;
                }


            }
            baseuser = um.QuerySingle(new { LoginId = context.Request.Cookies["cp1"].Value });
            SubProcessRequst(context);
        }
        public abstract void SubProcessRequst(HttpContext context);
        
    }
}