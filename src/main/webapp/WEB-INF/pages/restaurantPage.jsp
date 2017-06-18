<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/6/18
  Time: 上午12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" import="java.util.*,com.model.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>餐馆嘛</title>
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <!-- 高德地图 -->
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>

    <link rel="stylesheet" href="elusive/css/elusive.css" >
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=e6f04620c909534b2e14dc1eed896845&plugin=AMap.Geocoder"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <!-- jQuery -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="assets/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="assets/js/bootstrap.min.js"></script>

    <style type="text/css">

        #dish{
            font-size: 14px;
        }

        #dish li{
            list-style-type: none;
            margin-right: 40px;
            margin-bottom: 20px;
            width: 180px;
            height: 170px;
            border:1px solid #dedede;
            border-radius: 6px;
            float: left;
        }
        #dish li span{
            margin-left: 8px;
        }
        #dish li:hover{
            border: 2px solid #e2ba28;
            width: 182px;
        }
        #dish li img{
            width: 178px;
            height: 135px;
            margin-bottom: 5px;
        }
        #dish li a i{
            color: #e2ba28;
            float: right;
            margin-right: 8px;
        }
        #dish li a i:hover {
            color: #a7891e;
        }

        #add:hover{
            font-weight: 800;
        }
    </style>


</head>
<body onload="geocoder()" style="background-color: rgba(222,222,222,0.56)">

<div class="container-fluid" style="border-bottom: 1px solid rgba(0,0,0,0.4)">
    <div id="rest_nav" class="row" style="background-color: rgba(255,255,255,0.96)"><br><br>
        <div class="col-md-4 col-md-offset-1" style="margin-left: 150px;position: relative;padding-left: 80px">
            <h2 style="">${res.resName}</h2>
            <p>人均：￥${res.resAverageCost}&nbsp;&nbsp;<strong style="color: #d8b226; border-left: 1px solid #dddddd">&nbsp;&nbsp;${res.resStyle}</strong></p>

        </div>
    </div>
</div><br>
<div class="container" style="background-color: rgba(255,255,255,0.9)">


    <div id="rest_head" class="row" style="background-color: rgba(252,252,252,0)">
        <div id="rest_img" class="col-sm-7" style="margin-left: 60px;position: relative; width: 600px;height: 400px">
            <br>
            <img src="${res.resPic}" style="max-width: 100%;height: 90%;border-radius:6px;border: 2px solid #dddddd;padding: 4px;">
        </div>

        <div id="rest_info" class="col-sm-5" ><br>
            <div style="margin:5px 0 30px 20px; height: 353px;padding-right: 40px;border-radius:6px; border: 1px solid #dddddd">
                <div id="container" style="margin-left: 40px; margin-top:152px; width: 428px;height: 220px"></div>
                <div class="address" style="margin-top: 20px;padding-left: 5px">
                    <p><i class="el-clock"></i> <strong style="color: #4672bf">营业时间</strong> &nbsp; 08:00 ~ 22:00</p><hr>
                    <p style="margin:1px;padding: 1px"><i class="el-location"></i><strong style="color: #4672bf">&nbsp;&nbsp;地址</strong>&nbsp;&nbsp;&nbsp;&nbsp;  ${res.resAddrProvince}${res.resAddrCity}${res.resAddrStreet} </p><hr>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<div class="container" style="background-color: rgba(255,255,255,0.9)">
    <div id="rest_menu" class="row">
        <div class="col-sm-10" style="margin-bottom:40px;margin-top:40px;margin-left: 60px;position: relative">
            <h4 style="margin-left: 40px">餐馆推荐菜 <span style="font-size:12px;padding-left:10px;color: #939393">您希望推荐其他的菜品?<a id="add" href="/addPage?resId=${res.resId}" style="color: #e29f23;margin-left: 10px">点击添加推荐菜<i class="el-plus"></i> </a></span></h4>
            <hr>
            <ul id="dish">
                <c:forEach items="${dishlist}" var="dish">
                <li><img src="${dish.dishPic}"><span>${dish.dishName}￥${dish.dishPrice}</span><a href="/editPage?dishId=${dish.dishId}"><i class="el-pencil active"></i></a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>


<!-- 高德地图 要传地址进来 -->
<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    function geocoder() {
        var geocoder = new AMap.Geocoder({
            city: "全国", //城市，默认：“全国”
            radius: 3000 //范围，默认：500
        });
        //地理编码,返回地理编码结果
        geocoder.getLocation("${res.resAddrProvince}${res.resAddrCity}${res.resAddrStreet}", function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                geocoder_CallBack(result);
            }
        });
    }
    function addMarker(i, d) {
        var marker = new AMap.Marker({
            map: map,
            position: [ d.location.getLng(),  d.location.getLat()]
        });
        var infoWindow = new AMap.InfoWindow({
            content: d.formattedAddress,
            offset: {x: 0, y: -30}
        });
        marker.on("mouseover", function(e) {
            infoWindow.open(map, marker.getPosition());
        });
    }
    //地理编码返回结果展示
    function geocoder_CallBack(data) {
        var resultStr = "";
        //地理编码结果数组
        var geocode = data.geocodes;
        for (var i = 0; i < geocode.length; i++) {
            //拼接输出html
            resultStr += "<span style=\"font-size: 12px;padding:0px 0 4px 2px; border-bottom:1px solid #C1FFC1;\">" + "<b>地址</b>：" + geocode[i].formattedAddress + "" + "&nbsp;&nbsp;<b>的地理编码结果是:</b><b>&nbsp;&nbsp;&nbsp;&nbsp;坐标</b>：" + geocode[i].location.getLng() + ", " + geocode[i].location.getLat() + "" + "<b>&nbsp;&nbsp;&nbsp;&nbsp;匹配级别</b>：" + geocode[i].level + "</span>";
            addMarker(i, geocode[i]);
        }
        map.setFitView();
        document.getElementById("result").innerHTML = resultStr;
    }
</script>

</body>
</html>