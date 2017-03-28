using LeoBookShop.BLL;
using LeoBookShop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for checkLogin
    /// </summary>
    public class checkLogin : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
        Users user;
        UsersManager um = new UsersManager();
        public void ProcessRequest(HttpContext context)
        {
            //retrieve data from client side
            string username = context.Request["username"];
            string userpwd = context.Request["userpwd"];
            string usercookie = context.Request["checkcookie"];
            user = um.QuerySingle(new { LoginId = username });
            //start validate user
            if (user != null)
            {
                if (user.LoginPwd == userpwd)
                {
                    if (usercookie == "1")
                    {
                       
                        context.Session.Add("userInfo", user);
                        context.Response.Write("Login Successfully");
                    }
                    else
                    {
                        context.Response.Write("Login Successfully");
                        HttpCookie ck1 = new HttpCookie("cp1", username);
                        HttpCookie ck2 = new HttpCookie("cp2", userpwd);
                        ck1.Expires = DateTime.Now.AddDays(7);
                        ck2.Expires = DateTime.Now.AddDays(7);
                        context.Response.Cookies.Add(ck1);
                        context.Response.Cookies.Add(ck2);

                    }
                }
                else
                {
                    context.Response.Write("userpwd is wrong");
                }

            }
            else
            {
                context.Response.Write("username not exists");
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