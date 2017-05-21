<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/5/18
  Time: 下午8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.model.UserEntity" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" import="java.util.*,com.model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My account</title>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <script src="/js/skill.js"></script>
    <link href="/css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jNotify.jquery.js" type="text/javascript"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <link href="/css/myStyle.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/city_css_69a039e8b84ca46d4a57c054a5cb5e53.css" rel="stylesheet" type="text/css">
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
    <script type="text/javascript" src="/js/jquery.raty.js"></script>
    <script type="text/javascript" src="/js/jquery.raty.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.star_show').raty({
                path: "images/",
                readOnly: true,
                score: function () {
                    return $(this).attr('data-score');
                }

            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $('.star_set').raty({
                path: "images/",
                hints: ["2", "4", "6", "8", "10"],
                target: '#rate_value',
                targetKeep: true,
            });
        });
    </script>
</head>

<body>
<!--header-->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
                <li><a class="glyphicon glyphicon-user" href="/myPage/logout">Logout</a></li>
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
<% UserEntity user = (UserEntity) session.getAttribute("currentUser");
    int resSize = (int) session.getAttribute("resSize");
    int artSize = (int) session.getAttribute("artSize");
    int rouBuySize = (int) session.getAttribute("rouBuySize");
    int rouPubSize = (int) session.getAttribute("rouPubSize");
%>

