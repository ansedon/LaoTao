<%--
  Created by IntelliJ IDEA.
  User: tciisxy
  Date: 2017/5/7
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>View Article</title>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Real Home  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

</head>
<body>
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="Home"><img src="/images/title_fanfo.jpg" width="130" ></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a  href="city"><i class="glyphicon glyphicon-user"> </i>City </a></li>
                <li><a  href="Login"><i class="glyphicon glyphicon-user"> </i>Login</a></li>
                <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a></li>
            </ul>
        </div>
        <div class="clearfix"> </div>
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
                        <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>全部</h2><div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
                        <div class="facts">
                            <div class="login">
                                <form action="SearchServlet" method="post">
                                    <input type="text" name="key" class="glyphicon-phone" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '搜美食/餐馆/路线等等';}" value="搜美食/餐馆/路线等等">
                                    <input type="submit" value="" >
                                </form>
                            </div>
                        </div>
                    </div>

                    </div>

                </div>
                <script>
                    $(document).ready(function() {
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
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="blog">
    <div class="container">
        <div class="col-md-9 blog-head">
            <div class="blog-top">
                <h4>${article.artTitle}</h4>
                <h5>Posted By :${article.artId}(level ) | Date : ${article.artPostTime} | Read_Num : ${article.artReadNum}</h5>
                <p>${article.artContent}</p>
            </div>
            <div class="single-grid">
                <h5>Our Comment</h5>
            <c:forEach items ="${comments}" var ="comment">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/images/av.png" alt="" />
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">${comment.commentatorId}</h4>
                        <p>${comment.artComContent}</p>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
    <div class="col-md-5 blog-sidebar">
        <div class="blog-list">
            <h4> 提及的餐馆：</h4>
            <%
                List<Restaurant> res = (List)session.getAttribute("Restaurant");
                for(int i = 0;i < 4 && i<res.size();i++) {
                    Restaurant p = res.get(i);%>
            <div class="col-md-3 project-grid">
                <div class="project-grid-top">
                    <a><img src=<%=p.getRes_pic() %> class="img-responsive zoom-img" alt=""></a>
                    <div class="col-md1">
                        <div class="col-md2">
                            <div class="col-md3">
                                <span class="star"><%=p.getRes_score() %></span>
                            </div>
                            <div class="col-md4">
                                <strong><%=p.getRes_name() %></strong>
                                <small><%=p.getRes_refer_num() %>次推荐</small>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <p>地址：<%=p.getRes_addr_city() %><%=p.getRes_addr_street() %></p>
                        <p>类别：<%=p.getRes_style() %></p>
                        <p class="cost">人均：¥<%=p.getRes_average_cost() %></p>

                        <a href="RestaurantOP?method=collectRes&resId=<%=p.getRes_id() %>&href=HomePage.jsp" class="hvr-sweep-to-right more">想吃</a>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
</div>
<div class="footer">
    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="Home">Laotao</a></h2>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
</body>
</html>
