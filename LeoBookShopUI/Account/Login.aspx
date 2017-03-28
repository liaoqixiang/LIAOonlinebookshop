<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LeoBookShopUI.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container" style="padding-top: 50px">
        <!-- Login starts -->
        <div class="row p30">
            <div class="col-lg-8">
                <!-- ADS -->
              
                <img style="width:90%" alt="" src="/assets/img/coupon.jpg" />
            </div>
            <div class="col-lg-4">
                <!-- Login Form -->
                <form role="form" class="login-form f14" runat="server">
                    <div class="form-group">
                        <label for="username">Email/UserAccount</label>
                        <input type="text" class="form-control" name="username" placeholder="Email/UserAccount" />

                    </div>
                    <div class="form-group">
                        <label for="password">PassWord</label>
                        <input type="password" class="form-control" name="password" placeholder="PassWord" />
                    </div>

                    <div class="form-group">
                        <label for="vcode">validateCode</label>
                        <span id="errorvcode" style="color: red"></span>
                        <div class="input-group">
                            <input name="validatecode" type="text" class="form-control" id="vcode" placeholder="Validate Code" />
                            <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                                <img id="vcode_img" src="/Account/Registerashx/vcode.ashx" data-src="/Account/Registerashx/vcode.ashx" width="100" height="32" alt="Validate Code" title="Click to change Validate Code" />
                            </span>
                        </div>
                    </div>
                    <div class="checkbox f12">
                        <label>
                            <input type="checkbox" name="checkboxcookie" />Remember me</label>
                        <span class="pull-right"><a href="findme.aspx">Forget PassWord?</a>&nbsp;<a href="register.aspx">EASY Register</a></span>
                    </div>
                    <button type="submit" formmethod="post" id="signinbtn" class="btn btn-danger btn-block f16">Sign In</button>
                    <span id="Loginmsg"><%=Msg %></span>

                </form>
                <!-- Login Form ends -->
            </div>
        </div>
    </div>

    <!-- Login Ends -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        checkregister("#vcode", "#errorvcode", "vcode");
        function checkregister(name, errorname, value) {

            $(name).blur(function () {
                var type = $(name).val();

                if (type == "") {
                    $(errorname).text("(!!!! " + value + " cannot be empty!!!!)");
                    check(errorname);
                    return;
                }
                else {
                    $.post("/Account/Registerashx/CheckUser.ashx", { "action": value, "checktype": type }, function (data) {
                        if (data == "no") {
                            $(errorname).text(value + " is wrong");
                            check(errorname);
                            return;
                        }
                        else {
                            $(errorname).text("Good");

                        }
                    });
                }
            });
        }
        function check(name) {
            setTimeout(function () {
                $(name).text('');

            }, 2000)
        }
        $("#vcode_img").click(function () {
            $(this).attr('src', $(this).data('src') + '?' + Math.random());
        });

    </script>
</asp:Content>