<div class="login-right">
    <div class="container">
        <!-- <h3>Login</h3>-->
        <table width="100%" border="0">
            <tr>
                <td width="17%" valign="top" style="">
                    <div class="box-col">
                        <div class=" col-sm-7 left-side ">
                            <a href="javascript:void (0);"> <img class="img-responsive" src="images/av.png" alt=""></a>
                        </div>
                        <div class="  col-sm-5 middle-side">
                            <h4><%=user.getUserName() %>
                            </h4>
                            <p><span class="bath">现居</span>:<span class="two"><%=user.getUserLpCity() %></span></p>
                            <p><span class="bath1">等级 </span>:<span class="two">lv<%=user.getUserLevel() %></span></p>
                            <p><span class="bath2">经验值</span>:<span class="two"><%=user.getUserExperience() %></span>
                            </p>
                            <%
                                String cert = "未认证";
                                if (user.getUserCertStatus().equals("1")) cert = "认证中";
                                else if (user.getUserCertStatus().equals("2")) cert = "已认证";
                            %>
                            <p><span class="bath3">认证状态</span>:<span class="two"><%=cert %></span></p>
                            <p><span class="bath4">饭团</span>:<span class="two"><%=user.getUserMoney() %></span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="blog-list">
                        <div class=" right-side">
                            <a href="/chargePage" class="hvr-sweep-to-right more">充值</a>
                        </div>
                        <div class=" right-side">
                            <a href="/withdrawPage" class="hvr-sweep-to-right more">提现</a>
                        </div>
                        <div class=" right-side">
                            <a href="/writeArticle" class="hvr-sweep-to-right more">写食荐</a>
                        </div>
                        <%if (user.getUserCertStatus().equals("2")) { %>
                        <div class=" right-side">
                            <a href="/writeRoute" class="hvr-sweep-to-right more">发布路线</a>
                        </div>
                        <%} else if (user.getUserLevel() > 9 && user.getUserLevel().equals("0")) {%>
                        <div class=" right-side">
                            <a href="/applyForCertification?userId=<%=user.getUserId()%>"
                               class="hvr-sweep-to-right more">申请认证</a>
                        </div>
                        <%} %>
                    </div>

                </td>

                <td>
                    <div class="plcContainer">
                        <div class="qyWrap" id="qy">
                            <ul class="plcHotPlaceTags fontYaHei">
                                <li class="current" data-bn-ipg="place-city-poitab-hot"><span>我想吃的</span></li>

                                <li class="" data-bn-ipg="place-city-poitab-sight"><span>我收藏的</span></li>

                                <li class="" data-bn-ipg="place-city-poitab-food"><span>我购买的</span></li>

                                <li class="" data-bn-ipg="place-city-poitab-shopping"><span>我发布的</span></li>

                            </ul>
                            <div class="plcHotPlaceContent" style="display: block;">
                                <div class="search-res">
                                    <%
                                        int pagesize1 = 3;
                                        int introwcount1 = resSize;
                                        int intPagecount1 = (introwcount1 + pagesize1 - 1) / pagesize1;
                                        int intPage1;
                                        String strpage1;
                                        int m1;
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
                                            m1 = 0;
                                            for (; m1 < pagesize1 && i1 < introwcount1; i1++, m1++) {%>
                                    <c:forEach items="${retaurantCollection}" begin="<%=i1%>" end="<%=i1%>" step="1"
                                               var="res">

                                        <div class="col-md-3 project-grid">
                                            <div class="project-grid-top">
                                                <a><img src="${res.resPic}" class="img-responsive zoom-img" alt=""/></a>
                                                <div class="col-md1">
                                                    <div class="col-md2">
                                                        <div id="${res.resId*-1}" class="col-md3">
                                                            <span class="star"> <strong>${res.resScore}</strong></span>
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
                                                    <c:if test="${res.userMark!=0}">
                                                        <div class="col-md2">
                                                            <table width="100%" border="0">
                                                                <tr>
                                                                    <td width="50" align="left">吃过：</td>
                                                                    <td>
                                                                        <div class="star_show"
                                                                             data-score="${res.userMark/2}"></div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${res.userMark==0}">
                                                        <div id="${res.resId}" class="col-md2">
                                                            <table width="100%" border="0">
                                                                <tr>
                                                                    <td width="50" align="left">吃过：</td>
                                                                    <td>
                                                                        <div class="star_set"></div>
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="mark"
                                                                               id="rate_value">
                                                                        <input type="submit" onclick="resMark(${res.resId})" value="评分">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <% }
                                    }%>

                                    <div class="clearfix"></div>
                                </div>
                                <c:if test="<%=intPagecount1>1%>">
                                    <nav>
                                        <ul class="pagination">
                                            <%
                                                if (intPage1 > 1) {
                                            %>
                                            <li><a href="/myPage?page1=<%=intPage1-5 %>&tab=0"
                                                   aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li><a href="/myPage?page1=1&tab=0">1</a></li>
                                            <%if (intPage1 > 2) { %>
                                            <li><a href="#">...</a></li>
                                            <li><a href="/myPage?page1=<%=intPage1-1 %>&tab=0"><%=intPage1 - 1 %>
                                            </a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                            <li class="active"><a
                                                    href="/myPage?page1=<%=intPage1%>&tab=0"><%=intPage1 %>
                                            </a></li>
                                            <%
                                                if (intPage1 < intPagecount1) {
                                                    if (intPage1 < intPagecount1 - 1) {
                                            %>
                                            <li><a href="/myPage?page1=<%=intPage1+1 %>&tab=0"><%=intPage1 + 1 %>
                                            </a></li>
                                            <li><a href="#">...</a></li>
                                            <%} %>
                                            <li><a href="/myPage?page1=<%=intPagecount1 %>&tab=0"><%=intPagecount1%>
                                            </a></li>
                                            <li><a href="/myPage?page1=<%=intPage1+5 %>&tab=0"
                                                   aria-label="Next"><span
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
                                        int introwcount3 = artSize;
                                        int intPagecount3 = (introwcount3 + pagesize3 - 1) / pagesize3;
                                        int intPage3;
                                        String strpage3;
                                        int m3;
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
                                            m3 = 0;
                                            for (; m3 < pagesize3 && i3 < introwcount3; i3++, m3++) {
                                                //Article p1 =hotarticle.get(i3); %>
                                    <c:forEach items="${articleCollection}" begin="<%=i3%>" end="<%=i3%>" step="1"
                                               var="art">
                                        <div class="art_container">
                                            <div class="art_picture">
                                                <a href="readArticle/${art.artId}"><img src="${art.artTitlePic}"
                                                                                        class="img-responsive" alt=""/></a>
                                            </div>
                                            <div class="art_content">
                                                <div class="blog-top">
                                                    <h4><a href="readArticle/${art.artId}">${art.artTitle}</a></h4>
                                                    <h5>Posted By :${art.userByArtUserId} | Date
                                                        : ${art.artPostTime}</h5>
                                                    <h5>阅读量：${art.artReadNum}</h5>
                                                    <a class="hvr-sweep-to-right more" href="readArticle/${art.artId}">Read
                                                        More</a>
                                                    <div class="links">
                                                        <ul class="blog-links">
                                                            <li><a href="#"><i
                                                                    class="glyphicon glyphicon-heart"></i><span>${art.artAgreeNum}</span></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <%
                                            }
                                        }
                                    %>

                                    <div class="clearfix"></div>
                                    <c:if test="<%=intPagecount3>1%>">
                                        <nav>
                                            <ul class="pagination">
                                                <%
                                                    if (intPage3 > 1) {
                                                %>
                                                <li><a href="/myPage?page3=<%=intPage3 - 5 %>&tab=1"
                                                       aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                                <li><a href="/myPage/?page3=1&tab=1">1</a></li>
                                                <%if (intPage3 > 2) { %>
                                                <li><a href="#">...</a></li>
                                                <li><a href="/myPage?page3=<%=intPage3 - 1 %>&tab=1"><%=intPage3 - 1 %>
                                                </a></li>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <li class="active"><a
                                                        href="/myPage?page3=<%=intPage3%>&tab=1"><%=intPage3 %>
                                                </a></li>
                                                <%
                                                    if (intPage3 < intPagecount3) {
                                                        if (intPage3 < intPagecount3 - 1) {
                                                %>
                                                <li><a href="/myPage?page3=<%=intPage3 + 1 %>&tab=1"><%=intPage3 + 1 %>
                                                </a></li>
                                                <li><a href="#">...</a></li>
                                                <%} %>
                                                <li><a href="/myPage?page3=<%=intPagecount3 %>&tab=1"><%=intPagecount3%>
                                                </a></li>
                                                <li><a href="/myPage?page3=<%=intPage3 + 5 %>&tab=1"
                                                       aria-label="Next"><span
                                                        aria-hidden="true">»</span></a></li>
                                                <%} %>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div>
                            <div class="plcHotPlaceContent" style="display: none;">
                                <div class="search-res">
                                    <%
                                        int pagesize2 = 3;
                                        int introwcount2 = rouBuySize;
                                        int intPagecount2 = (introwcount2 + pagesize2 - 1) / pagesize2;
                                        int intPage2;
                                        String strpage2;
                                        int m2;
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
                                            m2 = 0;
                                            for (; m2 < pagesize2 && i2 < introwcount2; i2++, m2++) {
                                                //Route p = route.get(i2);
                                    %>
                                    <c:forEach items="${routeBought}" begin="<%=i2%>" end="<%=i2+1%>" step="1"
                                               var="rou">
                                        <div class="art_container">
                                            <div class="art_picture">
                                                <a href="/readRoute/${rou.rouId}"><img
                                                        src=${rou.rouTitlePic} class="img-responsive" alt=""></a>
                                            </div>
                                            <div class="art_content">
                                                <div class="blog-top">
                                                    <h4><a href="/readRoute/${rou.rouId}">${rou.rouTitle}</a></h4>
                                                    <h5>交易金额：${rou.rouPrice}饭团</h5>
                                                    <h5>购买时间：${rou.tradeTime}</h5>
                                                    <c:if test="${rou.tradeStatus.equals('0')}">
                                                        <h2>订单状态：进行中</h2>
                                                        <a class="hvr-sweep-to-right more"
                                                           href="/markRoute/${rou.rouId}">确认交易完成</a>
                                                    </c:if>
                                                    <c:if test="${rou.tradeStatus.equals('1')}">
                                                        <h2>订单状态：已完成</h2>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                                <div class="clearfix"></div>
                                <c:if test="<%=intPagecount2>1%>">
                                    <nav>
                                        <ul class="pagination">
                                            <%
                                                if (intPage2 > 1) {
                                            %>
                                            <li><a href="/myPage?page2=<%=intPage2 - 5 %>&tab=2"
                                                   aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li><a href="/myPage?page2=1&tab=2">1</a></li>
                                            <%if (intPage2 > 2) { %>
                                            <li><a href="#">...</a></li>
                                            <li><a href="/myPage?page2=<%=intPage2 - 1 %>&tab=2"><%=intPage2 - 1 %>
                                            </a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                            <li class="active"><a
                                                    href="/myPage?page2=<%=intPage2%>&tab=2"><%=intPage2 %>
                                            </a></li>
                                            <%
                                                if (intPage2 < intPagecount2) {
                                                    if (intPage2 < intPagecount2 - 1) {
                                            %>
                                            <li><a href="/myPage?page2=<%=intPage2 + 1 %>&tab=2"><%=intPage2 + 1 %>
                                            </a></li>
                                            <li><a href="#">...</a></li>
                                            <%} %>
                                            <li><a href="/myPage?page2=<%=intPagecount2%>&tab=2"><%=intPagecount2%>
                                            </a></li>
                                            <li><a href="/myPage?page2=<%=intPage2 + 5 %>&tab=2"
                                                   aria-label="Next"><span
                                                    aria-hidden="true">»</span></a></li>
                                            <%} %>
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>

                            <div class="plcHotPlaceContent" style="display: none;">
                                <div class="search-res">
                                    <%
                                        int pagesize4 = 6;
                                        int introwcount4 = rouPubSize;
                                        int intPagecount4 = (introwcount4 + pagesize4 - 1) / pagesize4;
                                        int intPage4;
                                        String strpage4;
                                        int m4;
                                        int i4 = 0;
                                        strpage4 = request.getParameter("page4");
                                        if (strpage4 == null) intPage4 = 1;
                                        else {
                                            intPage4 = java.lang.Integer.parseInt(strpage4);
                                            if (intPage4 < 1) intPage4 = 1;
                                        }
                                        if (intPage4 > intPagecount4) intPage4 = intPagecount4;
                                        if (intPagecount4 > 0) {
                                            i4 = (intPage4 - 1) * pagesize4;
                                            m4 = 0;
                                            for (; m4 < pagesize4 && i4 < introwcount4; i4++, m4++) {
                                                //Route p2 = Proute.get(i4);
                                    %>
                                    <c:forEach items="${routePublish}" begin="<%=i4%>" end="<%=i4%>" step="1" var="rou">
                                        <div class="col-md-4 box_2">
                                            <div class="project-fur">
                                                <a href="/readArticle/${rou.rouId}" class="mask">
                                                    <img class="img-responsive zoom-img" src=${rou.rouTitlePic} alt="">
                                                    <span class="four">${rou.rouPrice}</span>
                                                </a>
                                                <div class="most-1">
                                                    <h5><a href="/readArticle/${rou.rouId}">${rou.rouTitle}</a></h5>
                                                    <p>by ${rou.userByRouUserId.userName}</p>
                                                    <c:if test="${rou.rouStatus=='1'}">
                                                        <a class="hvr-sweep-to-right more"
                                                           href="/cancelRoute?routeId=${rou.rouId}">撤销路线</a>
                                                    </c:if>
                                                    <c:if test="${rou.rouStatus=='0'}">
                                                        <a class="hvr-sweep-to-right more">已撤销</a>
                                                    </c:if>
                                                </div>

                                            </div>
                                        </div>
                                    </c:forEach>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                                <div class="clearfix"></div>
                                <c:if test="<%=intPagecount4>1%>">
                                    <nav>
                                        <ul class="pagination">
                                            <%
                                                if (intPage4 > 1) {
                                            %>
                                            <li><a href="/myPage?page4=<%=intPage4 - 5 %>&tab=3"
                                                   aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li><a href="/myPage?page4=1&tab=3">1</a></li>
                                            <%if (intPage4 > 2) { %>
                                            <li><a href="#">...</a></li>
                                            <li><a href="/myPage?page4=<%=intPage4 - 1 %>&tab=3"><%=intPage4 - 1 %>
                                            </a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                            <li class="active"><a
                                                    href="/myPage?page4=<%=intPage4%>&tab=3"><%=intPage4 %>
                                            </a></li>
                                            <%
                                                if (intPage4 < intPagecount4) {
                                                    if (intPage4 < intPagecount4 - 1) {
                                            %>
                                            <li><a href="/myPage?page4=<%=intPage4 + 1 %>&tab=3"><%=intPage4 + 1 %>
                                            </a></li>
                                            <li><a href="#">...</a></li>
                                            <%} %>
                                            <li><a href="/myPage?page4=<%=intPagecount4%>&tab=3"><%=intPagecount4%>
                                            </a></li>
                                            <li><a href="/myPage?page4=<%=intPage4 + 5 %>&tab=3"
                                                   aria-label="Next"><span
                                                    aria-hidden="true">»</span></a></li>
                                            <%} %>
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </td>
        </table>
    </div>
</div>
</div>
<!--//contact-->
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

