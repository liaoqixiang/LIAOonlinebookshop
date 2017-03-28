using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.Model;
using LeoBookShop.BLL;
namespace LeoBookShopUI._BookMain
{
    public partial class shoppingcart : BasePage
    {
        
        public IEnumerable<Cart> cartlist;
        public Users u;
        CartManager cm = new CartManager();
        UsersManager us = new UsersManager();
        public BooksManager bm = new BooksManager();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCart();
        }
        private void GetCart()
        {
            if (Request.Cookies["cp1"] != null)
            {
                string username = Request.Cookies["cp1"].Value;
                Users user = us.QuerySingle(new { LoginId = username });
                cartlist = cm.QueryList(0, 0, new { UserId = user.Id }, "Id", false);

            }
            else
            {
                u = (Users)Session["userInfo"];
                cartlist = cm.QueryList(0, 0, new { UserId = u.Id }, "Id", false);
            }

        }
    }
}