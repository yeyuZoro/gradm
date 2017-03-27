$(document).ready(function($){
    var pageNum = 1;
    $("#searchForm").submit(function () {
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    });
    $("#searchForm").submit();

    //手动查询数据事件
    $("input[type='submit']").click(function(){
        pageNum = 1;
        $('#searchForm').submit();
    });

    $('#addGoods').click(function(){
        window.location.href = BASE_PATH + "/admin/goods/edit";
    });

    $(document).on('click','.remove', function () {
        var id = $(this).attr("value");
        var conf = confirm("确认删除吗？");
        if(conf == true) {
            $.ajax({
                type: 'POST',
                url: BASE_PATH + '/admin/goods/delete',
                data: {
                    id: id
                },
                success: function (data) {
                    if (data.success != true) {
                        alert(data.errorMsg);
                        return false;
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
        }
    });

    $(document).on('click', '#export', function () {
        var contentLike = $.trim($("input[name='search_contentLike']").val());

        window.location.href = BASE_PATH + '/admin/goods/export?' + 'search_contentLike='+contentLike;
    });

});