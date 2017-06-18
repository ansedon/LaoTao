<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" import="java.util.*,com.model.*,java.sql.Date" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LaoTao</title>
    <%
        String account = "login";
        String index = "login";
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user != null) {
            account = user.getUserName();
            index = "myPage";
        }
    %>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/skill.js"></script>
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link href="css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="js/jNotify.jquery.js" type="text/javascript"></script>
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
    <!-- slide -->
    <script src="js/responsiveslides.min.js"></script>
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
<!--header-->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="javascript:void(0);"><img src="images/title.jpg" width="130"></a>
        <!--//logo-->

        <div class="top-nav">
            <ul class="right-icons">
                <li><a href="/city"><i class="glyphicon glyphicon-user"> </i>City </a></li>
                <li><a href="<%=index%>"><i class="glyphicon glyphicon-user"> </i><%=account%>
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

<!--//header-->
<!--project--->
<div class="project">
    <div class="container">
        <h3>猜你喜欢</h3>
        <div class="search-res">
            <c:forEach items="${res}" begin="0" end="7" step="1" var="res">
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
        </div>
    </div>
</div>
<!--//project-->
<!--content-->
<div class="content">
    <div class="content-grid">
        <div class="container">
            <h3>热门美食路线</h3>
            <div class="content-bottom-in">
                <ul id="flexiselDemo1">
                    <c:forEach items="${route}" var="route">
                        <li>
                            <div class="project-fur">
                                <a href="/readRoute?id=${route.rouId}" class="mask">
                                    <img class="img-responsive zoom-img" src=${route.rouTitlePic} alt="">
                                    <span class="four">${route.rouPrice}</span>
                                </a>
                                <div class="most-1">
                                    <h5><a href="/readRoute?id=${route.rouId}">${route.rouTitle}
                                    </a></h5>
                                    <p>by ${route.userByRouUserId.userName}
                                    </p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });
                    });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!--blog-->
<div class="blog">
    <div class="container">
        <div class="col-md-11 blog-head">
            <h3>热门食荐</h3>
            <%
                int pagesize = 3;
                int introwcount = (int) session.getAttribute("num");
                int intPagecount = (introwcount + pagesize - 1) / pagesize;
                int intPage;
                String strpage;
                int i = 0;
                strpage = request.getParameter("page");
                if (strpage == null) intPage = 1;
                else {
                    intPage = java.lang.Integer.parseInt(strpage);
                    if (intPage < 1) intPage = 1;
                }
                if (intPage > intPagecount) intPage = intPagecount;
                if (intPagecount > 0) {
                    i = (intPage - 1) * pagesize;
                }
            %>
            <c:forEach items="${article}" begin="<%= i%>" end="<%= i+pagesize-1%>" step="1" var="article">
                <div class="art_container">
                    <div class="art_picture">
                        <a href="readArticle?id=${article.artId}"><img src="${article.artTitlePic}" class="img-responsive"
                                                                    alt=""/></a>
                    </div>
                    <div class="art_content">
                        <div class="blog-top">
                            <h4><a href="readArticle?id=${article.artId}">${article.artTitle}
                            </a></h4>
                            <h5>Posted By : <a
                                    href="javascript:void(0);">${article.userByArtUserId.userName}
                            </a> | Date : ${article.artPostTime}
                            </h5>
                            <h5><a href="javascript:void(0);">阅读量：${article.artReadNum}
                            </a></h5>
                            <a class="hvr-sweep-to-right more" href="readArticle?id=${article.artId}">Read
                                More</a>
                            <div class="links">
                                <ul class="blog-links">
                                    <li><a href="javascript:void(0);"><i
                                            class="glyphicon glyphicon-heart"></i><span>${article.artAgreeNum}</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
            <c:if test="<%=intPagecount>1%>">
                <nav>
                    <ul class="pagination">
                        <%
                            if (intPage > 1) {
                        %>
                        <li><a href="?page=<%=intPage-5 %>" aria-label="Previous"><span
                                aria-hidden="true">«</span></a></li>
                        <li><a href="?page=1">1</a></li>
                        <%if (intPage > 2) { %>
                        <li><a href="#">...</a></li>
                        <li><a href="?page=<%=intPage-1 %>"><%=intPage - 1 %>
                        </a></li>
                        <%
                                }
                            }
                        %>
                        <li class="active"><a href="?page=<%=intPage%>"><%=intPage %>
                        </a></li>
                        <%
                            if (intPage < intPagecount) {
                                if (intPage < intPagecount - 1) {
                        %>
                        <li><a href="?page=<%=intPage+1 %>"><%=intPage + 1 %>
                        </a></li>
                        <li><a href="#">...</a></li>
                        <%} %>
                        <li><a href="?page=<%=intPagecount %>"><%=intPagecount%>
                        </a></li>
                        <li><a href="?page=<%=intPage+5 %>" aria-label="Next"><span aria-hidden="true">»</span></a>
                        </li>
                        <%} %>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
