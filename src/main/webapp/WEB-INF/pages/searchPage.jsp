<%@ page import="com.model.UserEntity" %><%--
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
    <title>Search</title>
    <%
        String account = "login";
        String index = "../login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            index = "../myPage";
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/skill.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/myStyle.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/jNotify.jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jNotify.jquery.css"/>
    <style type="text/css">
        @import url("/css/mfw-place.css");
        @import url("/css/city_css_69a039e8b84ca46d4a57c054a5cb5e53.css");
    </style>

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
    <script type="text/javascript" src="/js/switch.js"></script>
</head>
<body>
<!--header-->

<!---header---->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="../"><img src="images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a href=<%=index%>><i class="glyphicon glyphicon-user"> </i><%=account%>
                </a></li>
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
                        <!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>文章</span></li>
                         <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>餐馆</span></li>-->
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
<!--//-->
<div class=" container">
    <div class="col-md-12">
        <h4>以下是为您找到的"<c:out value="${key}"/>"相关结果: </h4>
        <h2>(餐馆<c:out value="${searchRestaurants.size()}"/> 家，路线<c:out value="${searchRoutes.size()}"/>条，食荐<c:out
                value="${searchArticles.size()}"/>篇)</h2>
        <div class="clearfix"></div>
        <!--initiate accordion-->
    </div>
</div>

