using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeoBookShop.BLL;
using LeoBookShop.Model;
using LeoBookShop.Utility;

namespace LeoBookShopUI._BookMain
{
    public partial class books :Page
    {

        public IEnumerable<Books> list;
        public int pageIndex;
        public double TotalPage;
        public int totalbooks;
        public int CategoryId;
        Categories category;
        BooksManager b = new BooksManager();
        CategoriesManager cm = new CategoriesManager();
        public IEnumerable<Categories> cat;
        public string Orderfield;
        public bool IsDesc;
        public SortState sortorder;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cat = cm.QueryList(0, 0, null, "Id");
                CategoryId = Convert.ToInt32(Request["cat"]);
                if (CategoryId == 0)//no category
                {
                    TotalPage = Math.Ceiling(((double)b.GetCount()) / 8);
                    totalbooks = b.GetCount();
                    pageIndex = Convert.ToInt32(Request["pageIndex"]);
                    if (pageIndex <= 0)
                    {
                        pageIndex = 1;
                    }
                    checkSort();
                    if (Orderfield == null)
                    {
                        list = b.QueryList(pageIndex, 8, null, "Id", false);
                        return;
                    }

                    list = b.QueryList(pageIndex, 8, null, Orderfield, IsDesc);
                    

                }
                else
                {

                    category = cm.QuerySingle(new { Id = CategoryId });//category
                    if (category != null)
                    {
                        pageIndex = Convert.ToInt32(Request["pageIndex"]);
                        if (pageIndex <= 0)
                        {
                            pageIndex = 1;
                        }
                        var where = new { CategoryId = category.Id };
                        totalbooks = b.GetCount(CategoryId);
                        TotalPage = Math.Ceiling(((double)b.GetCount(CategoryId)) / 8);
                        checkSort();
                        if (Orderfield == null)
                        {
                            list = b.QueryList(pageIndex, 8, where, "Id", false);
                            return; 
                        }
                        list = b.QueryList(pageIndex, 8, where, Orderfield, IsDesc);
                    }
                    else
                    {
                        Response.Write("no");
                        return;
                    }
                }


            }

        }
        public enum SortState
        {

            PriceAsc = 1,
            PricDesc = 2,

        }
        public void checkSort()
        {
           int value =  Convert.ToInt32(Request["sort"]);
            sortorder = (SortState)value;
            switch ((SortState)value)
            {
                case SortState.PriceAsc:
                    Orderfield = "UnitPrice";
                    IsDesc = false;
                    break;
                case SortState.PricDesc:
                    Orderfield = "UnitPrice";
                    IsDesc = true;
                    break;

            }
        }
    }
}