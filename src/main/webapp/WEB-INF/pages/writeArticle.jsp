<%@ page import="com.model.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Write</title>
    <%
        String account = "login";
        int userId = -1;
        String index="login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            userId = user.getUserId();
            index="/myPage";
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
        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="<%=index%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
            </ul>
        </div>
    </div>
</div>
<!--//-->
<div class=" banner-buying">
    <div class=" container">
        <h3><span>写食荐</span></h3>
    </div>
</div>
<!--//header-->
<!--contact-->


<br/> <br/>
<div class="blog">
    <div class="container">
        <h3>撰写美食帖</h3>
    </div>
</div>

<div class="login-right">
    <div class="container">
        <div class="leave">
            <div class="price-grid" style="padding-bottom: 0px">
                <div class="col-sm-3 price-top" style="margin-left: 60px">
                    <h4>省份</h4><input id="artAddrProvince" type="text" name="artAddrProvince">
                </div>
                <div class="col-sm-3 col-sm-offset-1 price-top">
                    <h4>城市</h4><input id="artAddrCity" type="text" name="artAddrCity">
                </div>
                <div class="col-sm-3 col-sm-offset-1 price-top">
                    <h4>县/区</h4><input id="artAddrStreet" type="text" name="artAddrStreet">
                </div>
                <div class="clearfix"></div>
            </div>


            <ul class="loan-col1" style="margin-left:7%">
                <li><input id="artTitle" type="text" name="art_title" placeholder="请在这里输入标题" required></li>
            </ul>
            <br/>

            <textarea name="content" id="editor" style="width:1000px;height:500px;margin-left:7%"></textarea>
            <script type="text/javascript">
                var editor = UE.getEditor('editor');
            </script>
            <br/>
            <label class="hvr-sweep-to-right" style="margin-left:7%">
                <input type="submit" value="发表文章" onclick="writeArticle(<%=userId%>)">
            </label>
        </div>
    </div>
</div>
</body>
</html>

