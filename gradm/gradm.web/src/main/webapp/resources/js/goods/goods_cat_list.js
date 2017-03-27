$(document).ready(function($){
    var pageNum = 1;
    $("#searchForm").submit(function () {
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    });
    $("#searchForm").submit();

    $('#add').click(function(){
        window.location.href = BASE_PATH + "/admin/goods/category/edit";
    });
});