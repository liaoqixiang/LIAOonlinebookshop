using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.Utility;
using System.Drawing;

namespace LeoBookShopUI.Account.Registerashx
{
    /// <summary>
    /// Summary description for vcode
    /// </summary>
    public class vcode : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
         
            string vcode = CaptchaHelper.CreateRandomCode(4);
            context.Session.Add("vcode", vcode);
            byte[] bs = CaptchaHelper.DrawImage(vcode, 20, Color.White);
            context.Response.ContentType = "image/gif";
            context.Response.BinaryWrite(bs);
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