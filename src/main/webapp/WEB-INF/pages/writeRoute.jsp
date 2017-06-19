<%@ page import="com.model.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Write</title>
    <%
        String account = "login";
        int userId=-1;
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            userId=user.getUserId();
        }
    %>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/js/skill.js"></script>
    <link href="/css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jNotify.jquery.js" type="text/javascript"></script>

    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>

    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>

    <link href="/css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
<!-- 使用ue -->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="<%=account%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
            </ul>

        </div>

    </div>
</div>
<!--//-->
<div class=" banner-buying">
    <div class=" container">
        <h3><span>写路线</span></h3>

    </div>
</div>
<!--//header-->
<!--contact-->
<div class="login-right">
    <div class="container">
        <div class="leave">
            <div class="price-grid">
                <div class="col-sm-3 col-sm-offset-1 price-top" >
                    <h4>省份</h4><input id="rouAddrProvince" type="text" name="rouAddrProvince">
                </div>
                <div class="col-sm-3 col-sm-offset-1 price-top">
                    <h4>城市</h4><input id="rouAddrCity" type="text" name="rouAddrCity">
                </div>
                <div class="col-sm-3 col-sm-offset-1 price-top">
                    <h4>县/区</h4><input id="rouAddrStreet" type="text" name="rouAddrStreet">
                </div>
                <div class="clearfix"></div>
            </div>
            <br/><br/><br/>

            <ul class="loan-col1">
                <li><p>价格：
                    <input id="rouPrice" type="text" name="rouPrice" placeholder="请在这里输入饭团个数(整数）" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))" required></p></li>
                <li>
                    <p>标题：
                        <input id="rouTitle" type="text" name="rouTitle" placeholder="请在这里输入路线标题" required></p></li>
            </ul>
            <br/>
            <br/>
            <textarea name="content" id="editor" style="width:1024px;height:500px;" placeholder="这里写你的美食帖"></textarea>
            <script type="text/javascript">
                var editor = UE.getEditor('editor');
            </script>
            <br/>
            <label class="hvr-sweep-to-right">
                <input id="submit" type="submit" value="发表路线" onclick="writeRoute(<%=userId%>)">
            </label>
        </div>

    </div>
</div>
</body>
</html>

