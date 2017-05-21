/**
 * Created by ansedon on 2017/5/9.
 */
function showTip() {
    setTimeout(disapper, 2000);
}
function disapper() {
    $("#tip").hide();
}

function login() {
    var domain = "http://localhost:8080";
    var username = $("#userName").val().trim();
    var password = $("#password").val().trim();
    var value = {"userName": username, "password": password};
    $.ajax({
        url: domain + "/checkLogin",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "1") {
                location.href = "/";
            } else {
                $("#tip").show();
                $("#tip").html("用户名或密码错误");
                showTip();
            }
        },
        error: function () {
            $("#tip").show();
            $("#tip").html("发生异常，请重试");
            showTip();
        }
    })
}

function register() {
    var domain = "http://localhost:8080";
    var userName = $("#userName").val().trim();
    var password = $("#password").val().trim();
    var pw = $("#pw").val().trim();
    var phone = $("#phone").val().trim();
    var bCity = $("#bCity").val().trim();
    var lCity = $("#lCity").val().trim();
    if (userName === "" || password === "" || pw === "" || phone === "" || bCity === "" || lCity === "") {
        $("#tip").show();
        $("#tip").html("请输入完整信息");
        showTip();
        return;
    }
    var value = {"userName": userName, "password": password, "pw": pw, "phone": phone, "bCity": bCity, "lCity": lCity};
    if (password != pw) {
        $("#tip").show();
        $("#tip").html("密码不匹配");
        document.getElementById("pw").focus();
        showTip();
        return;
    }
    $("#tip").show();
    $("#tip").html("注册中，请稍候");
    $.ajax({
        url: domain + "/register/check",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "1") {
                $("#tip").show();
                $("#tip").html("注册成功");
                showTip();
                location.href = "/";
            }
            else if (map.msg === "user name exists") {
                $("#tip").show();
                $("#tip").html("用户名已存在");
                document.getElementById("userName").focus();
                showTip();
            }
            else if (map.msg === "wrong phone number") {
                $("#tip").show();
                $("#tip").html("手机号输入有误");
                document.getElementById("phone").focus();
                showTip();
            }
            else if (map.msg === "phone number exists") {
                $("#tip").show();
                $("#tip").html("该手机号已被注册");
                document.getElementById("phone").focus();
                showTip();
            }
        },
        error: function () {
            $("#tip").hide();
            $("#tip").show();
            $("#tip").html("发生异常，请重试");
            showTip();
        }
    })
}

