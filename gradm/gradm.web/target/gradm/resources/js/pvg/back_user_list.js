
$(document).ready(function ($) {
    var pageNum = 1;
    $("#searchForm").submit(function () {
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    });
    $("#searchForm").submit();

    $(document).on('click','.remove', function () {
        var id = $(this).attr("value");
        taoqi.ask("确定要删除吗？",function() {
            $.ajax({
                type: 'POST',
                url: BASE_PATH + '/admin/pvg/user/delete',
                data: {
                    id: id
                },
                success: function (data) {
                    if (data.success != true) {
                        alert(data.errorMsg);
                        return;
                    }
                    else {
                        alert("删除成功");
                        window.location.reload();
                    }
                },
                error: function (a, b, c) {
                    //console.log(a,b,c);
                }
            });
        },function(){
            return false;
        })
    });

});
