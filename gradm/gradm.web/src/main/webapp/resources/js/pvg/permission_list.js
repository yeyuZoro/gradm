$(document).ready(function($){

    var pageNum = 1;
    $('#searchForm').submit(function(){
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    });
    //初始化
    $("#searchForm").submit();

    $('#remove').click(function(){
        var id = $(this).val();
        $.ajax({
            tyep : 'POST',
            url : BASE_PATH + '/admin/pvg/permission/',
        });
    });
});