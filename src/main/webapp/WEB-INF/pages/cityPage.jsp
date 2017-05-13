<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/5/13
  Time: 下午3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>City</title>

    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <script src="/jQueryAssets/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <style type="text/css">
        @import url("/css/mfw-place.css");
        @import url("/css/city_css_69a039e8b84ca46d4a57c054a5cb5e53.css");
    </style>
    <style type="text/css">
        body,td,th {
            font-family: "微软雅黑";
        }
        .art_container {
            position: relative;
        }
        .art_container {
            height: 300px;
            width: 100%;
            margin-top: 30px;
            margin-right: 10px;
            margin-bottom: 70px;
            margin-left: 10px;
        }
        .art_content {
            font-family: "微软雅黑";
            margin-top: 10px;
            margin-left: 10px;
            margin-right: 0px;
            float: right;
            height: 300px;
            width: 550px;
        }
        .art_picture {
            float: left;
            height: 300px;
            width: 500px;
            margin-bottom: 10px;
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 10px;
            padding: 10px;
        }
    </style>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script type="text/javascript" src="/js/switch.js"></script>

</head>
<body>

<div class="header">
    <div class="container">
        <!--logo-->
        <a href=""><img src="/images/title_Laotao.jpg" width="130" ></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a  href="/Home"><i class="glyphicon glyphicon-user"> </i></a></li>
                <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a></li>

            </ul>
        </div>
        <div class="clearfix"> </div>
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
<!--//-->

<div class=" banner-buying">
    <div class=" container">
        <h3><span><c:out value="${city}" />美食</span></h3>
    </div>
</div>
<!---content---->
<div class="plcContainer">
    <div class="qyWrap" id="qy">
        <ul class="plcHotPlaceTags fontYaHei">
            <li class="current" data-bn-ipg="place-city-poitab-hot"><span>餐馆</span></li>
            <li  class="" data-bn-ipg="place-city-poitab-sight"><span>路线</span></li>
            <li class="" data-bn-ipg="place-city-poitab-food"><span>最热荐文</span></li>
            <li class="" data-bn-ipg="place-city-poitab-shopping"><span>最新荐文</span></li>
        </ul>
        <div class="plcHotPlaceContent" style="display: block;">
            <div class="project-top">
                <c:forEach items="${restaurantList}" var="restaurant">
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <a><img src="${restaurant.resPic}" class="img-responsive zoom-img" alt=""/></a>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> <strong>${restaurant.resScore}</strong></span>
                                </div>
                                <div class="col-md4">
                                    <strong>${restaurant.resName}</strong>
                                    <small>${restaurant.resReferNum}次推荐</small>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                            <p>地址：${restaurant.resAddrCity}${restaurant.resAddrStreet}</p>
                            <p>类别：${restaurant.resStyle}</p>
                            <p class="cost">人均：¥${restaurant.resAverageCost}</p>
                            <a href="RestaurantOP?method=collectRes&resId=${restaurant.resId}&href=cityPage.jsp?page1=1&city=${city}" class="hvr-sweep-to-right more">想吃</a>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
            <div class="clearfix"> </div>
            <nav>
                <ul class="pagination">
                </ul>
            </nav>
        </div>
        <div class="plcHotPlaceContent" style="display: none;">
            <div class="project-top">
                <c:forEach items="${routeList}" var="route">
                <div class="col-md-4 box_2">
                    <div class="project-fur">
                        <a href="ReadRouteServlet?route_id=${route.rouId}" class="mask">
                            <img class="img-responsive zoom-img" src=${route.rouTitlePic} alt="">
                            <span class="four">${route.rouPrice}</span>
                        </a>
                        <div class="most-1">
                            <h5><a href="ReadRouteServlet?route_id=${route.rouId}"><${route.rouTitle}</a></h5>
                            <p>by ${route.rouUserId}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="clearfix"> </div>
                <nav>
                    <ul class="pagination">

                    </ul>
                </nav>
            </div>
        </div>
        <div class="plcHotPlaceContent" style="display: none;">
            <div class="project-top">
                <c:forEach items ="${hotArticles}" var="hotArt">
                <div class="art_container">
                    <div class="art_picture">
                        <a href="ReadServlet?art_id=${hotArt.artId}"><img src="${hotArt.artTitlePic}" class="img-responsive" alt=""/></a>
                    </div>
                    <div class="art_content">
                        <div class="blog-top">
                            <h4><a href="ReadServlet?art_id=${hotArt.artId}">${hotArt.artTitle}</a></h4>
                            <h5>Posted By :${hotArt.artUserId}</a> | Date :${hotArt.artPostTime}</h5>
                            <h5>阅读量：${hotArt.artReadNum}</h5>
                            <a class="hvr-sweep-to-right more" href="ReadServlet?art_id=${hotArt.artId}">Read More</a>
                            <div class="links">
                                <ul class="blog-links">
                                    <li><a href="#"><i class="glyphicon glyphicon-heart"></i><span>${hotArt.artAgreeNum}</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                    </c:forEach>


                <div class="clearfix"> </div></div></div>
        <div class="plcHotPlaceContent" style="display: none;">
            <div class="project-top">
               <c:forEach items ="${newArticles}" var="newArt">
                <div class="art_container">
                    <div class="art_picture">
                        <a href="ReadServlet?art_id=${newArt.artId}"><img src="${newArt.artTitlePic}" class="img-responsive" alt=""/></a>
                    </div>
                    <div class="art_content">
                        <div class="blog-top">
                            <h4><a href="ReadServlet?art_id=${newArt.artId}>">${newArt.artTitle}</a></h4>
                            <h5>Posted By : ${newArt.artUserId}</a> | Date : ${newArt.artPostTime}</h5>
                            <h5>阅读量：${newArt.artReadNum}</h5>
                            <a class="hvr-sweep-to-right more" href="ReadServlet?art_id=${newArt.artId}">Read More</a>
                            <div class="links">
                                <ul class="blog-links">
                                    <li><a href="#"><i class="glyphicon glyphicon-heart"></i><span>${newArt.artAgreeNum}</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>


                <div class="clearfix"> </div>
                <nav>
                    <ul class="pagination">

                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>


</body>
</html>