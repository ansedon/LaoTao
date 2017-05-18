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
            if (map.msg == "1") {
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
    if (userName == "" || password == "" || pw == "" || phone == "" || bCity == "" || lCity == "") {
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
            if (map.msg == "1") {
                $("#tip").show();
                $("#tip").html("注册成功");
                showTip();
                location.href = "/";
            }
            else if (map.msg == "user name exists") {
                $("#tip").show();
                $("#tip").html("用户名已存在");
                document.getElementById("userName").focus();
                showTip();
            }
            else if (map.msg == "wrong phone number") {
                $("#tip").show();
                $("#tip").html("手机号输入有误");
                document.getElementById("phone").focus();
                showTip();
            }
            else if (map.msg == "phone number exists") {
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
            if (map.msg == "请先登录") {
                console.log("请登录");
                jNotify("<strong>请登录</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "收藏成功") {
                console.log("收藏成功");
                jNotify("<strong>收藏成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "您已收藏") {
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
            jNotify("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })
}

function artComment(userName,artId) {
    var domain = "http://localhost:8080";
    var comment = $("#comment").val().trim();
    console.log(userName);
    if(userName==""||userName==null)
    {
        jNotify("<strong>请登录</strong>", {
            VerticalPosition: 'center',
            HorizontalPosition: 'center',
            clickOverlay: true,
            autoHide: false,
            MinWidth: 150,
        });
        return;
    }
    if(comment==null||comment=="")
    {
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
    var loadData=window.document.getElementById("loadData");
    var comBox=window.document.getElementById("comBox");
    $.ajax({
        url: domain + "/artComment",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset:utf-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg == "评论完成") {
                var str="";
                var box="";
                str+="<div class=\"media-left\">"
                    +"<a href=\"javascript:void (0);\">"
                    +"<img class=\"media-object\" src=\"/images/av.png\" alt=\"\"/></a>"
                    +"</div>"
                    +"<div class=\"media-body\">"
                    +"<h4 class=\"media-heading\">" +userName +"</h4>"
                    +"<p>"+comment+"</p>"
                    +"</div>"
                box+=" <h5>已评论过</h5>"
                loadData.innerHTML=str;
                comBox.innerHTML=box;
            }
        },
        error: function () {
            jNotify("<strong>发生异常，请重试</strong>", {
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

            if (map.msg == "点赞成功") {
                $("#finishAgree").html("已赞");
                $("#agree").html("已赞");
                jNotify("<strong>点赞成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "已取消赞") {
                $("#finishAgree").html("赞");
                $("#agree").html("赞");
                jNotify("<strong>已取消赞</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "未登录") {
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
            jNotify("<strong>发生异常，请重试</strong>", {
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

            if (map.msg == "收藏成功") {
                $("#collect").html("已收藏");
                $("#finishCollect").html("已收藏");
                jNotify("<strong>收藏成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "已取消收藏") {
                $("#finishCollect").html("收藏");
                $("#collect").html("收藏");
                jNotify("<strong>已取消收藏</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "未登录") {
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
            jNotify("<strong>发生异常，请重试</strong>", {
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
            if (map.msg == "举报成功") {
                $("#finishReport").html("已举报");
                $("#report").html("已举报");
                jNotify("<strong>举报成功</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "已取消举报") {
                $("#finishReport").html("举报");
                $("#report").html("举报");
                jNotify("<strong>已取消举报</strong>", {
                    VerticalPosition: 'center',
                    HorizontalPosition: 'center',
                    clickOverlay: true,
                    autoHide: false,
                    MinWidth: 150,
                });
            }
            else if (map.msg == "未登录") {
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
            jNotify("<strong>发生异常，请重试</strong>", {
                VerticalPosition: 'center',
                HorizontalPosition: 'center',
                clickOverlay: true,
                autoHide: false,
                MinWidth: 220,
            });
        }
    })

}