﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster/Main.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="LeoBookShopUI._BookMain.shoppingcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <form id="form1" runat="server">


        <!-- ShoppingCart -->
        <div class="container" style="padding-top: 50px">
            <div id="hassomething" class="row">
                <div class="col-lg-12">
                    <div class="cart-title f16 tit-family pl10 mt10">My Shopping cart</div>

                    <div class="cart-content">
                        <table style="width:100%" border="0">
                            <tbody>
                                <tr>
                                    <td style="width:10%" class="tr-title">

                                        <div class="checkbox">
                                            <label>
                                                <input id="selectall" type="checkbox" onclick="checkboxfordelete()" />Select ALL</label>
                                        </div>

                                    </td>
                                    <td style="width:45%" class="tr-title">Products Name</td>

                                    <td style="width:18%" class="tr-title">Price</td>

                                    <td style="width:13%" class="tr-title">Amount</td>
                                    <td style="width:8%" class="tr-title">Totalprice</td>
                                    <td class="tr-title"><a href="#">X</a></td>
                                </tr>
                                <%foreach (var item in cartlist)
                                    {%>

                                <tr class='bookInfo'>

                                    <td style="width:5%" class="tr-list">
                                        <input id="cartdeleteid" type="hidden" name="name" value="<%=item.Id %>" />
                                        
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" /></label>
                                            </div>
                                        
                                    </td>
                                    <td style="width:40%" class="tr-list">
                                        <a href="#">
                                            <img class="pull-left" alt="" src="../images/BookCovers/<%=bm.QuerySingle(new { id=item.BookId}).ISBN%>.jpg" /></a>
                                        <div class="summary blue-font"><a href="#"><%=bm.QuerySingle(new { id=item.BookId}).Title %></a></div>
                                    </td>

                                    <td style="width:12%" class="tr-list"><b class="orange-font price">$<%=Convert.ToInt32(bm.QuerySingle(new { id=item.BookId}).UnitPrice)%></b></td>

                                    <td style="width:15%" class="tr-list">
                                        <span class="ui-spinner">
                                            <input class="totalbookcount" type="number" name="demo3" value="<%=item.Count %>" aria-valuenow="0" autocomplete="off" onchange="changecount(this,<%=item.Id%>)" /><br />
                                            <span class="error">11</span>

                                        </span>
                                    </td>
                                    <td style="width:15%" class="tr-list bule-font"><span class="firsttotalmoney"></span></td>
                                    <td style="width:15%" class="tr-list bule-font"><a class="finaldeleteplace" href="javascript:void(0)" onclick="deleteItem(<%=item.Id%>,this)">X</a></td>
                                </tr>

                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-12 main-show mb10">
                    <div class="p10">
                        <div class="show-left pull-left">
                            <a href="javascript:deletepicked()"><i class="icon-main icon-fork"></i>Delete Selected Products</a>
                        </div>
                        <div class="show-right pull-right tr">
                            <div>
                                Number of Product: <b id="totalitemcount" class="orange-font"></b>
                                <br />

                            </div>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="total tr">
                        <b>Total(No charge of delivery):</b> <i id="totalitemmoney" class="orange-font f20 tit-family pr10"></i>
                    </div>
                </div>
                <div class="pull-right">
                    <a href="/_BookMain/books.aspx" class="btn btn-addcart btn-lg mr20">KEEP SHOPPING</a>
                    <a href="/_BookMain/checkout.aspx" class="btn btn-danger btn-lg mr20">Go Check Out</a>
                </div>
            </div>
            <!-- Shopping cart ends -->




            <!-- For empty Shopping cart -->
            <div id="hasnothing" class="row">
                <div class="col-lg-12">
                    <div class="cart-title f16 tit-family pl10 mt10">My Shopping cart</div>
                    <div class="cart-content p30">
                        <div class="pull-left empty-img">
                            <img alt="" src="/assets/img/empty-cart.jpg" />
                        </div>
                        <div class="pull-right empty-text tit-family">
                            No Products yet，you can<br />
                            <b class="f14">GO <i><a href="/_BookMain/books.aspx">PICK YOUR FAVORITE</a></i></b>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- empty shopping cart ends -->



    </form>
    <div id="loading" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Loading...</h4>
                </div>
                <div class="modal-body">
                    <div class="progress progress-striped active">
                        <div class="progress-bar" style="width: 100%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        $(function () {
            getcountandtotalmoney();
            checkboxfordelete();
            checkcartempty();
            $(document).ajaxStart(function () {
                $("#loading").show();
            });

            $(document).ajaxStop(function () {
                $("#loading").hide();
            });


        });
        //use .parent().parent().remove() to remove the item in the cart list after deleting these items in database

        function deleteItem(id, control) {
            $.post("ashx/EditCart.ashx", { "action": "delete", "item": id }, function (data) {
                if (data == "Yes") {
                    $(control).parent().parent().remove();
                    if ($(".bookInfo").length == 0) {
                        checkcartempty();
                        return;
                    }

                    getcountandtotalmoney();

                }

            });
        }

        //when users try to change the amount of books they want to buy, call this method
        function changecount(control, cartid) {

            var count = parseInt($(control).val());
            if (count < 1) {
                $(control).val(1);
                count = $(control).val();
            }
            else if (count > 10) {
                $(control).val(10);
                count = $(control).val();
            }

            $.post("ashx/EditCart.ashx", { "action": "change", "count": count, "cartId": cartid }, function (data) {
                if (data == "ok") {

                    getcountandtotalmoney();
                }

            });

        }
        //count the total cost
        function getcountandtotalmoney() {
            var totalmoney = 0;
            var totalcount = 0;
            $(".bookInfo").each(function () {
                var price = $(this).find(".price").text().slice(1);
                var count = $(this).find(".totalbookcount").val();
                totalcount = totalcount + parseInt(count);
                totalmoney = totalmoney + (parseInt(price) * parseInt(count));
                $(this).find(".firsttotalmoney").text("$" + parseInt(price) * parseInt(count));
            });
            $("#totalitemcount").text(totalcount);
            $("#totalitemmoney").text("$" + totalmoney);
        }

        //Select all
        function checkboxfordelete() {
            $("#selectall").click(function () {  //"select all" change 
                var status = this.checked;
                if (status = this.checked) {
                    $(".bookInfo").each(function () { //iterate all listed checkbox items
                        $(this).find('input[type=checkbox]').prop('checked', true); //change ".checkbox" checked status
                    });
                }
                else {
                    $(".bookInfo").each(function () { //iterate all listed checkbox items
                        $(this).find('input[type=checkbox]').prop('checked', false); //change ".checkbox" checked status
                    });
                }


            });


        }
        //delete all selected items
        function deletepicked() {
            $(".bookInfo").each(function () { //iterate all listed checkbox items
                if ($(this).find('input[type=checkbox]').prop('checked') == true) {
                    var cartid = $(this).find('#cartdeleteid').val();
                    deleteItem(cartid, $(this).find('.finaldeleteplace'));

                }
            });

        }
        //check if the shopping cart is empty
        function checkcartempty() {
            if (!($(".bookInfo").length == 0)) {
                $("#hasnothing").hide();
                $("#hassomething").show();

            }
            else {
                $("#hassomething").hide();
                $("#hasnothing").show();
            }
        }
    </script>
</asp:Content>
