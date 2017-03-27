$(document).ready(function($){

    $('#saveGoods').click(function(){

        var goods = {
            id : $('#id').val(),
            name : $.trim($('#name').val()),
            goodsSn : $.trim($('#goodsSn').val()),
            measureUnit : $.trim($('#measureUnit').val()),
            price : $('#price').val(),
            stock : $('#stock').val(),
            categoryId : $('#categoryId').val(),
            goodsBrand : $.trim($('#goodsBrand').val())
        }
        $.ajax({
            type : 'POST',
            url : BASE_PATH + '/admin/goods/saveOrUpt',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(goods),
            success : function(result){
                if(result.success) {
                    alert("保存成功");
                    window.location.href= BASE_PATH+"/admin/goods";
                } else {
                   alert(result.errorMsg);
                }
            },
            error: function (a, b, c) {
                //console.log(a,b,c);
            }

        });
    });


});