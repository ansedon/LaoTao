<%--
  Created by IntelliJ IDEA.
  User: tciisxy
  Date: 2017/5/7
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" import="com.model.UserEntity,java.sql.Date" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>View Article</title>
    <%
        String userName = "";
        String account = "login";
        String index = "../login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            userName = user.getUserName();
            account = user.getUserName();
            index = "../myPage";
        }
    %>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <link href="/css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jNotify.jquery.js" type="text/javascript"></script>
    <script src="/js/skill.js"></script>
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
                <li><a href="../city"><i class="glyphicon glyphicon-user"> </i>City </a></li>
                <li><a href="<%=index%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
                <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i
                        class="glyphicon glyphicon-search"> </i> </a></li>
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
<div class="blog">
    <div class="container">
        <div class="col-md-9 blog-head">
            <div class="blog-top">
                <h4>${article.artTitle}</h4>
                <h5>Posted By :${article.userByArtUserId.userName}(level:${article.userByArtUserId.userLevel}) | Date
                    : ${article.artPostTime} | Read_Num : ${article.artReadNum}</h5>
                <p>${article.artContent}</p>
                <div class="links">
                    <ul class="blog-links">
                        <c:if test="${ifLike}">
                            <li><i class="glyphicon glyphicon-heart"></i><span id="finishAgree"
                                                                               onclick="artAgree(${article.artId})">已赞</span>
                            </li>
                        </c:if>
                        <c:if test="${!ifLike}">
                            <li><i class="glyphicon glyphicon-heart"></i><span id="agree"
                                                                               onclick="artAgree(${article.artId})">赞</span>
                            </li>
                        </c:if>
                        <c:if test="${ifCollected}">
                            <li><i class="blog_circle"></i><span id="finishCollect"
                                                                 onclick="artCollect(${article.artId})">已收藏</span></li>
                        </c:if>
                        <c:if test="${!ifCollected}">
                            <li><i class="blog_circle"></i><span id="collect"
                                                                 onclick="artCollect(${article.artId})">收藏</span></li>
                        </c:if>
                        <c:if test="${ifReport}">
                            <li><i class="blog_circle"></i><span id="finishReport"
                                                                 onclick="artReport(${article.artId})">已举报</span></li>
                        </c:if>
                        <c:if test="${!ifReport}">
                            <li><i class="blog_circle"></i><span id="report"
                                                                 onclick="artReport(${article.artId})">举报</span></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="single-grid">
                <h5>Our Comment</h5>
                <c:forEach items="${comList}" var="comment">
                    <div class="media">
                        <div class="media-left">
                            <a href="javascript:void (0);">
                                <img class="media-object" src="/images/av.png" alt=""/>
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">${comment.userByCommentatorId.userName}&nbsp<small>${comment.artComTime}</small></h4>
                            <p>${comment.artComContent}</p>
                        </div>
                    </div>
                </c:forEach>
                <div id="loadData" class="media">
                </div>
            </div>
            <div id="comBox" class="leave">
                <c:if test="${!ifComment}">
                    <h5>Leave a Comment</h5>
                    <textarea id="comment" name="comment" placeholder="comment" required></textarea>
                    <label class="hvr-sweep-to-right">
                        <input type="submit" value="Post Comment"
                               onclick="artComment('<%=userName%>',${article.artId})">
                    </label>
                </c:if>
                <c:if test="${ifComment}">
                    <h5>已评论过</h5>
                </c:if>
            </div>
        </div>
        <div class="col-md-5 blog-sidebar">
            <div class="blog-list">
                <c:if test="${restaurant.size()!=0}">
                    <h4> 提及的餐馆：</h4>
                    <c:forEach items="${restaurant}" var="res">
                        <div class="col-md-3 project-grid">
                            <div class="project-grid-top">
                                <a href="/resPage?resId=${res.resId}"><img src="/${res.resPic}" class="img-responsive zoom-img" alt=""></a>
                                <div class="col-md1">
                                    <div class="col-md2">
                                        <div class="col-md3">
                                            <span class="star">${res.resScore}</span>
                                        </div>
                                        <div class="col-md4">
                                            <strong>${res.resName}</strong>
                                            <small>${res.resReferNum}次推荐</small>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <p>地址：${res.resAddrCity}${res.resAddrStreet}</p>
                                    <p>类别：${res.resStyle}</p>
                                    <p class="cost">人均：¥${res.resAverageCost}</p>
                                    <a onclick="resCollect(${res.resId})" class="hvr-sweep-to-right more">想吃</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="/">Laotao</a></h2>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
</body>
</html>
