$(document).ready(function ($) {

    $('#saveRole').click(function () {
        var id = $("#id").val();
        var name = $.trim($("#name").val());
        if(name==''){
            alert("角色名不能为空");
            return false;
        }
        var permissionIds = [];
        $.each($('.permissionId'), function () {
            if (this.checked){
                permissionIds.push(this.value);
            }
        });
        var permissionIdsStr = permissionIds.join(',');
        $.ajax({
            type: 'POST',
            data: {
                id:id,
                name:name,
                permissionIds: permissionIdsStr},
            dataType: 'json',
            url: BASE_PATH + '/admin/pvg/role/update',
            success: function (result) {
                if (result.success != true) {
                    alert(result.errorMsg);
                    return;
                }
                else {
                    alert("操作成功");
                    window.location.href=BASE_PATH+"/admin/pvg/role";
                }
            },
            error: function (a, b, c) {
                //console.log(a,b,c);
            }
        });
    });

    $('#checkall').change(function(){
        $(":checkbox[name='chkGroup']").prop("checked",$(this).prop("checked"));
        $(":checkbox[name='action_code[]']").prop("checked",$(this).prop("checked"));
    });

    $(document).on('change','.parentId', function () {
        var parentClass = 'checkId'+$(this).val();
        $('.'+parentClass).prop("checked",$(this).prop('checked'));
    });
});