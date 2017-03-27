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

    $(document).on('click', '#export', function () {
        var search_contentLike = $.trim($("input[name='search_contentLike']").val());
        var search_mobileLike = $.trim($("input[name='search_mobileLike']").val());
        var search_identityCard = $.trim($("input[name='search_identityCard']").val());
        window.location.href = BASE_PATH + '/admin/user/export?' + 'search_contentLike='+search_contentLike +
        '&search_mobileLike=' + search_mobileLike +'&search_identityCard='+ search_identityCard;
    });

    $('#addUser').click(function(){
        window.location.href = BASE_PATH + '/admin/user/edit';
    });


    $(document).on('click','.remove', function () {
        var id = $(this).attr("value");
        var conf = confirm("确认删除吗？");
        if(conf == true) {
            $.ajax({
                type: 'POST',
                url: BASE_PATH + '/admin/user/delete',
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
});