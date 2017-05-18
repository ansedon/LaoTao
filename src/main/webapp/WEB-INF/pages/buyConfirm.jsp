<%--
  Created by IntelliJ IDEA.
  User: tciisxy
  Date: 2017/5/17
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" import="java.util.*,com.model.*,java.sql.Date" pageEncoding="UTF-8" %>
<html>
<head>
    <title>BuyConfirm</title>
    <script language="JavaScript" src="/js/skill.js"></script>
    <script src="/js/skill.js"></script>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/order_c_coin.css" rel="stylesheet" type="text/css">
      
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

</head>
<body>
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="/images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
            </ul>

        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class=" banner-buying">
    <div class=" container">
        <h3><span>确认交易</span></h3>
        <div class="clearfix"></div>
        <!--initiate accordion-->

    </div>
</div>
<div class="container">
    <div class="leave">
        <h4>确认交易？（评价路线获取经验值）：</h4>
        <form action="/finishBuy/${route.rouId}" method="post">
            <textarea name="comment" placeholder="" id="comment"></textarea>
            <label class="hvr-sweep-to-right">
                <input type="submit" id="confirm" value="确认">
            </label>
        </form>
    </div>
    <br><br><br><br><br>
    <div class="clearfix"></div>
</div>

<!--//contact-->
<div class="footer">

    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="home.html">Laotao</a></h2>
            </div>
            <div class="col-md-8 footer-class">
                <p>Copyright &copy; 2016.Laotao All rights reserved.</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
</body>
</html>
