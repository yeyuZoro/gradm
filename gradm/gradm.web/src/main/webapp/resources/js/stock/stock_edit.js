$(document).ready(function($){

    $('#diffStock').attr("readonly" , "readonly");

    $('#currentStock').on('change', function(){
        var currentStock = $.trim($('#currentStock').val());
        var realStock = $.trim($('#realStock').val());
        var diffStock = currentStock - realStock;
        if(diffStock != undefined) {
            $('#diffStock').val(diffStock);
        } else {
            $('#diffStock').val("");
        }
    });
    $('#realStock').on('change', function(){
        var currentStock = $.trim($('#currentStock').val());
        var realStock = $.trim($('#realStock').val());
        var diffStock = currentStock - realStock;
        if(isNaN(diffStock)) {
            $('#diffStock').val("");
        } else {
            $('#diffStock').val(diffStock);
        }
    });

    $('#save').click(function(){
        var id = $('#id').val();
        var goodsId = $('#goodsId').val();
        var goodsName = $.trim($('#goodsName').val());
        var measureUnit = $('#measureUnit').val();
        var currentStock = $.trim($('#currentStock').val());
        var realStock = $.trim($('#realStock').val());
        var diffStock =  $('#diffStock').val();

        var stock = {
            id : id,
            goodsId : goodsId,
            goodsName : goodsName,
            measureUnit : measureUnit,
            currentStock : currentStock,
            realStock : realStock,
            diffStock : diffStock
        }

        $.ajax({
            type : 'POST',
            url : BASE_PATH + '/admin/stock/saveOrUpt',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(stock),
            success : function(result){
                if(result.success) {
                    alert("保存成功");
                    window.location.href= BASE_PATH+"/admin/stock";
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