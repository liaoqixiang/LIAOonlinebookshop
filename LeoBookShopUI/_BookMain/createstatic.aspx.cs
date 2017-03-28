using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.BLL;
namespace LeoBookShopUI._BookMain
{
    public partial class createstatic : Page
    {
        //this class is to generate new static html pages.
        BooksManager bm = new BooksManager();
        protected void Page_Load(object sender, EventArgs e)
        {
           IEnumerable<LeoBookShop.Model.Books> list  =  bm.QueryList(0, 0, null, "Id", false);
            foreach (var item in list)
            {
                //call this method to replace the placeholder in BookTemplate.
                bm.CreateHtmlPage(item.Id);
            }
        }
    }
}