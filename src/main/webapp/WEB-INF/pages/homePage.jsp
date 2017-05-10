<%--
  Created by IntelliJ IDEA.
  User: ansedon
  Date: 2017/4/26
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>LaoTao</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- slide -->
    <script src="/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
</head>
<body>
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="Home.servlet"><img src="images/title_fanfo.jpg" width="130"></a>
        <!--//logo-->

        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="city"><i class="glyphicon glyphicon-user"> </i>City </a></li>
                <li><a href="Login"><i class="glyphicon glyphicon-user"> </i>Login</a></li>
                <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i
                        class="glyphicon glyphicon-search"> </i> </a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <!---pop-up-box---->

        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
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
                                    <form action="SearchServlet" method="post">
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
<!--//-->
<div class=" header-right">
    <div class=" banner">
        <div class="slider">
            <div class="callbacks_container">
                <ul class="rslides" id="slider">
                    <li>
                        <div class="banner1">
                            <div class="caption">
                                <h3><span>老</span><span style="font-family: '方正小标宋简体'">饕</span></h3>
                                <p>真正的城市美味，藏在大街小巷，藏在老饕心里</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner2">
                            <div class="caption">
                                <h3><span>老</span><span style="font-family: '方正小标宋简体'">饕</span></h3>
                                <p>真正的城市美味，藏在大街小巷，藏在老饕心里</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner3">
                            <div class="caption">
                                <h3><span>老</span><span style="font-family: '方正小标宋简体'">饕</span></h3>
                                <p>真正的城市美味，藏在大街小巷，藏在老饕心里</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="blog">
    <div class="container">
        <div class="col-md-11 blog-head">
            <h3>热门食荐</h3>
            <c:forEach items="${articles}" var="article">
                <div class="art_container">
                    <div class="art_picture">
                        <a href="/readArticle/${article.artId}"><img src="${article.artTitlePic}" class="img-responsive" alt=""/></a>
                    </div>
                    <div class="art_content">
                        <div class="blog-top">
                            <h4><a href="/readArticle/${article.artId}">${article.artTitle}</a></h4>
                            <h5>Posted By : <a href="/readArticle/${article.artId}">${article.artId}</a> | Date
                                : ${article.artPostTime}</h5>
                            <h5><a href="/readArticle/${article.artId}">阅读量：${article.artReadNum}></a></h5>
                            <a class="hvr-sweep-to-right more"
                               href="/readArticle/${article.artId}">阅读量：${article.artReadNum}>Read More</a>
                            <div class="links">
                                <ul class="blog-links">
                                    <li><a href="#"><i
                                            class="glyphicon glyphicon-heart"></i><span>${article.artAgreeNum}</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
