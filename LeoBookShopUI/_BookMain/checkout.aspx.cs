using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.BLL;
using LeoBookShop.Model;
namespace LeoBookShopUI._BookMain
{
    public partial class checkout : BasePage
    {
        public CartManager cart = new CartManager();
        public BooksManager bm = new BooksManager();
        UsersManager um = new UsersManager();
        Users u;
        public IEnumerable<Cart> cartlist { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["cp1"] != null)
            {
               string username =  Request.Cookies["cp1"].Value.ToString();
                u = um.QuerySingle(new { LoginId = username });
            }
            else
            {
               u = Session["userInfo"] as Users;
                
            }
            cartlist =  cart.QueryList(0, 0, new { UserId = u.Id }, "Id", false);
            if (cartlist == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}