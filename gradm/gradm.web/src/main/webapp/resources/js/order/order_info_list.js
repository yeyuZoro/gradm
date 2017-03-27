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
        var search_orderSnLike = $.trim($("input[name='search_orderSnLike']").val());
        var search_orderNameLike = $.trim($("input[name='search_orderNameLike']").val());
        var search_contactNameLike = $.trim($("input[name='search_contactNameLike']").val());
        var search_contactMobileLike = $.trim($("input[name='search_contactMobileLike']").val());
        var startTime = $('#d4311').val();
        var endTime = $('#d4312').val();

        window.location.href = BASE_PATH + '/admin/order/export?' + 'search_orderSnLike='+search_orderSnLike +
            '&search_orderNameLike=' + search_orderNameLike +"&search_contactNameLike=" + search_contactNameLike+
        '&search_contactMobileLike='+search_contactMobileLike+'&startTime='+startTime+'&endTime='+endTime;
    });
});