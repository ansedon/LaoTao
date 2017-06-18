<%--
  Created by IntelliJ IDEA.
  User: yinjiaming
  Date: 17/6/18
  Time: 下午2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" import="java.util.*,com.model.*" %>

<!doctype html>
<html lang="ZH">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>推荐菜</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!--     Fonts and icons     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

</head>

<body>
<div class="image-container set-full-height" style="background-color: rgba(222,222,222,0.59)">

    <!--   Big container   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="/edit" method="POST" enctype="multipart/form-data">
                            <div class="wizard-header">
                                <h3>
                                    <b>${res.resName}</b><small> </small><br><br>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">请如实根据菜品信息填写推荐菜卡项；）</a></li>
                                </ul>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h5 class="info-text"> </h5>
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="${dish.dishPic}" class="picture-src" id="wizardPicturePreview" title=""/>
                                                    <input name="dishPic" type="file" id="wizard-picture" accept="image/*">
                                                </div>
                                                <h6>点击上传菜品图片</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>菜品名称 <small></small></label>
                                                <input name="dishname" type="text" class="form-control" value="${dish.dishName}">
                                            </div>
                                            <div class="form-group">
                                                <label>菜品价格 <small> </small></label>
                                                <input name="dishprice" type="number" class="form-control" value="${dish.dishPrice}">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-5">
                                        <div class="wizard-footer height-wizard">
                                            <div class="pull-right">
                                                <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='next' value='提交' />
                                            </div>
                                            <div class="clearfix"></div>
                                        </div><br>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div>
    <!--  big container -->

    <div class="footer">
        <div class="container">
        </div>
    </div>

</div>

</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="assets/js/gsdk-bootstrap-wizard.js"></script>

<!--  jquery.validate 	 -->
<script src="assets/js/jquery.validate.min.js"></script>

</html>