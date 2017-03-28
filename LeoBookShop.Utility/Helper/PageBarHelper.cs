using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeoBookShop.Utility
{
    public class PageBarHelper
    {
        /// <summary>
        /// This method is to get the page bar.
        /// </summary>
        /// <param name="pageIndex">current index of page</param>
        /// <param name="totalpage">total page</param>
        /// <param name="CategoryId">what kind of category</param>
        /// <param name="sortorder">ascending order or descending order</param>
        /// <returns></returns>
        public static string PageBar(int pageIndex, double totalpage,int CategoryId,int sortorder)
        {
            if (totalpage == 1)
            {
                return string.Empty;
            }
            StringBuilder sb = new StringBuilder();
            //get the start position and the end position
            double start = pageIndex - 3;//see the next 2 page number
            if (start < 1)
            {
                start = 1;
            }
            double end = start + 5;//show 6 page number
            if (end > totalpage)
            {
                end = totalpage;
                start = end - 5 > 0 ? end - 5 : 1;
            }
            for (double i = start; i <=end; i++)
            {
                if (i == pageIndex)
                {
                    sb.Append(string.Format("<li class='page-item'><a href='?pageIndex={0}&cat={1}&sort={2}' class='changecolor page-link'>{0}</a></li>", i, CategoryId, sortorder));
                }
                else
                {
                    sb.Append(string.Format("<li class='page-item'><a href='?pageIndex={0}&cat={1}&sort={2}' class='page-link'>{0}</a></li>", i, CategoryId, sortorder));
                }
            }
           

            return sb.ToString();
        }
    }
}
