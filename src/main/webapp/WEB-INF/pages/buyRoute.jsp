<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>buyRoute</title>

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
        <h3><span>购买路线</span></h3>
        <div class="clearfix"></div>
        <!--initiate accordion-->
    </div>
</div>
<div class="container">
    <div class="coin_c">
        <div class="coin_c_c">
            <ul class="coin_c_list">
                <li>
                    <label>您当前的饭团个数：&nbsp;</label><span><p>${user.userMoney}</p></span>
                </li>
                <li>
                    <label>所需饭团个数： &nbsp;</label><span id="show_c_num"><p>${route.rouPrice}</p></span>
                </li>
                <li style="height: auto;">
                    <label> &nbsp;</label>
                    <c:if test="${user.userMoney < route.rouPrice}">
                        <a href="recharge.jsp" class="hvr-sweep-to-right more">去充值</a>
                    </c:if>
                    <c:if test="${user.userMoney >= route.rouPrice}">
                        <a href="/buyConfirm/${route.rouId}" class="hvr-sweep-to-right more">确认购买</a>
                    </c:if>
                </li>
                <li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!--//contact-->
<div class="footer">

    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="/">Laotao</a></h2>
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