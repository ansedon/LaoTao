<%@ page isELIgnored="false" import="com.model.UserEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tciisxy
  Date: 2017/5/16
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Route_Single</title>
    <%
        String account = "login";
        String index = "../login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            index = "../myPage";
        }
    %>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery/ (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
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
    <meta name="keywords" content="Real Home  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
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
                <li><a href="<%=index%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
                <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i
                        class="glyphicon glyphicon-search"> </i> 搜索</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <!---pop-up-box---->

        <link href="/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="/js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->
        <div id="small-dialog" class="mfp-hide">
            <!----- tabs-box ---->
            <div class="sap_tabs">
                <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                    <ul class="resp-tabs-list">
                        <li class="resp-tab-item " aria-controls="tab_item-0" role="tab"><span>全部</span></li>
                        <div class="clearfix"></div>
                    </ul>
                    <div class="resp-tabs-container">
                        <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span
                                class="resp-arrow"></span>全部</h2>
                        <div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0"
                             style="display:block">
                            <div class="facts">
                                <div class="login">
                                    <form action="/search" method="get">
                                        <input type="text" name="key" class="glyphicon-phone" onFocus="this.value = '';"
                                               onBlur="if (this.value == '') {this.value = '搜美食/餐馆/路线等等';}"
                                               value="搜美食/餐馆/路线等等">
                                        <input type="submit" value="">
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $('.popup-with-zoom-anim').magnificPopup({
                            type: 'inline',
                            fixedContentPos: false,
                            fixedBgPos: true,
                            overflowY: 'auto',
                            closeBtnInside: true,
                            preloader: false,
                            midClick: true,
                            removalDelay: 300,
                            mainClass: 'my-mfp-zoom-in'
                        });

                    });
                </script>


            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<!--//header-->
<!--blog-->
<div class="blog">
    <div class="container">
        <div class="col-md-9 blog-head">
            <div class="blog-top">

                <h4>${route.rouTitle}</h4>
                <h5>Posted By : ${route.userByRouUserId.userName}(level ${route.userByRouUserId.userLevel})</a> | Date
                    : ${route.rouPostTime}</h5>
                <p>${route.rouContent}</p>

            </div>
            <!---->
            <div class="single-grid">
                <h5>&nbsp;</h5>
                <h5>路线评论：</h5>
                <c:forEach items="${comment}" var="com">
                    <c:if test="${com.rouComment!=null}">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="/images/av.png" alt=""/>
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${com.userByTradeUserId.userName}</h4>
                                <p>${com.rouComment}</p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <!---->

        </div>

        <div class="col-md-5 blog-sidebar">
            <div class="blog-list">
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <a><img src="/${route.rouTitlePic}" class="img-responsive zoom-img" alt=""></a>
                        <div class="col-md1">
                            <h4>价格：${route.rouPrice}饭团</h4>
                            <c:if test="${!IfPoster}">
                                <c:if test="<%=user!=null%>">
                                    <c:if test='${IfBought}'>
                                        <h4>您已购买</h4>
                                    </c:if>
                                    <c:if test="${!IfBought}">
                                        <a class="hvr-sweep-to-right more" href="/buyRoute/${route.rouId}">购买路线</a>
                                    </c:if>
                                </c:if>
                                <c:if test="<%=user==null%>">
                                        <a class="hvr-sweep-to-right more" href="/login">购买路线</a>
                                </c:if>
                            </c:if>


                            <div class="clearfix"></div>
                        </div>
                    </div>


                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--//blog-->
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