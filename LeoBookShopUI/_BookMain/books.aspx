<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster/Main.Master" AutoEventWireup="true" CodeBehind="books.aspx.cs" Inherits="LeoBookShopUI._BookMain.books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <input id="totalbook" type="hidden" name="name" value="<%=TotalPage %>" />

    <div class="container">
        <!-- Content starts -->
        <div id="header">
        </div>
        <div class="item-pro-list mt10">
            <div class="list-item-title">
                
                <div class="sort-left pull-left pl10">
                    <ul class="btn btn-default btn-xs">
                        <li class="dropdown" style="list-style: none">
                            <span data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category</span>
                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li><%foreach (var item in cat)
                                        {%>
                                    <a onclick="setCategory('<%=item.Name %>')" class="btn btn-default btn-xs" href="?pageIndex=1&cat=<%=item.Id %>"><%=item.Name %></a>
                                    <%} %></li>

                            </ul>
                        </li>

                    </ul>

                </div>
                <div class="sort-left pull-left pl10">
                    <span>Order：</span>

                    <a href="?pageIndex=1&cat=<%=CategoryId %>&sort=<%=sortorder == SortState.PriceAsc ? 2 : 1 %>">Price
                        <%if (sortorder == SortState.PriceAsc)
                                {%>
                         <span class="glyphicon glyphicon-arrow-up"></span>
                        <%} %>
                    <%else{ %>
                     <span class="glyphiconglyphicon-arrow-down"></span>

                    <%} %>
                        
                   </a>
                </div>
                <div class="sort-right pull-right">
                    <span><b class="red-font mr10">Totalbooks: <%=totalbooks %></b> <b class="red-font"><%=pageIndex %></b>/<span id="totalpage"><%=TotalPage %></span></span>
                    <a href="?pageIndex=<%int count = pageIndex; count--; count = count <= 0 ? 1 : count; %><%=count %>&cat=<%=CategoryId %>&sort=<%=Convert.ToInt32(sortorder) %>" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-chevron-left"></i>Prevs</a>
                    <a href="?pageIndex=<% int count1 = pageIndex; count1++;%><%=count1 %>&cat=<%=CategoryId %>&sort=<%=Convert.ToInt32(sortorder) %>" class="btn btn-default btn-xs">Next<i class="glyphicon glyphicon-chevron-right"></i></a>
                </div>

            </div>

            <div class="clearfix"></div>
            <div class="pro-list-show">
                <ul class="lazy">
                    <%foreach (var item in list)
                        {%>
                    <li>
                        <a href="/HtmlPage/<%=item.PublishDate.Year %>-<%=item.PublishDate.Month %>-<%=item.PublishDate.Day %>/<%=item.Id %>.html">
                            <img alt="<%=item.Title %>" src="/images/BookCovers/<%=item.ISBN%>.jpg" onerror="this.src='/images/error.jpg'" /></a>
                        <div class="summary"><a href="/HtmlPage/<%=item.PublishDate.Year %>-<%=item.PublishDate.Month %>-<%=item.PublishDate.Day %>/<%=item.Id %>.html"><%=item.Title %></a></div>
                        <i class="icon-main icon-eva-6"></i>
                        <div class="price"><b>$<%=Convert.ToDouble(item.UnitPrice) %></b></div>
                        <div class="list-show-eva">
                            <button type="button" class="btn btn-default btn-xs" onclick="processcart(<%=item.Id %>)">ADD-TO-CART</button>
                        
                        </div>



                    </li>
                    <% }%>
                </ul>

            </div>
            <ul class="pagination pagination-sm col-lg-6 col-md-6 col-sm-6" style="float: right">
                <li><a href="books.aspx?pageIndex=1&cat=<%=CategoryId %>&sort=-1">&laquo;</a></li>

                <%=LeoBookShop.Utility.PageBarHelper.PageBar(pageIndex, TotalPage,CategoryId,Convert.ToInt32(sortorder)) %>
                <li><a href="books.aspx?pageIndex=<%=TotalPage%>&cat=<%=CategoryId %>&sort=-1">&raquo;</a></li>
            </ul>

        </div>

    </div>
    <!-- Contents End -->
   
    
     <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="addname">UserName</label>
                        <input type="text" id="addname" name="UserName" class="form-control" placeholder="UserName" />
                    </div>
                    <div class="form-group">
                        <label for="addpassword">Password</label>
                        <input type="text" id="addpassword" name="UserPass" class="form-control" placeholder="Password" />
                    </div>
                    <input type="checkbox" id="usercookie" value="1" />Remember me<br />
                    <span id="finalmsg"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="checklogin()">Login</button>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">Congraduation!!!</h4>
                </div>
                <div class="modal-body">
                   <h5>books added successfully, please go to <a href="/_BookMain/shoppingcart.aspx" style="color: brown">cart</a> to check out
        or <a href="/_BookMain/books.aspx" style="color: brown">Keep shopping</a></h5> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


                </div>
            </div>
        </div>
    </div>
     <!-- Modal ends -->

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script>
        function signout() {
            $.post("/Account/Registerashx/signout.ashx", {}, function (data) {
                location.replace("/HomePage/Home.html");
            })
        }
        
        function processcart(bookid) {

            $.post("/_BookMain/ashx/ProcessCart.ashx", { "bookId": bookid, "countofbook": 1 }, function (data) {
                if (data == "no") {
                    $('#myModal').modal('show');

                }
                else if (data == "yes") {
                    $("#myModal1").modal("show");
                }

            });
        }
        function checklogin() {
            if ($("#usercookie").prop('checked') == true) {
                $('#usercookie').val(2);

            }
            else {
                $('#usercookie').val(1);
            }

            $.post("/_BookMain/ashx/checkLogin.ashx", { "username": $('input[name=UserName]').val(), "userpwd": $('input[name=UserPass]').val(), "checkcookie": $('#usercookie').val() }, function (data) {
                $("#finalmsg").text(data);
                if (data == "Login Successfully") {
                    
                }
                setTimeout(function () {
                    $("#myModal").modal('hide');
                    $("#finalmsg").text('');
                    location.reload();
                    
                }, 1000)

            });

        }
    </script>

</asp:Content>


