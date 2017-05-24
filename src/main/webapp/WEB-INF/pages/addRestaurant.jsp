<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>addRestaurant</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/js/scripts.js"></script>
    <script src="/js/skill.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link href="css/jNotify.jquery.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jNotify.jquery.js" type="text/javascript"></script>
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
<script type="text/javascript">
    function onlyNum() {
        if (!(event.keyCode == 46) && !(event.keyCode == 8) && !(event.keyCode == 37) && !(event.keyCode == 39))
            if (!((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105)))
                event.returnValue = false;
    }
</script>

<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="images/title.jpg" width="130"></a>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">
            </ul>

            <div class="clearfix"></div>
            <!---pop-up-box---->

            <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
            <!---//pop-up-box---->

            <div class="clearfix"></div>
        </div>
    </div>
</div>

<!--//header-->
<!--blog-->
<br/> <br/>
<div class="blog">
    <div class="container">
        <h3>文中提及了新餐馆？</h3>
    </div>
</div>
<div class="search-res">
    <div style="width:50%;padding-left:30px;">
        <div class="facts">
            <div class="login">
                <form action="/searchRestaurant" method="get">
                    <input name="key" class="glyphicon-phone" onFocus="this.value = '';"
                           onBlur="if (this.value == '') {this.value = '搜餐馆关键词进行筛选';}" value="搜餐馆关键词进行筛选"
                           type="text">
                    <input value="" type="submit">
                </form>
            </div>
        </div>
    </div>

    <div style="width:50%;float:left">
        <h1 style="text-align: center">文中提及的餐馆</h1>
    </div>
</div>
<div class="project-top">
    <div class="search-res">
        <div class="refer-res-1">
            <div id="it">
                <%
                    int pagesize1 = 4;
                    int introwcount1 = (int) session.getAttribute("referResNum");
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
                <c:if test="<%=introwcount1!=0%>">
                    <c:forEach items="${searchRestaurants}" begin="<%=i1%>" end="<%=i1+pagesize1-1%>" step="1"
                               var="res">
                        <div id="${res.resId}" class="col-md-3 project-grid">
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
                                    <a onclick="artReferRes('${referArtId}','${res.resId}')"
                                       class="hvr-sweep-to-right more">提及
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="refer-res-2">
            <div id="hide">
                <c:if test="${referResList!=null}">
                    <c:forEach items="${referResList}" var="res">
                        <div id="${-1*res.resId}" class="col-md-3 project-grid">
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
                                    <p>地址：${res.resAddrCity}${res.
                                            resAddrStreet}
                                    </p>
                                    <p>类别：${res.resStyle}
                                    </p>
                                    <p class="cost">人均：¥${res.resAverageCost}
                                    </p>
                                    <a
                                            onclick="cancelRefer('${referArtId}','${res.resId}')"
                                            class="hvr-sweep-to-right more">取消提及</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <c:if test="<%=intPagecount1>1%>">
        <nav>
            <ul class="pagination" style="margin-left: 23%">
                <%
                    if (intPage1 > 1) {
                %>
                <li><a href="?page1=<%=intPage1-5 %>&key=${key}" aria-label="Previous"><span
                        aria-hidden="true">«</span></a></li>
                <li><a href="?page1=1&key=${key}">1</a></li>
                <%if (intPage1 > 2) { %>
                <li><a href="#">...</a></li>
                <li><a href="?page1=<%=intPage1-1 %>&key=${key}"><%=intPage1 - 1 %>
                </a></li>
                <%
                        }
                    }
                %>
                <li class="active"><a href="?page1=<%=intPage1%>&key=${key}"><%=intPage1 %>
                </a></li>
                <%
                    if (intPage1 < intPagecount1) {
                        if (intPage1 < intPagecount1 - 1) {
                %>
                <li><a href="?page1=<%=intPage1+1 %>&key=${key}"><%=intPage1 + 1 %>
                </a></li>
                <li><a href="#">...</a></li>
                <%} %>
                <li><a href="?page1=<%=intPagecount1 %>&key=${key}"><%=intPagecount1%>
                </a></li>
                <li><a href="?page1=<%=intPage1+5 %>&key=${key}" aria-label="Next"><span
                        aria-hidden="true">»</span></a></li>
                <%} %>
            </ul>
        </nav>
    </c:if>
</div>
</body>

<div class="project-top" style="text-align:center">
    <a href="/readArticle?id=<%=(int) session.getAttribute("referArtId")%>" class="hvr-sweep-to-right more">添加完毕</a>
</div>

<div class="blog">
    <div class="container">
        <h3>没找到，推广文中餐馆？</h3>
    </div>
</div>

<div class="login-right">
    <div class="container">
        <div class="leave">
            <form action="/postRestaurant" method="post" enctype="multipart/form-data">
                <div class="price-grid">
                    <div class="col-sm-4 price-top">
                        <h4>餐馆名称</h4><input id="resName" type="text" name="resName" required>
                    </div>
                    <div class="col-sm-4 price-top">
                        <h4>餐馆风味</h4><input id="resStyle" type="text" name="resStyle" required>
                    </div>
                    <div class="col-sm-4 price-top">
                        <h4>人均消费</h4><input id="resAverageCost" type="text" name="resAverageCost" required
                                            onkeydown="onlyNum();"
                                            style="ime-mode:Disabled">
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-4 price-top">
                        <h4>省份</h4><input id="resAddrProvince" type="text" name="resAddrProvince">
                    </div>
                    <div class="col-sm-4 price-top">
                        <h4>城市</h4><input id="resAddrCity" type="text" name="resAddrCity" required>
                    </div>
                    <div class="col-sm-4 price-top">
                        <h4>县/区</h4><input id="resAddrStreet" type="text" name="resAddrStreet" required>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <br/>
                <div align="center">
                    <input type="button" value="添加图片" onclick="path.click()"
                           style="color：yellow；border:1px solid #ccc;background:#fff">
                    <input id="path" type="file" name="f1" accept="image/*" style="display:none">
                    <input id="aim" type="text" name="picName" placeholder="picture name" readonly
                           style="width:180px;"/>
                    <br/><br/><br/><br/>
                    <label class="hvr-sweep-to-right">
                        <input type="submit" value="添加餐馆">
                    </label>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    var file = $('#path'),
        aim = $('#aim');
    file.on('change', function (e) {
//e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
        var name = e.currentTarget.files[0].name;
        console.log(e.currentTarget.files);
        aim.val(name);
    });
</script>

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