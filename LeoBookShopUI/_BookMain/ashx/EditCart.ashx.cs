using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.BLL;
namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for EditCart
    /// </summary>
    public class EditCart : BaseHandler
    {

        LeoBookShop.Model.Cart cart;
        CartManager cm = new CartManager();
        public override void SubProcessRequst(HttpContext context)
        {
         
            switch (context.Request["action"])
            {
                //for deleting books
                case "delete":
                    if (cm.Delete(Convert.ToInt32(context.Request["item"])) > 0)
                    {
                        context.Response.Write("Yes");
                    }
                    
                    break;
                //for change the number of books
                case "change":
                    cart = cm.QuerySingle(new { Id = context.Request["cartId"] });
                    cart.Count = Convert.ToInt32(context.Request["count"]);
                    if (cm.Update(cart) > 0)
                    {
                        context.Response.Write("ok");
                    }
                    break;
                default:
                    break;
            }


        }


    }
}