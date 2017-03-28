using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.BLL;
using LeoBookShop.Model;
namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for ProcessCart: Add books to cart!
    /// </summary>
    public class ProcessCart : MemberHandler
    {
        Cart cart = new Cart();
        Users u = new Users();
        CartManager cm = new CartManager();
        public override void SubProcessRequst(HttpContext context)
        {
            string bookid = context.Request["bookId"];
            int numberofbook = Convert.ToInt32(context.Request["countofbook"]);
            Cart cmcm = cm.QuerySingle(new { BookId = context.Request["bookId"], __o = "and", UserId = baseuser.Id });
            if (cmcm != null)
            {
                if (numberofbook < 1)
                {
                    numberofbook = 1;
                }
                cmcm.Count += numberofbook;
                cart = cmcm;
                if (cm.Update(cart) > 0)
                {
                    context.Response.Write("yes");
                    return;
                }
            }
            else
            {
                cart.UserId = baseuser.Id;
                cart.BookId = Convert.ToInt32(bookid);
                cart.Count = numberofbook;
                if (cm.Insert(cart) > 0)
                {
                    context.Response.Write("yes");
                    return;
                }
            }


        }


    }
}