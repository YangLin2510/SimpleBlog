$(function () {
    if ($.cookie('rememberMe') == "true") {
        $("#remember_me").attr("checked", true);
        $("#username").value($.cookie('username'));
        $("#password").value($.cookie("password"));
    }

    $("#submit").click(function () {//提交登录表单，保存cookies
        saveUserinfo();
    })
});


function saveUserinfo() {
    if ($("#remember_me").attr("checked") == true) {
        $.cookie("username", $("#username").val(), {expirse: 7});
        $.cookie("rememberMe", "true", {expirse: 7});
        $.cookie("password", $("password").val(), {expires: 7});
    } else {//去掉cookies
        $.cookie("username", '', {expirse: -1});
        $.cookie("rememberMe", "false", {expirse: -1});
        $.cookie("password", '', {expires: -1});
    }
}