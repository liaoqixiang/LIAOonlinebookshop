using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.BLL;
using LeoBookShop.Model;

namespace LeoBookShopUI.Account
{
    public partial class Login : Page
    {
        UsersManager um = new UsersManager();
        public Users u = new Users();
        public string Msg;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = Request["username"];
                string userpassword = Request["password"];
                string validatecode = Request["validatecode"];
                if (validatecode != Session["vcode"].ToString())
                {
                    Msg = "vcode is wrong";
                    return;
                }
                switch (um.ValidateUser(username, userpassword, out Msg, out u ))
                {
                    case Loginstate.LoginState_success:
                        string va = Request["checkboxcookie"];
                        //check if user checked the checkbox
                        if (!string.IsNullOrEmpty(Request["checkboxcookie"]))
                        {
                            Response.Cookies["cp1"].Value = u.LoginId;
                            Response.Cookies["cp2"].Value = u.LoginPwd;
                            Session["userInfo"] = u;
                            Response.Redirect("~/_BookMain/books.aspx");
                            return;
                        }

                        Session["userInfo"] = u;
                        Response.Redirect("~/_BookMain/books.aspx");
                        return;
                    case Loginstate.Username_not_exists:
                        return;

                    case Loginstate.UserPassWord_wrong:
                        return;
                }


            }


        }
    }
}