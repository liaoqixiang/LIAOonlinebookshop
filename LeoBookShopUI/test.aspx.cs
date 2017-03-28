using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.BLL;
using LeoBookShop.Model;
using LeoBookShop.DAL;
namespace LeoBookShopUI
{
    public partial class test : System.Web.UI.Page
    {
        Users u = new Users();
        UsersManager users = new UsersManager();
        UsersService uu = new UsersService();
        CategoriesManager cm = new CategoriesManager();
        CartManager cart = new CartManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            IEnumerable<Users> uss = users.QueryList(2, 2, new { LoginId = "liye" }, "Id", false);
            foreach (var item in uss)
            {
                

            }
         
           

        }
    }
}