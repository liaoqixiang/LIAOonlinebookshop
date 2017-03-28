using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class PageBarHelper
    {
        public static string PageBar(int pageIndex, double totalpage)
        {
            if (totalpage == 1)
            {
                return string.Empty;
            }
            StringBuilder sb = new StringBuilder();
            //计算起始位置与终止位置
            double start = pageIndex - 5;//显示10个数字页码
            if (start < 1)
            {
                start = 1;
            }
            double end = start + 9;
            if (end > totalpage)
            {
                end = totalpage;
                start = end - 9 > 0 ? end - 9 : 1;
            }
            for (double i = start; i <=end; i++)
            {
                if (i == pageIndex)
                {
                    sb.Append(string.Format("<li class='page-item'><a href='?pageIndex={0}' class='changecolor page-link'>{0}</a></li>", i));
                }
                else
                {
                    sb.Append(string.Format("<li class='page-item'><a href='?pageIndex={0}' class='page-link'>{0}</a></li>", i));
                }
            }
           

            return sb.ToString();
        }
    }
}
