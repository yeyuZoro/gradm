
$(document).ready(function($){

    $('#savePermission').click(function(){
        var id = $("#id").val();
        var pvgKey = $.trim($('#pvgKey').val());
        var name = $.trim($('#name').val());
        var url =  $.trim($('#url').val());
        var parentId = $("#parentId").val();
        var sort = $("#sort").val();
        var isMenu = $("[name='isMenu']:checked").val();
        var isNav = $("[name='isNav']:checked").val();
        var backPermission = {
            id : id,
            pvgKey : pvgKey,
            name : name,
            url : url,
            parentId : parentId,
            sort : sort,
            isMenu : isMenu,
            isNav : isNav
        }
        $.ajax({
            type : 'POST',
            url : BASE_PATH + '/admin/pvg/permission/updateAdd',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(backPermission),
            success : function(result){
                if(result.success) {
                    alert("保存成功");
                    window.location.href= BASE_PATH+"/admin/pvg/permission";
                } else {
                    alert("保存失败");
                    return false;
                }
            },
            error: function (a, b, c) {
                //console.log(a,b,c);
            }
        });
    });


});
