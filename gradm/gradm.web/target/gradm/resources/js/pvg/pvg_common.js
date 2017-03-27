/**
 * Created by lixiao on 15-1-7.
 */
$(document).ready(function ($) {

    var permissionIds = $("#permissionIds").val();
    if(typeof permissionIds == undefined){
        permissionIds = null;
    }
    $.ajax({
        type: 'GET',
        data:{permissionIds:permissionIds},
        dataType: 'json',
        url: BASE_PATH+'/admin/pvg/permission/list_second',
        success: function (result) {
            if (result.success != true) {
                taoqi.failure(result.errorMsg);
                return;
            }
            else{
                var templateHtml = template.render('pvgListTpl', {'templateData': result.data});
                $('#pvgList').html(templateHtml);
                return;
            }
        },
        error: function (a, b, c) {
            //console.log(a,b,c);
        }
    });


});