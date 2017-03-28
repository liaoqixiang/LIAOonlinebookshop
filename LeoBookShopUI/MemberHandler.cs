using LeoBookShop.BLL;
using LeoBookShop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeoBookShopUI
{
    public abstract class MemberHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        UsersManager um = new UsersManager();
        public Users baseuser;
        public bool IsReusable
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public void ProcessRequest(HttpContext context)
        {

            if (context.Request.Cookies["cp1"] == null)
            {
                if (context.Session["userInfo"] == null)
                {
                    context.Response.Write("no");
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