<!---content---->
<div class="plcContainer">
    <div class="qyWrap" id="qy">
        <ul class="plcHotPlaceTags fontYaHei">
            <li class="current" data-bn-ipg="place-city-poitab-hot"><span>餐馆</span></li>
            <li class="" data-bn-ipg="place-city-poitab-sight"><span>路线</span></li>
            <li class="" data-bn-ipg="place-city-poitab-food"><span>食荐</span></li>
        </ul>
        <div class="plcHotPlaceContent" style="display: block;">
            <div class="search-res">
                <%
                    int pagesize1 = 8;
                    int introwcount1 = (int) session.getAttribute("resNum");
                    int intPagecount1 = (introwcount1 + pagesize1 - 1) / pagesize1;
                    int intPage1;
                    String strpage1;
                    int i1 = 0;
                    strpage1 = request.getParameter("page1");
                    if (strpage1 == null) intPage1 = 1;
                    else {
                        intPage1 = java.lang.Integer.parseInt(strpage1);
                        if (intPage1 < 1) intPage1 = 1;
                    }
                    if (intPage1 > intPagecount1) intPage1 = intPagecount1;
                    if (intPagecount1 > 0) {
                        i1 = (intPage1 - 1) * pagesize1;
                    }
                %>
                <c:forEach items="${searchRestaurants}" begin="<%=i1%>" end="<%=i1+pagesize1-1%>" step="1" var="res">
                    <div class="col-md-3 project-grid">
                        <div class="project-grid-top">
                            <a href="/resPage?resId=${res.resId}"><img class="img-responsive zoom-img" src=${res.resPic} alt=""/></a>
                            <div class="col-md1">
                                <div class="col-md2">
                                    <div class="col-md3">
                                        <span class="star"> <strong>${res.resScore}</strong></span>
                                    </div>
                                    <div class="col-md4">
                                        <strong>${res.resName}
                                        </strong>
                                        <small>${res.resReferNum}次推荐</small>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <p>地址：${res.resAddrCity}${res.resAddrStreet}
                                </p>
                                <p>类别：${res.resStyle}
                                </p>
                                <p class="cost">人均：¥${res.resAverageCost}
                                </p>
                                <a onclick="resCollect(${res.resId})" class="hvr-sweep-to-right more">想吃</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>

            </div>
            <c:if test="<%=intPagecount1>1%>">
                <nav>
                    <ul class="pagination">
                        <%
                            if (intPage1 > 1) {
                        %>
                        <li><a href="?page1=<%=intPage1-5 %>&tab=0&key=${key}" aria-label="Previous"><span
                                aria-hidden="true">«</span></a></li>
                        <li><a href="?page1=1&tab=0&key=${key}">1</a></li>
                        <%if (intPage1 > 2) { %>
                        <li><a href="#">...</a></li>
                        <li><a href="?page1=<%=intPage1-1 %>&tab=0&key=${key}"><%=intPage1 - 1 %>
                        </a></li>
                        <%
                                }
                            }
                        %>
                        <li class="active"><a href="?page1=<%=intPage1%>&tab=0&key=${key}"><%=intPage1 %>
                        </a></li>
                        <%
                            if (intPage1 < intPagecount1) {
                                if (intPage1 < intPagecount1 - 1) {
                        %>
                        <li><a href="?page1=<%=intPage1+1 %>&tab=0&key=${key}"><%=intPage1 + 1 %>
                        </a></li>
                        <li><a href="#">...</a></li>
                        <%} %>
                        <li><a href="?page1=<%=intPagecount1 %>&tab=0&key=${key}"><%=intPagecount1%>
                        </a></li>
                        <li><a href="?page1=<%=intPage1+5 %>&tab=0&key=${key}" aria-label="Next"><span
                                aria-hidden="true">»</span></a></li>
                        <%} %>
                    </ul>
                </nav>
            </c:if>
        </div>
        <div class="plcHotPlaceContent" style="display: none;">
            <div class="search-res">
                <%
                    int pagesize2 = 4;
                    int introwcount2 = (int) session.getAttribute("rouNum");
                    int intPagecount2 = (introwcount2 + pagesize2 - 1) / pagesize2;
                    int intPage2;
                    String strpage2;
                    int i2 = 0;
                    strpage2 = request.getParameter("page2");
                    if (strpage2 == null) intPage2 = 1;
                    else {
                        intPage2 = java.lang.Integer.parseInt(strpage2);
                        if (intPage2 < 1) intPage2 = 1;
                    }
                    if (intPage2 > intPagecount2) intPage2 = intPagecount2;
                    if (intPagecount2 > 0) {
                        i2 = (intPage2 - 1) * pagesize2;
                    }
                %>
                <c:forEach items="${searchRoutes}" begin="<%=i2%>" end="<%=i2+pagesize2-1%>" step="1" var="rou">
                    <div class="col-md-4 box_2">
                        <div class="project-fur">
                            <a href="/readRoute?id=${rou.rouId}" class="mask">
                                <img class="img-responsive zoom-img" src=${rou.rouTitlePic}  alt="">
                                <span class="four">${rou.rouPrice}</span>
                            </a>
                            <div class="most-1">
                                <h5><a href="/readRoute?id=${rou.rouId}">${rou.rouTitle}</a></h5>
                                <p>by ${rou.userByRouUserId.userName}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
            <c:if test="<%=intPagecount2>1%>">
                <nav>
                    <ul class="pagination">
                        <%
                            if (intPage2 > 1) {
                        %>
                        <li><a href="?page2=<%=intPage2-5 %>&tab=1&key=${key}" aria-label="Previous"><span
                                aria-hidden="true">«</span></a></li>
                        <li><a href="?page2=1&tab=1&key=${key}">1</a></li>
                        <%if (intPage2 > 2) { %>
                        <li><a href="#">...</a></li>
                        <li><a href="?page2=<%=intPage2-1 %>&tab=1&key=${key}"><%=intPage2 - 1 %>
                        </a></li>
                        <%
                                }
                            }
                        %>
                        <li class="active"><a href="?page2=<%=intPage2%>&tab=1&key=${key}"><%=intPage2 %>
                        </a></li>
                        <%
                            if (intPage2 < intPagecount2) {
                                if (intPage2 < intPagecount2 - 1) {
                        %>
                        <li><a href="?page2=<%=intPage2+1 %>&tab=1&key=${key}"><%=intPage2 + 1 %>
                        </a></li>
                        <li><a href="#">...</a></li>
                        <%} %>
                        <li><a href="?page2=<%=intPagecount2%>&tab=1&key=${key}"><%=intPagecount2%>
                        </a></li>
                        <li><a href="?page2=<%=intPage2+5 %>&tab=1&key=${key}" aria-label="Next"><span
                                aria-hidden="true">»</span></a></li>
                        <%} %>
                    </ul>
                </nav>
            </c:if>
        </div>

        <div class="plcHotPlaceContent" style="display: none;">
            <div class="project-top">
                <%
                    int pagesize3 = 3;
                    int introwcount3 = (int) session.getAttribute("artNum");
                    int intPagecount3 = (introwcount3 + pagesize3 - 1) / pagesize3;
                    int intPage3;
                    String strpage3;
                    int i3 = 0;
                    strpage3 = request.getParameter("page3");
                    if (strpage3 == null) intPage3 = 1;
                    else {
                        intPage3 = java.lang.Integer.parseInt(strpage3);
                        if (intPage3 < 1) intPage3 = 1;
                    }
                    if (intPage3 > intPagecount3) intPage3 = intPagecount3;
                    if (intPagecount3 > 0) {
                        i3 = (intPage3 - 1) * pagesize3;
                    }
                %>
                <c:forEach items="${searchArticles}" begin="<%= i3%>" end="<%= i3+pagesize3-1%>" step="1"
                           var="art">
                    <div class="blog">
                        <div class="art_container">
                            <div class="art_picture">
                                <a href="/readArticle?id=${art.artId}>"><img src="${art.artTitlePic}"
                                                                          class="img-responsive" alt=""/></a>
                            </div>
                            <div class="art_content">
                                <div class="blog-top">
                                    <h4><a href="/readArticle?id=${art.artId}">${art.artTitle}</a></h4>
                                    <h5>Posted By :${art.userByArtUserId.userName}</a> | Date
                                        : ${art.artPostTime}</h5>
                                    <h5>阅读量：${art.artReadNum}</h5>
                                    <a class="hvr-sweep-to-right more" href="/readArticle?id=${art.artId}">Read
                                        More</a>
                                    <div class="links">
                                        <ul class="blog-links">
                                            <li><a href="javascript:void (0);"><i
                                                    class="glyphicon glyphicon-heart"></i><span>${art.artAgreeNum}</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
                <c:if test="<%=intPagecount3>1%>">
                    <nav>
                        <ul class="pagination">
                            <%
                                if (intPage3 > 1) {
                            %>
                            <li><a href="?page3=<%=intPage3-5 %>&tab=2&key=${key}" aria-label="Previous"><span
                                    aria-hidden="true">«</span></a></li>
                            <li><a href="?page3=1&tab=2&key=${key}">1</a></li>
                            <%if (intPage3 > 2) { %>
                            <li><a href="#">...</a></li>
                            <li><a href="?page3=<%=intPage3-1 %>&tab=2&key=${key}"><%=intPage3 - 1 %>
                            </a></li>
                            <%
                                    }
                                }
                            %>
                            <li class="active"><a href="?page3=<%=intPage3%>&tab=2&key=${key}"><%=intPage3 %>
                            </a></li>
                            <%
                                if (intPage3 < intPagecount3) {
                                    if (intPage3 < intPagecount3 - 1) {
                            %>
                            <li><a href="?page3=<%=intPage3+1 %>&tab=2&key=${key}"><%=intPage3 + 1 %>
                            </a></li>
                            <li><a href="#">...</a></li>
                            <%} %>
                            <li><a href="?page3=<%=intPagecount3 %>&tab=2&key=${key}"><%=intPagecount3%>
                            </a></li>
                            <li><a href="?page3=<%=intPage3+5 %>&tab=2&key=${key}" aria-label="Next"><span
                                    aria-hidden="true">»</span></a></li>
                            <%} %>
                        </ul>
                    </nav>
                </c:if>
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
                    <li><a href="javascript:void(0);">About Us</a></li>
                    <li><a href="javascript:void(0);">For Sale By Owner Blog</a></li>
                    <li><a href="javascript:void(0);">Mobile</a></li>
                    <li><a href="javascript:void(0);">Terms & Conditions</a></li>
                    <li><a href="javascript:void(0);">Privacy Policy</a></li>
                    <li><a href="javascript:void(0);">Blog</a></li>

                </ul>
            </div>
            <div class="col-md-3 amet-sed ">
                <h4>Work With Us</h4>
                <ul class="nav-bottom">
                    <li><a href="javascript:void(0);">Real Estate Brokers</a></li>
                    <li><a href="javascript:void(0);">Business Development</a></li>
                    <li><a href="javascript:void(0);">Affiliate Programs</a></li>
                    <li><a href="javascript:void(0);">Sitemap</a></li>
                    <li><a href="javascript:void(0);">Careers</a></li>
                    <li><a href="javascript:void(0);">Feedback</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed">
                <h4>Customer Support</h4>
                <p>Mon-Fri, 7AM-7PM </p>
                <p>Sat-Sun, 8AM-5PM </p>
                <p>177-869-6559</p>
                <ul class="nav-bottom">
                    <li><a href="#">Live Chat</a></li>
                    <li><a href="javascript:void(0);">Frequently Asked Questions</a></li>
                    <li><a href="javascript:void(0);">Make a Suggestion</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed ">
                <h4>Property Services</h4>
                <ul class="nav-bottom">
                    <li><a href="javascript:void(0);">Residential Property</a></li>
                    <li><a href="javascript:void(0);">Commercial Property</a></li>
                    <li><a href="javascript:void(0);">Login</a></li>
                    <li><a href="javascript:void(0);">Register</a></li>
                    <li><a href="javascript:void(0);">Short Codes</a></li>
                </ul>
                <ul class="social">
                    <li><a href="javascript:void(0);"><i> </i></a></li>
                    <li><a href="javascript:void(0);"><i class="gmail"> </i></a></li>
                    <li><a href="javascript:void(0);"><i class="twitter"> </i></a></li>
                    <li><a href="javascript:void(0);"><i class="camera"> </i></a></li>
                    <li><a href="javascript:void(0);"><i class="dribble"> </i></a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
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