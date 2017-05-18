<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/5/13
  Time: 下午1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>City</title>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="/js/scripts.js"></script>
    <link href="/css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <style type="text/css">
        @import url("/css/mfw-place.css");
    </style>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <!--logo-->
        <a href="/"><img src="/images/title.jpg" width="130" ></a>
    </div>
</div>
<!--//-->
<div class=" banner-buying">
    <div class=" container">
        <h3><span>目的地</span></h3>
        <!---->

        <div class="clearfix"> </div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {
                var menu_ul = $('.menu > li > ul'),
                    menu_a  = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function(e) {
                    e.preventDefault();
                    if(!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true,true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true,true).slideUp('normal');
                    }
                });
            });
        </script>

    </div>
</div>
<!--//header-->
<div class="container">
    <div class="top-grid">
        <h3>热门城市</h3>
        <div class="grid-at">
            <div class="col-md-pull-3 grid-city">
                <div class="grid-lo">
                    <a href="/cityPage?city=上海">
                        <figure class="effect-layla">
                            <img class=" img-responsive" src="/images/ce.jpg" alt="img06">
                            <figcaption>
                                <h4>上海</h4>
                            </figcaption>
                        </figure>
                    </a>
                </div>
            </div>
            <div class="col-md-pull-3 grid-city">
                <div class="grid-lo">
                    <a href="/cityPage?city=北京">
                        <figure class="effect-layla">
                            <img class=" img-responsive" src="/images/ce1.jpg" alt="img06">
                            <figcaption>
                                <h4>北京</h4>
                            </figcaption>
                        </figure>
                    </a>
                </div>
            </div>
            <div class="col-md-6 grid-city grid-city1">
                <div class="grid-me">
                    <div class="col-md-8 grid-lo1">
                        <div class=" grid-lo">
                            <a href="/cityPage?city=西安">
                                <figure class="effect-layla">
                                    <img class=" img-responsive" src="/images/ce2.jpg" alt="img06">
                                    <figcaption>
                                        <h4 class="effect1">西安</h4>
                                    </figcaption>
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-pull-4 grid-lo2">
                        <div class=" grid-lo">
                            <a href="/cityPage?city=成都">
                                <figure class="effect-layla">
                                    <img class=" img-responsive" src="/images/ce3.jpg" alt="img06">
                                    <figcaption>
                                        <h4 class="effect2">成都</h4>
                                    </figcaption>
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="grid-me">
                    <div class="col-md-6 grid-lo3">
                        <div class=" grid-lo">
                            <a href="/cityPage?city=重庆">
                                <figure class="effect-layla">
                                    <img class="img-responsive" src="/images/ce4.jpg" alt="img06">
                                    <figcaption>
                                        <h4 class="effect3">重庆</h4>
                                    </figcaption>
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 grid-lo4">
                        <div class=" grid-lo">
                            <a href="/cityPage?city=台北">
                                <figure class="effect-layla">
                                    <img class="img-responsive" src="/images/ce5.jpg" alt="img06">
                                    <figcaption>
                                        <h4 class="effect3">台北</h4>
                                    </figcaption>
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>


    <div class="hot-list clearfix">

        <div class="col">
            <dl>
                <dt>直辖市</dt>
                <dd>
                    <a href="/cityPage?city=北京" target="_blank">北京</a>
                    <a href="/cityPage?city=上海" target="_blank">上海</a>

                    <a href="/cityPage?city=重庆" target="_blank">重庆</a>
                    <a href="/cityPage?city=天津" target="_blank">天津</a>
                </dd>
            </dl>
            <dl>
                <dt>云南</dt>
                <dd>
                    <a href="/cityPage?city=丽江" >丽江</a>
                    <a href="/cityPage?city=大理">大理</a>
                    <a href="/cityPage?city=昆明">昆明</a>
                    <a href="/cityPage?city=香格里拉">香格里拉</a>
                    <a href="/cityPage?city=双廊" >双廊</a>
                    <a href="/cityPage?city=西双版纳">西双版纳</a>
                    <a href="/cityPage?city=束河" >束河</a>
                    <a href="/cityPage?city=腾冲">腾冲</a>
                    <a href="/cityPage?city=雨崩">雨崩</a>
                </dd>
            </dl>

            <dl><dt>四川</dt>
                <dd>
                    <a href="/cityPage?city=成都">成都</a>
                    <a href="/cityPage?city=九寨沟">九寨沟</a>
                    <a href="/cityPage?city=稻城">稻城</a>
                    <a href="/cityPage?city=色达">色达</a>
                    <a href="/cityPage?city=若尔盖">若尔盖</a>
                    <a href="/cityPage?city=都江堰">都江堰</a>
                    <a href="/cityPage?city=亚丁">亚丁</a>
                    <a href="/cityPage?city=阿坝">阿坝</a>
                    <a href="/cityPage?city=峨眉山">峨眉山</a>
                    <a href="/cityPage?city=牛背山">牛背山</a>
                </dd>
            </dl></dl>
            <dl>
                <dt>浙江</dt>
                <dd>
                    <a href="/cityPage?city=杭州">杭州</a>
                    <a href="/cityPage?city=乌镇">乌镇</a>
                    <a href="/cityPage?city=西塘">西塘</a>
                    <a href="/cityPage?city=宁波">宁波</a>
                    <a href="/cityPage?city=千岛湖">千岛湖</a>
                    <a href="/cityPage?city=舟山">舟山</a>
                    <a href="/cityPage?city=绍兴">绍兴</a>
                    <a href="/cityPage?city=嵊泗">嵊泗</a>
                </dd>
            </dl>
            <dl>
                <dt> 海南福建</dt>
                <dd>
                    <a href="/cityPage?city=嵊泗">三亚</a>
                    <a href="/cityPage?city=嵊泗">厦门</a>
                    <a href="/cityPage?city=鼓浪屿">鼓浪屿</a>
                    <a href="/cityPage?city=武夷山">武夷山</a>
                    <a href="/cityPage?city=霞浦">霞浦</a>
                    <a href="/cityPage?city=泉州">泉州</a>
                </dd>
            </dl>
            <dl>
                <dt>江苏</dt>
                <dd>
                    <a href="/cityPage?city=南京">南京</a>
                    <a href="/cityPage?city=苏州">苏州</a>
                    <a href="/cityPage?city=无锡">无锡</a>
                    <a href="/cityPage?city=扬州">扬州</a>
                    <a href="/cityPage?city=周庄">周庄</a>
                    <a href="/cityPage?city=常州">常州</a>
                    <a href="/cityPage?city=连云港">连云港</a>
                    <a href="/cityPage?city=同里">同里</a>
                </dd>
            </dl>
            <dl>
                <dt>广东广西</dt>
                <dd>
                    <a href="/cityPage?city=广州">广州</a>
                    <a href="/cityPage?city=深圳">深圳</a>
                    <a href="/cityPage?city=珠海">珠海</a>
                    <a href="/cityPage?city=汕头">汕头</a>
                    <a href="/cityPage?city=桂林">桂林</a>
                    <a href="/cityPage?city=阳朔">阳朔</a>
                    <a href="/cityPage?city=北海">北海</a>
                    <a href="/cityPage?city=黄姚古镇">黄姚古镇</a>
                    <a href="/cityPage?city=涠洲岛">涠洲岛</a>
                    <a href="/cityPage?city=龙脊梯田">龙脊梯田</a>
                </dd>
            </dl>
        </div>
        <div class="col">
            <dl>
                <dt>西藏贵州</dt>
                <dd>
                    <a href="/cityPage?city=拉萨">拉萨</a>
                    <a href="/cityPage?city=林芝">林芝</a>
                    <a href="/cityPage?city=阿里">阿里</a>
                    <a href="/cityPage?city=黔东南">黔东南</a>
                    <a href="/cityPage?city=荔波">荔波</a>
                    <a href="/cityPage?city=镇远">镇远</a>
                    <a href="/cityPage?city=西江">西江</a>
                    <a href="/cityPage?city=黄果树">黄果树</a>
                </dd>
            </dl>
            <dl>
                <dt>西北</dt>
                <dd>
                    <a href="/cityPage?city=西安">西安</a>
                    <a href="/cityPage?city=青海湖">青海湖</a>
                    <a href="/cityPage?city=西宁">西宁</a>
                    <a href="/cityPage?city=祁连">祁连</a>
                    <a href="/cityPage?city=敦煌">敦煌</a>
                    <a href="/cityPage?city=兰州">兰州</a>
                    <a href="/cityPage?city=甘南">甘南</a>
                    <a href="/cityPage?city=张掖">张掖</a>
                    <a href="/cityPage?city=嘉峪关">嘉峪关</a>
                    <a href="/cityPage?city=新疆">新疆</a>
                </dd>
            </dl>
            <dl>
                <dt>山东山西</dt>
                <dd>
                    <a href="/cityPage?city=青岛">青岛</a>
                    <a href="/cityPage?city=泰山">泰山</a>
                    <a href="/cityPage?city=日照">日照</a>
                    <a href="/cityPage?city=威海">威海</a>
                    <a href="/cityPage?city=烟台">烟台</a>
                    <a href="/cityPage?city=长岛">长岛</a>
                    <a href="/cityPage?city=蓬莱">蓬莱</a>
                    <a href="/cityPage?city=平遥">平遥</a>
                    <a href="/cityPage?city=大同">大同</a>
                    <a href="/cityPage?city=五台山">五台山</a>
                    <a href="/cityPage?city=壶口瀑布">壶口瀑布</a>
                </dd>
            </dl>
            <dl>
                <dt>湖南湖北</dt>
                <dd>
                    <a href="/cityPage?city=张家界">张家界</a>
                    <a href="/cityPage?city=凤凰">凤凰</a>
                    <a href="/cityPage?city=郴州">郴州</a>
                    <a href="/cityPage?city=武汉">武汉</a>
                    <a href="/cityPage?city=恩施">恩施</a>
                    <a href="/cityPage?city=神农架">神农架</a>
                </dd>
            </dl>
            <dl>
                <dt>安徽江西</a>
                </dt>
                <dd>
                    <a href="/cityPage?city=黄山">黄山</a>
                    <a href="/cityPage?city=宏村">宏村</a>
                    <a href="/cityPage?city=婺源">婺源</a>
                    <a href="/cityPage?city=景德镇">景德镇</a>
                    <a href="/cityPage?city=庐山">庐山</a>
                    <a href="/cityPage?city=三清山">三清山</a>
                    <a href="/cityPage?city=南昌">南昌</a>
                </dd>
            </dl>
            <dl>
                <dt>河北河南</dt>
                <dd>
                    <a href="/cityPage?city=北戴河">北戴河</a>
                    <a href="/cityPage?city=秦皇岛">秦皇岛</a>
                    <a href="/cityPage?city=承德">承德</a>
                    <a href="/cityPage?city=张北">张北</a>
                    <a href="/cityPage?city=少林寺">少林寺</a>
                    <a href="/cityPage?city=洛阳">洛阳</a>
                    <a href="/cityPage?city=龙门石窟">龙门石窟</a>
                </dd>
            </dl>
            <dl>
                <dt>内蒙古东北</dt>
                <dd>
                    <a href="/cityPage?city=呼伦贝尔">呼伦贝尔</a>
                    <a href="/cityPage?city=阿尔山">阿尔山</a>
                    <a href="/cityPage?city=海拉尔">海拉尔</a>
                    <a href="/cityPage?city=哈尔滨">哈尔滨</a>
                    <a href="/cityPage?city=漠河">漠河</a>
                    <a href="/cityPage?city=雪乡">雪乡</a>
                    <a href="/cityPage?city=大连">大连</a>
                    <a href="/cityPage?city=丹东">丹东</a>
                    <a href="/cityPage?city=盘锦">盘锦</a>
                </dd>
            </dl>
        </div>
    </div>


    <!--footer-->
    <div class="footer">
        <div class="footer-bottom">
            <div class="container">
                <div class="col-md-4 footer-logo">
                    <h2><a href="/">Laotao</a></h2>
                </div>
                <!--<div class="col-md-8 footer-class">
                    <p >Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
                </div>-->
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!--//footer-->
</body>
</html>