$(document).ready(function($){


    $(document).on('click', '#save', function () {
        var id = $('#id').val();
        var name = $.trim($('#name').val());
        var mobile = $.trim($('#mobile').val());
        var isAdmin = $('#isAdmin').val();
        var gender = $('#gender').val();
        var identityCard = $('#identityCard').val();
        var age = $('#age').val();
        var manager = {
            id : id,
            name : name,
            mobile : mobile,
            isAdmin : isAdmin,
            gender : gender,
            identityCard : identityCard,
            age : age
        }
        $.ajax({
            type : 'POST',
            url : BASE_PATH + '/admin/user/saveOrUpt',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(manager),
            success : function(result){
                if(result.success) {
                    alert("保存成功");
                    window.location.href= BASE_PATH+"/admin/user";
                } else {
                    alert(result.errorMsg);
                    return false;
                }
            },
            error: function (a, b, c) {
                //console.log(a,b,c);
            }

        });

    });

});

