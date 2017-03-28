using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeoBookShop.BLL;
using LeoBookShop.Model;
namespace LeoBookShopUI._BookMain.ashx
{
    /// <summary>
    /// Summary description for BookComment
    /// </summary>
    public class BookComment : BaseHandler
    {
        BookCommentManager bcm = new BookCommentManager();
        
        IEnumerable<LeoBookShop.Model.BookComment> commentlist;
        public override void SubProcessRequst(HttpContext context)
        {
            //load comment
            if (context.Request["action"] == "load")
            {
                string bookId = context.Request["book"];
                commentlist =  bcm.QueryList(1, 6, new { BookId = bookId }, "CreateDateTime");
                List<bookcommentviewmodel> viewmodellist = new List<bookcommentviewmodel>();
                foreach (var item in commentlist)
                {
                    bookcommentviewmodel bookviewmodel = new bookcommentviewmodel() ;
                    TimeSpan ts = DateTime.Now - item.CreateDateTime;
                    bookviewmodel.CreateTime = bcm.GetTimeSpan(ts);
                    bookviewmodel.Msg = item.Msg;
                    viewmodellist.Add(bookviewmodel);

                }
                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                string str1 = js.Serialize(viewmodellist);
                context.Response.Write(js.Serialize(viewmodellist));
            }
            //comment book
            else if (context.Request["action"] == "CommentBooks")
            {
                LeoBookShop.Model.BookComment mb = new LeoBookShop.Model.BookComment();
                mb.Msg = context.Request["comment"];
                mb.BookId = Convert.ToInt32(context.Request["bookid"]);
                mb.CreateDateTime = DateTime.Now;
                //use bookcommentviewmodel to get my designed list for comment.
                List<bookcommentviewmodel> newList = new List<bookcommentviewmodel>();
                bookcommentviewmodel bcvm = new bookcommentviewmodel();
                bcvm.Msg = mb.Msg;
                TimeSpan ts = DateTime.Now - mb.CreateDateTime;
                bcvm.CreateTime = bcm.GetTimeSpan(ts);
                newList.Add(bcvm);
                if (bcm.Insert(mb) > 0)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    context.Response.Write(js.Serialize(newList));
                }
                else
                {
                    context.Response.Write("no:Unable to load comment");

                }
            }
           
        }

       
    }
}