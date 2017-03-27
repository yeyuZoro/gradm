$(document).ready(function($){

    $('#saveUpt').click(function(){
        var id = $('#id').val();
        var oldPwd = $.trim($('#oldPwd').val());
        var newPwd = $.trim($('#newPwd').val());
        var confirmPwd = $.trim($('#confirmPwd').val());
        var backUserUptVO = {
            'id' : id,
            'oldPwd' : oldPwd,
            'newPwd' : newPwd,
            'confirmPwd' : confirmPwd
            };
        $.ajax({
            type : 'POST',
            dataType : 'json',
            contentType : 'application/json',
            url : BASE_PATH + "/login/updatePassword",
            data : JSON.stringify(backUserUptVO),
            success : function(result){
                if(result.success) {
                    console.log("修改成功");
                    alert("修改成功");
                    window.location.href = BASE_PATH + "/login/show/uptPwd?id="+ id;
                } else {
                    console.log("修改失败");
                    alert(result.errorMsg);
                    return false;
                }
            },
            error : function(a,b,c){

            }
        });
    });

});