function resCollect(cresId) {
    var domain = "http://localhost:8080";
    var resId = cresId;
    var method = "collectRes";
    var value = {"resId": resId, "method": method};
    $.ajax({
        url: domain + "/resCollect",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "请先登录") {
                console.log("请登录");
                jNotify("<strong>请登录</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "收藏成功") {
                console.log("收藏成功");
                jSuccess("<strong>收藏成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "您已收藏") {
                console.log("您已收藏");
                jNotify("<strong>您已收藏</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
        },
        error: function () {
            console.log("发生异常");
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function artComment(userName, artId) {
    var domain = "http://localhost:8080";
    var comment = $("#comment").val().trim();
    console.log(userName);
    if (userName === "" || userName === null) {
        jNotify("<strong>请登录</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 150,
        });
        return;
    }
    if (comment === null || comment === "") {
        jNotify("<strong>请输入评论文字</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 150,
        });
        return;
    }
    var value = {"comment": comment, "artId": artId};
    var loadData = window.document.getElementById("loadData");
    var comBox = window.document.getElementById("comBox");
    $.ajax({
        url: domain + "/artComment",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "评论完成") {
                var str = "";
                var box = "";
                str += "<div class=\"media-left\">"
                    + "<a href=\"javascript:void (0);\">"
                    + "<img class=\"media-object\" src=\"/images/av.png\" alt=\"\"/></a>"
                    + "</div>"
                    + "<div class=\"media-body\">"
                    + "<h4 class=\"media-heading\">" + userName + "</h4>"
                    + "<p>" + comment + "</p>"
                    + "</div>"
                box += " <h5>已评论过</h5>"
                loadData.innerHTML = str;
                comBox.innerHTML = box;
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function artAgree(artId) {
    var domain = "http://localhost:8080";
    var value = {"artId": artId};
    $.ajax({
        url: domain + "/artAgree",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {

            if (map.msg === "点赞成功") {
                $("#finishAgree").html("已赞");
                $("#agree").html("已赞");
                jSuccess("<strong>点赞成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "已取消赞") {
                $("#finishAgree").html("赞");
                $("#agree").html("赞");
                jSuccess("<strong>已取消赞</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "未登录") {
                jNotify("<strong>请登录</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })

}

function artCollect(artId) {
    var domain = "http://localhost:8080";
    var value = {"artId": artId};
    $.ajax({
        url: domain + "/artCollect",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {

            if (map.msg === "收藏成功") {
                $("#collect").html("已收藏");
                $("#finishCollect").html("已收藏");
                jSuccess("<strong>收藏成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "已取消收藏") {
                $("#finishCollect").html("收藏");
                $("#collect").html("收藏");
                jSuccess("<strong>已取消收藏</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "未登录") {
                jNotify("<strong>请登录</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })

}

function artReport(artId) {
    var domain = "http://localhost:8080";
    var value = {"artId": artId};
    $.ajax({
        url: domain + "/artReport",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "举报成功") {
                $("#finishReport").html("已举报");
                $("#report").html("已举报");
                jSuccess("<strong>举报成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "已取消举报") {
                $("#finishReport").html("举报");
                $("#report").html("举报");
                jSuccess("<strong>已取消举报</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg === "未登录") {
                jNotify("<strong>请登录</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })

}

function writeRoute(userId) {
    if (userId === -1) {
        jNotify("<strong>请登录</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 150,
        });
        return;
    }
    var rouAddrProvince = $("#rouAddrProvince").val().trim();
    var rouAddrCity = $("#rouAddrCity").val().trim();
    if (rouAddrCity === "" || rouAddrCity === null) {
        jNotify("<strong>请输入城市名字</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var rouAddrStreet = $("#rouAddrStreet").val().trim();
    if (rouAddrStreet === "" || rouAddrStreet === null) {
        jNotify("<strong>请输入所在县区</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var rouPrice = $("#rouPrice").val().trim();
    if (rouPrice === "" || rouPrice === null) {
        jNotify("<strong>请输入路线价格</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var rouTitle = $("#rouTitle").val().trim();
    if (rouTitle === "" || rouTitle === null) {
        jNotify("<strong>请输入路线标题</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var content = UE.getEditor('editor').getContent();
    if (content === "" || content === null) {
        jNotify("<strong>请输入路线内容</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var domain = "http://localhost:8080";
    var value = {
        "userId": userId, "rouAddrProvince": rouAddrProvince, "rouAddrCity": rouAddrCity,
        "rouAddrStreet": rouAddrStreet, "rouPrice": rouPrice, "rouTitle": rouTitle,
        "content": content
    };
    $.ajax({
        url: domain + "/postRoute",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "success") {
                location.href = "/myPage";
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function writeArticle(userId) {
    if (userId === -1) {
        jNotify("<strong>请登录</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 150,
        });
        return;
    }
    var artAddrProvince = $("#artAddrProvince").val().trim();
    var artAddrCity = $("#artAddrCity").val().trim();
    if (artAddrCity === "" || artAddrCity === null) {
        jNotify("<strong>请输入城市名字</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var artAddrStreet = $("#artAddrStreet").val().trim();
    if (artAddrStreet === "" || artAddrStreet === null) {
        jNotify("<strong>请输入所在县区</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }

    var artTitle = $("#artTitle").val().trim();
    if (artTitle === "" || artTitle === null) {
        jNotify("<strong>请输入文章标题</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var content = UE.getEditor('editor').getContent();
    if (content === "" || content === null) {
        jNotify("<strong>请输入文章内容</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var domain = "http://localhost:8080";
    var value = {
        "userId": userId, "artAddrProvince": artAddrProvince, "artAddrCity": artAddrCity,
        "artAddrStreet": artAddrStreet, "artTitle": artTitle, "content": content
    };
    $.ajax({
        url: domain + "/postArticle",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "success") {
                location.href = "/addRestaurant";
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function artReferRes(artId, resId) {
    var value = {"artId": artId, "resId": resId};
    var domain = "http://localhost:8080";
    var h = resId.toString();
    var l = ((-1) * resId).toString();
    $.ajax({
        url: domain + "/refer",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            var str = "";
            if (map.msg === "success") {
                $("#" + h).hide();
                if (document.getElementById(l))
                    $("#" + l).show();
                else {
                    str += " <div id=\"" + (-1) * map.resId + "\" class=\"col-md-3 project-grid\">\n" +
                        "                    <div class=\"project-grid-top\">\n" +
                        "                        <a><img class=\"img-responsive zoom-img\" src=" + map.resPic + " alt=\"\"/></a>\n" +
                        "                        <div class=\"col-md1\">\n" +
                        "                            <div class=\"col-md2\">\n" +
                        "                                <div class=\"col-md3\">\n" +
                        "                                    <span class=\"star\"> <strong>" + map.resScore + "</strong></span>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"col-md4\">\n" +
                        "                                    <strong>" + map.resName + "\n" +
                        "                                    </strong>\n" +
                        "                                    <small>" + map.resReferNum + "次推荐</small>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"clearfix\"></div>\n" +
                        "                            </div>\n" +
                        "                            <p>地址：" + map.resAddrCity + map.resAddrStreet + "\n" +
                        "                            </p>\n" +
                        "                            <p>类别：" + map.resStyle + "\n" +
                        "                            </p>\n" +
                        "                            <p class=\"cost\">人均：¥" + map.resAverageCost + "\n" +
                        "                            </p>\n" +
                        "                            <a onclick=\"cancelRefer(" + artId + "," + map.resId + ")\"\n" +
                        "                               class=\"hvr-sweep-to-right more\">取消提及</a>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>"
                    document.getElementById("hide").innerHTML += str;
                }
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function cancelRefer(artId, resId) {
    var value = {"artId": artId, "resId": resId};
    var domain = "http://localhost:8080";
    var h = (-1 * resId).toString();
    $.ajax({
        url: domain + "/cancelRefer",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "success") {
                var str = "";
                $("#" + h).hide();
                if (document.getElementById(resId))
                    $("#" + resId).show()
                else {
                    str += " <div id=\"" + map.resId + "\" class=\"col-md-3 project-grid\">\n" +
                        "                    <div class=\"project-grid-top\">\n" +
                        "                        <a><img class=\"img-responsive zoom-img\" src=" + map.resPic + " alt=\"\"/></a>\n" +
                        "                        <div class=\"col-md1\">\n" +
                        "                            <div class=\"col-md2\">\n" +
                        "                                <div class=\"col-md3\">\n" +
                        "                                    <span class=\"star\"> <strong>" + map.resScore + "</strong></span>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"col-md4\">\n" +
                        "                                    <strong>" + map.resName + "\n" +
                        "                                    </strong>\n" +
                        "                                    <small>" + map.resReferNum + "次推荐</small>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"clearfix\"></div>\n" +
                        "                            </div>\n" +
                        "                            <p>地址：" + map.resAddrCity + map.resAddrStreet + "\n" +
                        "                            </p>\n" +
                        "                            <p>类别：" + map.resStyle + "\n" +
                        "                            </p>\n" +
                        "                            <p class=\"cost\">人均：¥" + map.resAverageCost + "\n" +
                        "                            </p>\n" +
                        "                            <a onclick=\"artReferRes(" + artId + "," + map.resId + ")\"\n" +
                        "                               class=\"hvr-sweep-to-right more\">提及</a>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>"
                    document.getElementById("it").innerHTML += str;
                }
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function resMark(resId) {
    var mark = $("#rate_value").val().trim();
    if (mark === "" || mark === null) {
        jNotify("<strong>请先评分</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        return;
    }
    var domain = "http://localhost:8080";
    var value = {
        "resId": resId, "mark": mark
    };
    $.ajax({
        url: domain + "/markRestaurant",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            var myMark = "";
            var userMark = "";
            if (map.msg === "success") {
                myMark = " <table width=\"100%\" border=\"0\">\n" +
                    "      <tr>\n" +
                    "         <td width=\"50\" align=\"left\">吃过：</td>\n" +
                    "         <td>\n" +
                    "         <div class=\"star_show\"\n" +
                    "         data-score=" + (parseFloat(mark) / 2).toString() + "></div>\n" +
                    "         </td>\n" +
                    "      </tr>\n" +
                    " </table>";
                userMark = "<span class=\"star\"> <strong>" + map.userMark + "</strong></span>"
            }
            document.getElementById(resId).innerHTML = myMark;
            document.getElementById((-1 * resId).toString()).innerHTML = userMark;
            $(document).ready(function () {
                $('.star_show').raty({
                    path: "images/",
                    readOnly: true,
                    score: function () {
                        return $(this).attr('data-score');
                    }
                });
            });
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })

}

function recharge() {
    var money=$("#money").val().trim();
    if (money === "" || money === null) {
        jNotify("<strong>请输入充值金额</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("money").focus();
        return;
    }
    var account=$("#account").val().trim();
    if (account === "" || account === null) {
        jNotify("<strong>请输入账号</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("account").focus();
        return;
    }
    var ps=$("#ps").val().trim();
    if (ps === "" || ps === null) {
        jNotify("<strong>请输入密码</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("ps").focus();
        return;
    }
    var domain = "http://localhost:8080";
    var value={"money":money,"account":account,"ps":ps};
    $.ajax({
        url: domain + "/recharge",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "success") {
                $("#coin").html(map.userMoney);
               jSuccess("<strong>充值成功 饭团+"+money+"</strong>", {
                   VerticalPosition: 'center',
                   HorizontalPosition: 'center',
                   clickOverlay: true,
                   autoHide: false,
                   MinWidth: 220,
               });
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function withdraw(originMoney) {
    var money=$("#money").val().trim();
    if (money === "" || money === null) {
        jNotify("<strong>请输入提现金额</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("money").focus();
        return;
    }
    console.log(originMoney);
    console.log(money);
    if(parseInt(originMoney)<parseInt(money))
    {
        jNotify("<strong>余额不足</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("money").focus();
        return;
    }
    var account=$("#account").val().trim();
    if (account === "" || account === null) {
        jNotify("<strong>请输入账号</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 220,
        });
        document.getElementById("account").focus();
        return;
    }
    var domain = "http://localhost:8080";
    var value={"money":money,"account":account};
    $.ajax({
        url: domain + "/withdraw",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg === "success") {
                $("#originMoney").html(map.userMoney);
                jSuccess("<strong>提现成功 饭团-"+money+"</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 220,
                });
            }
            if(map.msg==="余额不足")
            {
                jNotify("<strong>余额不足</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 220,
                });
                document.getElementById("money").focus();
                return;
            }
        },
        error: function () {
            jError("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}




