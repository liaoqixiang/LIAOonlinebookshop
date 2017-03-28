<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LeoBookShopUI.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <!-- Register part starts -->
    <div class="container" style="padding-top: 50px">
        <div class="row p30">
            <div class="col-lg-8">
                <!-- ADS -->
                <div id="focus_carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#focus_carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#focus_carousel" data-slide-to="1" class=""></li>
                        <li data-target="#focus_carousel" data-slide-to="2" class=""></li>
                      
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/assets/img/advertise/1.jpg" />
                        </div>
                        <div class="item">
                            <img src="/assets/img/advertise/2.jpg" />
                        </div>
                        <div class="item">
                            <img src="/assets/img/advertise/3.jpg" />
                        </div>
                        
                    </div>
                    <a class="left carousel-control" href="#focus_carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#focus_carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>

            </div>



            <div class="col-lg-4">
                <!-- Register form -->
                <form role="form" class="login-form f14">
                    <div class="form-group">
                        <label for="username">Email/UserAccount</label>
                        <span id="errorusername" style="color: red"></span>
                        <input type="text" class="form-control" id="username" placeholder="Email/UserAccount">
                    </div>
                    <div class="form-group">
                        <label for="password">PassWord</label>
                        <input type="password" class="form-control" id="password" placeholder="PassWord">
                    </div>
                    <div class="form-group">
                        <label for="confirm">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm" placeholder="Confirm Password">
                    </div>
                    <div class="form-group">
                        <label for="vcode">Validate Code</label>
                        <span id="errorvcode" style="color: red"></span>
                        <div class="input-group">
                            <input type="text" class="form-control" id="vcode" placeholder="Validate Code">
                            <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                                <img id="vcode_img" src="/Account/Registerashx/vcode.ashx" data-src="/Account/Registerashx/vcode.ashx" width="100" height="32" alt="Validate Code" title="Click to change Validate Code">
                            </span>
                        </div>
                    </div>

                    <button id="SubmitForm" type="button" class="btn btn-danger btn-block f16">Register</button>
                    <span id="errorfinal"></span>
                    <span id="errorfinal1" style="display: none"><a class="btn btn-danger" href="../HomePage/Home.html">Home</a></span>
                </form>
                <!-- register form ends -->
            </div>
        </div>
    </div>
    <!-- register part ends -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(function () {
            checkregister("#username", "#errorusername", "username");
            checkregister("#vcode", "#errorvcode", "vcode");
        })
        $("#vcode_img").click(function () {
            $(this).attr('src', $(this).data('src') + '?' + Math.random());
        });


        $("#SubmitForm").click(function () {
            var uservalue = checkregister("#username", "#errorusername", "username");
            var vcodevalue = checkregister("#vcode", "#errorvcode", "vcode")

            if (checkregister("#username", "#errorusername", "username") && checkregister("#vcode", "#errorvcode", "vcode")) {
                var username = $("#username").val();
                var vcode = $("#vcode").val();
                var password = $("#confirm").val();
                $.post("/Account/Registerashx/CheckUser.ashx", { "action": "finalcheck", "username": username, "vcode": vcode, "pass": password }, function (data) {
                    if (data == "well") {
                        $("#errorfinal").text("Register successfully");
                        redirectimeout(5);
                    }

                });
            }
            else {
                $("#errorfinal").text("Register Failed");
                check("#errorfinal");
            }

        });
        function check(name) {
            setTimeout(function () {
                $(name).text('');

            }, 2000)
        }
        function checkregister(name, errorname, value) {
           var issuccess = false;
            $(name).blur(function () {
                var type = $(name).val();

                if (type == "") {
                    $(errorname).text("(!!!! " + value + " cannot be empty!!!!)");
                    check(errorname);

                }
                else {
                    $.post("/Account/Registerashx/CheckUser.ashx", { "action": value, "checktype": type }, function (data) {
                        if (data == "no") {
                            if (errorname == "#errorvcode") {
                                $(errorname).text(value + " is wrong");
                            }
                            else {
                                $(errorname).text(value + " already exists");
                            }


                            check(errorname);
                        }
                        else {
                            $(errorname).text("Good");

                        }


                    });
                }


            });
            if ($(errorname).text() == "Good") {
                issuccess = true;
            }
            return issuccess;
        }
        function redirectimeout(seconds) {

            setTimeout(function () {
                if (seconds >= 0) {
                    $("#errorfinal").text("you have " + seconds + " seconds to a home page");
                    $("#errorfinal1").css("display", "block");
                    seconds = seconds - 1;
                    redirectimeout(seconds);
                }
                else {
                    location.href = "../HomePage/Home.html";
                }
            }, 1000)
        }
    </script>
</asp:Content>
