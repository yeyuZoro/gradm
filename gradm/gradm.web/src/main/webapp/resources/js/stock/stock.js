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
        var contentLike = $.trim($("input[name='search_contentLike']").val());

        window.location.href = BASE_PATH + '/admin/stock/export?' + 'search_contentLike='+contentLike;
    });

});