<%@ page import="com.model.UserEntity" %>
<%@ page isELIgnored="false" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>withdraw</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <script src="js/skill.js"></script>
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link href="css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="js/jNotify.jquery.js" type="text/javascript"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/order_c_coin.css" rel="stylesheet" type="text/css">
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
    <%
        String account = "login";
        String index = "login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            index = "myPage";
        }
    %>
</head>
<body>

<div class="header">
    <div class="container">
        <a href="/"><img src="images/title.jpg" width="130"></a>
        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="/city"><i class="glyphicon glyphicon-user"> </i>City </a></li>
                <li><a href="<%=index%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//-->
<div class=" banner-buying">
    <div class=" container">
        <h3><span>饭团提现</span></h3>
        <div class="clearfix"></div>

    </div>
</div>
<div class="login-right">
    <div class="container">
        <div class="coin_c">
            <div class="coin_c_c">
                <div class="coin_desc">
                    <span>饭团是Laotao平台奖励和充值获得的虚拟积分，可用来购买路线或提现。</span>
                </div>
                <ul class="coin_c_list">
                    <li style="height: 1px; line-height:40px;margin-bottom:15px;margin-top:15px;padding-top: 20px; padding-left: 20px;  font-size:28px;border-top: solid 1px #f0f0f0;">
                        <label></label></li>


                    <li><label>您当前的饭团个数：&nbsp;</label><span><i id="originMoney">${user.userMoney}</i></span></li>

                    <input type="hidden" name="type" value="withdraw">

                    <li>
                        <label>请输入提现个数： &nbsp;</label><span><p> <input id="money" type="text" name="value"
                                                                       placeholder="不能超过当前饭团个数"
                                                                       onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"></p></span>
                    </li>
                    <li class="pay_way">
                        <label>提现账户： &nbsp;</label>
                        <span>

                       <input name="payway" checked type="radio" value="支付宝"/>
                                                             支付宝   
                       <input name="payway" type="radio" value="微信"/>
                                                               微信   
                       <input name="payway" type="radio" value="网银"/>
                                                              网银 
           											 																						    </span>
                    </li>
                    <li>
                        <label>账号： &nbsp;</label><span><p> <input id="account" type="text" name="account" placeholder=""
                    ></p></span>
                    </li>
                    <li style="height: auto;">
                        <label> &nbsp;</label>
                        <a onclick="withdraw(${user.userMoney})" class="hvr-sweep-to-right more">提现</a>
                    </li>
                </ul>

            </div>
        </div>

    </div>
</div>

<%--<script type="text/javascript">--%>
<%--function aa(a, b, c) {--%>
<%--//document.form1.img.value = a;  --%>
<%--if (a == 1) {--%>
<%--document.getElementById("selectedinput").value = "ZFB";--%>
<%--}--%>
<%--else if (a == 2) {--%>
<%--document.getElementById("selectedinput").value = "WYZX";--%>
<%--}--%>
<%--document.getElementById("ZFMethods").getElementsByTagName("img")[a - 1].className = "on";--%>
<%--document.getElementById("ZFMethods").getElementsByTagName("img")[b - 1].className = "off";--%>
<%--document.getElementById("ZFMethods").getElementsByTagName("img")[c - 1].className = "off";--%>
<%--}--%>

<%--</script>--%>
 
<!--//contact-->
<!--footer-->
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
<!--//footer-->
</body>
</html>