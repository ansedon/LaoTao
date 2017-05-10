/**
 * Created by ansedon on 2017/5/9.
 */
function showTip(){
    setTimeout(disapper,2000);
}
function disapper(){
    $("#tip").hide();
}

function login() {
    var domain = "http://localhost:8080";
    var username = $("#username").val().trim();
    var password = $("#password").val().trim();
    var value = {"username": username, "password": password};
    $.ajax({
        url: domain + "/checkLogin",
        type: "post",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(value),
        success: function (map) {
            if (map.msg == "1") {
                location.href = "/homePage";
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

function register(){
    var domain="http://localhost:8080";
    var userName=$("#userName").val().trim();
    var password=$("#password").val().trim();
    var pw=$("#pw").val().trim();
    var phone=$("#phone").val().trim();
    var bCity=$("#bCity").val().trim();
    var lCity=$("#lCity").val().trim();
    if(userName==""||password==""||pw==""||phone==""||bCity==""||lCity=="")
    {
        $("#tip").show();
        $("#tip").html("请输入完整信息");
        showTip();
        return;
    }
    var value={"userName":userName,"password":password,"pw":pw,"phone":phone,"bCity":bCity,"lCity":lCity};
    if(password!=pw)
    {
        $("#tip").show();
        $("#tip").html("密码不匹配");
        document.getElementById("pw").focus();
        showTip();
        return;
    }
    $("#tip").show();
    $("#tip").html("注册中，请稍候");
    $.ajax({
        url:domain+"/register/check",
        type:"post",
        dataType:"json",
        contentType:"application/json;charset:utf-8",
        data:JSON.stringify(value),
        success:function (map) {
            if (map.msg == "1") {
                $("#tip").show();
                $("#tip").html("注册成功");
                showTip();
                location.href="/homePage";
            }
            else if(map.msg=="user name exists")
            {
                $("#tip").show();
                $("#tip").html("用户名已存在");
                document.getElementById("userName").focus();
                showTip();
            }
            else if(map.msg=="wrong phone number")
            {
                $("#tip").show();
                $("#tip").html("手机号输入有误");
                document.getElementById("phone").focus();
                showTip();
            }
            else if(map.msg=="phone number exists")
            {
                $("#tip").show();
                $("#tip").html("该手机号已被注册");
                document.getElementById("phone").focus();
                showTip();
            }
        },
        error:function() {
            $("#tip").hide();
            $("#tip").show();
            $("#tip").html("发生异常，请重试");
            showTip();
        }
    })
}