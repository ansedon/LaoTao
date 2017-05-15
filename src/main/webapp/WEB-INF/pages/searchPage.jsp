<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/5/13
  Time: 下午2:06
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search</title>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
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
            width: 450px;
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
<!--header-->

<!---header---->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/Home"><img src="/images/title_Laotao.jpg" width="130" ></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <!--<li><a  href=mypage><i class="glyphicon glyphicon-user"> </i>account</a></li>-->
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
                        <!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>文章</span></li>
                         <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>餐馆</span></li>-->
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
                    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#horizontalTab').easyResponsiveTabs({
                                type: 'default', //Types: default, vertical, accordion
                                width: 'auto', //auto or any width like 600px
                                fit: true   // 100% fit in a container
                            });
                        });
                    </script>
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
<!--//-->
<div class=" container">
    <div class="col-md-12">
        <h4>以下是为您找到的"<c:out value="${key}" />相关结果: </h4>
        <h2>(餐馆<c:out value="${searchRestaurants.size()}" /> 家，路线<c:out value="${searchArticles.size()}" />条，食荐<c:out value="${searchRoutes.size()}" />篇)</h2>
        <div class="clearfix"> </div>
        <!--initiate accordion-->
    </div>
</div>

<!---content---->
<div class="plcContainer">
    <div class="qyWrap" id="qy">
        <ul class="plcHotPlaceTags fontYaHei">
            <li class="current" data-bn-ipg="place-city-poitab-hot"><span>餐馆</span></li>


            <li  class="" data-bn-ipg="place-city-poitab-sight"><span>路线</span></li>

            <li class="" data-bn-ipg="place-city-poitab-food"><span>食荐</span></li>


        </ul>
        <div class="plcHotPlaceContent" style="display: block;">
            <div class="project-top">
                <c:forEach items="${searchRestaurants}" var="res">
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <a><img src=${res.resPic} class="img-responsive zoom-img" alt=""/></a>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> <strong>${res.resScore}</strong></span>
                                </div>
                                <div class="col-md4">
                                    <strong>${res.resName}</strong>
                                    <small>${res.resReferNum}次推荐</small>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                            <p>地址：${res.resAddrCity}${res.resAddrStreet}</p>
                            <p>类别：${res.resStyle}</p>
                            <p class="cost">人均：¥${res.resAverageCost}</p>
                            <a href="RestaurantOP?method=collectRes&resId=${res.resId}&href=SearchPage.jsp" class="hvr-sweep-to-right more">想吃</a>
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
                <c:forEach items="${searchRoutes}" var="rou">
                <div class="col-md-4 box_2">
                    <div class="project-fur">
                        <a href="ReadRouteServlet?route_id=${rou.rouId}" class="mask">
                            <img class="img-responsive zoom-img" src=${rou.rouTitlePic}  alt="">
                            <span class="four">${rou.rouPrice}</span>
                        </a>
                        <div class="most-1">
                            <h5><a href="ReadRouteServlet?route_id=${rou.rouId}">${rou.rouTitle}</a></h5>
                            <p>by ${rou.userByRouUserId.userName}</p>
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

                <c:forEach items="${searchArticles}" var="art">
                <div class="art_container">
                    <div class="art_picture">
                        <a href="ReadServlet?art_id=${art.artId}>"><img src="${art.artTitlePic}" class="img-responsive" alt=""/></a>
                    </div>
                    <div class="art_content">
                        <div class="blog-top">
                            <h4><a href="ReadServlet?art_id=${art.artId}">${art.artTitle}</a></h4>
                            <h5>Posted By :${art.userByArtUserId.userName}</a> | Date : ${art.artPostTime}</h5>
                            <h5>阅读量：${art.artReadNum}</h5>
                            <a class="hvr-sweep-to-right more" href="ReadServlet?art_id=${art.artId}">Read More</a>
                            <div class="links">
                                <ul class="blog-links">
                                    <li><a href="#"><i class="glyphicon glyphicon-heart"></i><span>${art.artAgreeNum}/span></a></li>
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


<!--footer-->
<div class="footer">
    <div class="container">
        <div class="footer-top-at">
            <div class="col-md-3 amet-sed">
                <h4>Our Company</h4>
                <ul class="nav-bottom">
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="blog.html">For Sale By Owner Blog</a></li>
                    <li><a href="mobile_app.html">Mobile</a></li>
                    <li><a href="terms.html">Terms & Conditions</a></li>
                    <li><a href="privacy.html">Privacy Policy</a></li>
                    <li><a href="blog.html">Blog</a></li>

                </ul>
            </div>
            <div class="col-md-3 amet-sed ">
                <h4>Work With Us</h4>
                <ul class="nav-bottom">
                    <li><a href="single.html">Real Estate Brokers</a></li>
                    <li><a href="single.html">Business Development</a></li>
                    <li><a href="single.html">Affiliate Programs</a></li>
                    <li><a href="contact.html">Sitemap</a></li>
                    <li><a href="career.html">Careers</a></li>
                    <li><a href="feedback.html">Feedback</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed">
                <h4>Customer Support</h4>
                <p>Mon-Fri, 7AM-7PM </p>
                <p>Sat-Sun, 8AM-5PM </p>
                <p>177-869-6559</p>
                <ul class="nav-bottom">
                    <li><a href="#">Live Chat</a></li>
                    <li><a href="faqs.html">Frequently Asked Questions</a></li>
                    <li><a href="suggestion.html">Make a Suggestion</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed ">
                <h4>Property Services</h4>
                <ul class="nav-bottom">
                    <li><a href="single.html">Residential Property</a></li>
                    <li><a href="single.html">Commercial Property</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="register.html">Register</a></li>
                    <li><a href="typo.html">Short Codes</a></li>
                </ul>
                <ul class="social">
                    <li><a href="#"><i> </i></a></li>
                    <li><a href="#"><i class="gmail"> </i></a></li>
                    <li><a href="#"><i class="twitter"> </i></a></li>
                    <li><a href="#"><i class="camera"> </i></a></li>
                    <li><a href="#"><i class="dribble"> </i></a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="Home">Laotao</a></h2>
            </div>
            <div class="col-md-8 footer-class">
                <p >Copyright &copy; 2016.Laotao All rights reserved.</p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<!--//footer-->


</body>
</html>