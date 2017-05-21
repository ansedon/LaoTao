<%@ page import="com.model.UserEntity" %><%--
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
    <%
        String account = "login";
        String index = "/";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            index = "myPage";
        }
    %>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <script src="/jQueryAssets/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <link href="css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="js/jNotify.jquery.js" type="text/javascript"></script>
    <script src="js/skill.js"></script>
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
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
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="/images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="<%=account%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
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
<!--//-->

<div class=" banner-buying">
    <div class=" container">
        <h3><span><c:out value="${city}"/>美食</span></h3>
    </div>
</div>
<!---content---->
<div class="plcContainer">
    <div class="qyWrap" id="qy">
        <ul class="plcHotPlaceTags fontYaHei">
            <li class="current" data-bn-ipg="place-city-poitab-hot"><span>餐馆</span></li>
            <li class="" data-bn-ipg="place-city-poitab-sight"><span>路线</span></li>
            <li class="" data-bn-ipg="place-city-poitab-food"><span>最热荐文</span></li>
            <li class="" data-bn-ipg="place-city-poitab-shopping"><span>最新荐文</span></li>
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
                <c:forEach items="${restaurantList}" begin="<%=i1%>" end="<%=i1+pagesize1-1%>" step="1" var="res">
                    <div class="col-md-3 project-grid">
                        <div class="project-grid-top">
                            <a><img class="img-responsive zoom-img" src=${res.resPic} alt=""/></a>
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
                        <li><a href="?page1=<%=intPage1-5 %>&tab=0&city=${city}" aria-label="Previous"><span
                                aria-hidden="true">«</span></a></li>
                        <li><a href="?page1=1&tab=0&city=${city}">1</a></li>
                        <%if (intPage1 > 2) { %>
                        <li><a href="#">...</a></li>
                        <li><a href="?page1=<%=intPage1-1 %>&tab=0&city=${city}"><%=intPage1 - 1 %>
                        </a></li>
                        <%
                                }
                            }
                        %>
                        <li class="active"><a href="?page1=<%=intPage1%>&tab=0&city=${city}"><%=intPage1 %>
                        </a></li>
                        <%
                            if (intPage1 < intPagecount1) {
                                if (intPage1 < intPagecount1 - 1) {
                        %>
                        <li><a href="?page1=<%=intPage1+1 %>&tab=0&city=${city}"><%=intPage1 + 1 %>
                        </a></li>
                        <li><a href="#">...</a></li>
                        <%} %>
                        <li><a href="?page1=<%=intPagecount1 %>&tab=0&city=${city}"><%=intPagecount1%>
                        </a></li>
                        <li><a href="?page1=<%=intPage1+5 %>&tab=0&city=${city}" aria-label="Next"><span
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
                <c:forEach items="${routeList}" begin="<%=i2%>" end="<%=i2+pagesize2-1%>" step="1" var="rou">
                    <div class="col-md-4 box_2">
                        <div class="project-fur">
                            <a href="/readRoute/${rou.rouId}" class="mask">
                                <img class="img-responsive zoom-img" src=${rou.rouTitlePic}  alt="">
                                <span class="four">${rou.rouPrice}</span>
                            </a>
                            <div class="most-1">
                                <h5><a href="/readRoute/${rou.rouId}">${rou.rouTitle}</a></h5>
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
                        <li><a href="?page2=<%=intPage2-5 %>&tab=1&city=${city}" aria-label="Previous"><span
                                aria-hidden="true">«</span></a></li>
                        <li><a href="?page2=1&tab=1&city=${city}">1</a></li>
                        <%if (intPage2 > 2) { %>
                        <li><a href="#">...</a></li>
                        <li><a href="?page2=<%=intPage2-1 %>&tab=1&city=${city}"><%=intPage2 - 1 %>
                        </a></li>
                        <%
                                }
                            }
                        %>
                        <li class="active"><a href="?page2=<%=intPage2%>&tab=1&city=${city}"><%=intPage2 %>
                        </a></li>
                        <%
                            if (intPage2 < intPagecount2) {
                                if (intPage2 < intPagecount2 - 1) {
                        %>
                        <li><a href="?page2=<%=intPage2+1 %>&tab=1&city=${city}"><%=intPage2 + 1 %>
                        </a></li>
                        <li><a href="#">...</a></li>
                        <%} %>
                        <li><a href="?page2=<%=intPagecount2%>&tab=1&city=${city}"><%=intPagecount2%>
                        </a></li>
                        <li><a href="?page2=<%=intPage2+5 %>&tab=1&city=${city}" aria-label="Next"><span
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
                    int introwcount3 = (int) session.getAttribute("hotArtNum");
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
                <c:forEach items="${hotArticles}" begin="<%= i3%>" end="<%= i3+pagesize3-1%>" step="1"
                           var="art">
                    <div class="blog">
                        <div class="art_container">
                            <div class="art_picture">
                                <a href="/readArticle/${art.artId}>"><img src="${art.artTitlePic}"
                                                                          class="img-responsive" alt=""/></a>
                            </div>
                            <div class="art_content">
                                <div class="blog-top">
                                    <h4><a href="/readArticle/${art.artId}">${art.artTitle}</a></h4>
                                    <h5>Posted By :${art.userByArtUserId.userName}</a> | Date
                                        : ${art.artPostTime}</h5>
                                    <h5>阅读量：${art.artReadNum}</h5>
                                    <a class="hvr-sweep-to-right more" href="/readArticle/${art.artId}">Read
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
                            <li><a href="?page3=<%=intPage3-5 %>&tab=2&city=${city}" aria-label="Previous"><span
                                    aria-hidden="true">«</span></a></li>
                            <li><a href="?page3=1&tab=2&city=${city}">1</a></li>
                            <%if (intPage3 > 2) { %>
                            <li><a href="#">...</a></li>
                            <li><a href="?page3=<%=intPage3-1 %>&tab=2&city=${city}"><%=intPage3 - 1 %>
                            </a></li>
                            <%
                                    }
                                }
                            %>
                            <li class="active"><a href="?page3=<%=intPage3%>&tab=2&city=${city}"><%=intPage3 %>
                            </a></li>
                            <%
                                if (intPage3 < intPagecount3) {
                                    if (intPage3 < intPagecount3 - 1) {
                            %>
                            <li><a href="?page3=<%=intPage3+1 %>&tab=2&city=${city}"><%=intPage3 + 1 %>
                            </a></li>
                            <li><a href="#">...</a></li>
                            <%} %>
                            <li><a href="?page3=<%=intPagecount3 %>&tab=2&city=${city}"><%=intPagecount3%>
                            </a></li>
                            <li><a href="?page3=<%=intPage3+5 %>&tab=2&city=${city}" aria-label="Next"><span
                                    aria-hidden="true">»</span></a></li>
                            <%} %>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
        <div class="plcHotPlaceContent" style="display: none;">
            <div class="project-top">
                <%
                    int pagesize4 = 3;
                    int introwcount4 = (int) session.getAttribute("newArtNum");
                    int intPagecount4 = (introwcount4 + pagesize4 - 1) / pagesize4;
                    int intPage4;
                    String strpage4;
                    int i4 = 0;
                    strpage4 = request.getParameter("page4");
                    if (strpage4 == null) intPage4 = 1;
                    else {
                        intPage4 = java.lang.Integer.parseInt(strpage4);
                        if (intPage4 < 1) intPage4 = 1;
                    }
                    if (intPage4 > intPagecount4) intPage4 = intPagecount4;
                    if (intPagecount4 > 0) {
                        i3 = (intPage4 - 1) * pagesize4;
                    }
                %>
                <c:forEach items="${newArticles}" begin="<%= i4%>" end="<%= i4+pagesize4-1%>" step="1"
                           var="art">
                    <div class="blog">
                        <div class="art_container">
                            <div class="art_picture">
                                <a href="/readArticle/${art.artId}>"><img src="${art.artTitlePic}"
                                                                          class="img-responsive" alt=""/></a>
                            </div>
                            <div class="art_content">
                                <div class="blog-top">
                                    <h4><a href="/readArticle/${art.artId}">${art.artTitle}</a></h4>
                                    <h5>Posted By :${art.userByArtUserId.userName}</a> | Date
                                        : ${art.artPostTime}</h5>
                                    <h5>阅读量：${art.artReadNum}</h5>
                                    <a class="hvr-sweep-to-right more" href="/readArticle/${art.artId}">Read
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
                <c:if test="<%=intPagecount4>1%>">
                    <nav>
                        <ul class="pagination">
                            <%
                                if (intPage4 > 1) {
                            %>
                            <li><a href="?page4=<%=intPage4-5 %>&tab=3&city=${city}" aria-label="Previous"><span
                                    aria-hidden="true">«</span></a></li>
                            <li><a href="?page4=1&tab=3&city=${city}">1</a></li>
                            <%if (intPage4 > 2) { %>
                            <li><a href="#">...</a></li>
                            <li><a href="?page4=<%=intPage4-1 %>&tab=3&city=${city}"><%=intPage4 - 1 %>
                            </a></li>
                            <%
                                    }
                                }
                            %>
                            <li class="active"><a href="?page4=<%=intPage4%>&tab=3&city=${city}"><%=intPage4 %>
                            </a></li>
                            <%
                                if (intPage4 < intPagecount4) {
                                    if (intPage4 < intPagecount4 - 1) {
                            %>
                            <li><a href="?page4=<%=intPage4+1 %>&tab=3&city=${city}"><%=intPage4 + 1 %>
                            </a></li>
                            <li><a href="#">...</a></li>
                            <%} %>
                            <li><a href="?page4=<%=intPagecount4 %>&tab=3&city=${city}"><%=intPagecount4%>
                            </a></li>
                            <li><a href="?page4=<%=intPage4+5 %>&tab=3&city=${city}" aria-label="Next"><span
                                    aria-hidden="true">»</span></a></li>
                            <%} %>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>
</div>


</body>
</html>