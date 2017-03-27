$(document).ready(function($){
    var pageNum = 1;
    $("#searchForm").submit(function () {
        pageNum = 1;
        moreData($(this), pageNum, false);
        return false;
    });
    $("#searchForm").submit();


    $('#saveArticleCat').click(function(){
        var goodsCategory = {
            id : $('#id').val(),
            catName : $.trim($('#catName').val()),
            parentId : $('#parentId').val()
        }
        $.ajax({
            type : 'POST',
            url : BASE_PATH + '/admin/goods/category/saveOrUpt',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(goodsCategory),
            success : function(result){
                if(result.success) {
                    alert("保存成功");
                    window.location.href= BASE_PATH+"/admin/goods/category";
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