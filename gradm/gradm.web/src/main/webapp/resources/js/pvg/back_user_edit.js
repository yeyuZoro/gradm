/**
 * Created by zsy on 15-1-7.
 */
$(document).ready(function ($) {
    $("#saveUser").click(function(){
        var userName = $("#userName").val();
        var name = $("#name").val();
        var password = $('#password').val();
        if($.trim(userName)==""){
            alert("登录名不能为空");
            $("#userName").focus();
            return false;
        }
        if($.trim(name)==""){
            alert("用户名不能为空");
            $("#name").focus();
            return false;
        }
        if($.trim(password)==""){
            alert("密码不能为空");
            $("#password").focus();
            return false;
        }
        $.ajax({
            type: 'post',
            url: BASE_PATH + '/admin/pvg/user/updateAdd',
            data: {
                userName:userName,
                name:name,
                roleId:$("#roleId").val(),
                id:$("#id").val(),
                isAdmin:$("#isAdmin").val(),
                password : password
            },
            success: function (data) {
                if (data.success != true) {
                    alert(data.errorMsg);
                    return;
                }
                else {
                    alert("操作成功");
                    window.location.href= BASE_PATH+"/admin/pvg/user";
                }
            },
            error: function (a, b, c) {
                //console.log(a,b,c);
            }
        });
    });
});
