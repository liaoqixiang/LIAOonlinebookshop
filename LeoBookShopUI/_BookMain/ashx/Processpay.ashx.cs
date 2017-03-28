using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.Model;
using LeoBookShop.BLL;
namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for Processpay
    /// </summary>
    public class Processpay : BaseHandler
    {
        CartManager cm = new CartManager();
        OrderBookManager obm = new OrderBookManager();
        OrderBook ob = new OrderBook();
        public override void SubProcessRequst(HttpContext context)
        {
            int totalprice = Convert.ToInt32(context.Request["totalprice"]);
            string address = context.Request["address"];
            int userid = baseuser.Id;
            ob.UserID = userid;
            ob.TotalPrice = totalprice;
            ob.Address = address;
            cm.Delete(userid);
            if(obm.Insert(ob)>0)
            {
                context.Response.Write("yes");
            }
        }


    }
}