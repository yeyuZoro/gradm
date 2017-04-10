$(document).ready(function($){
    var pageNum = 1;
    #("searchForm").submit(function(){
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    })
    $("#searchForm").submit();
});