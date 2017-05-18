<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <script language="javascript" src="js/skill.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Real Home  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function()
    { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); }
    </script>
</head>
<body>

<!--header-->

<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="images/title.jpg" width="130" ></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
            </ul>
        </div>
    </div>
</div>
<!--//-->
<div class=" banner-buying">
    <div class=" container">
        <h3><span>Regis</span>ter</h3>
        <!---->
        <div class="clearfix"> </div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {
                var menu_ul = $('.menu > li > ul'),
                    menu_a  = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function(e) {
                    e.preventDefault();
                    if(!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true,true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true,true).slideUp('normal');
                    }
                });

            });
        </script>
    </div>
</div>
<!--//header-->
<!--contact-->

<div class="login-right">
    <div class="container">
        <h3>Register</h3>
        <div class="login-top">
            <div id="tip" style=" border:0px ;text-align:center"></div>
            <div class="form-info">
                    <input type="text" id="userName"  placeholder="Name" required="required" name="username" >
                    <input type="text"  id="phone" placeholder="Phone number" required="required" name="phone" >
                    <input type="text"  id="bCity" placeholder="birth city" required="required" name="bCity" >
                    <input type="text"  id="lCity" placeholder="live city" required="required" name="lCity">
                    <input type="password" id="password" placeholder="password " required="required" name="password">
                    <input type="password" id="pw" placeholder="password again " required="required" name="pw2">
                    <label class="hvr-sweep-to-right">
                        <input type="submit" value="Sign Up" id="submit" onclick="register()">
                    </label>
                <p>Already have a Fanfo account? <a href="/login">Login</a></p>
            </div>
        </div>
    </div>
</div>
<!--//contact-->
<!--footer-->
<div class="footer">
    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="Home">Fanfo</a></h2>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//footer-->
</body>
</html>