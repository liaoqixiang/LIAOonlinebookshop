using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.BLL;
using LeoBookShop.Model;
namespace LeoBookShopUI.Account.Registerashx
{
    /// <summary>
    /// Summary description for CheckUser
    /// </summary>
    public class CheckUser : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        UsersManager users = new UsersManager();
        Users u = new Users();
        public string validatecode;
        public string username;
        public string sessionvcode;
        public string password;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            switch (context.Request["action"])
            {
                case "username":
                    username = context.Request["checktype"];
                    if (users.QueryCount(new { LoginId = username }) > 0)
                    {
                        context.Response.Write("no");
                    }
                    break;
                case "vcode":
                    validatecode = context.Request["checktype"];
                    sessionvcode = context.Session["vcode"].ToString();
                    if (validatecode != sessionvcode)
                    {
                        context.Response.Write("no");
                    }
                    break;
                case "finalcheck":
                    username = context.Request["username"];
                    validatecode = context.Request["vcode"];
                    password = context.Request["pass"];
                    sessionvcode = context.Session["vcode"].ToString();
                    if (users.QueryCount(new { LoginId = username }) > 0 && validatecode != sessionvcode)
                    {
                        context.Response.Write("no");
                    }
                    else
                    {
                        u.LoginId = username;
                        u.LoginPwd = password;
                        u.Mail = "";
                        u.Name = string.Empty;
                        u.Phone= string.Empty;
                        u.UserStateId = 1;
                        u.Address = string.Empty;
                        
                        if (users.Insert(u) > 0)
                        {
                          context.Response.Write("well");
                        }
                    }

                    break;
            }


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}