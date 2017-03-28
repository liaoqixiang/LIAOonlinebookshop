using LeoBookShop.BLL;
using LeoBookShop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace LeoBookShopUI
{
    public class BasePage:Page
    {
        
        protected override void OnPreInit(EventArgs e)
        {
            if (Request.Cookies["cp1"] == null)
            {
                if (Session["userInfo"] == null)
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                
                

            }
           


            base.OnPreInit(e);
        }
    }
}