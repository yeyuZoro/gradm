<html lang="zh_CN.UTF-8">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login In</title>

        <link href="${BASE_PATH}/resources/css/login.css" rel="stylesheet" type="text/css"/>

        <script src="${BASE_PATH}/frontapp/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="${BASE_PATH}/resources/js/lib/jquery.form.js"></script>
        <script type="text/javascript" src="${BASE_PATH}/resources/js/common/gradm_common.js"></script>
    </head>
    <body class="login">
        <div class="div1">
            <div class="content">
                <form class="loginForm">

                    <div>
                        <div class="input-icon left">

                            <i class="icon-user"></i>

                            <input class="username placeholder-no-fix valid" id="j_username" type="text" placeholder="用户名" name="j_username">
                        </div>
                    </div>

                    <div>
                        <div class="input-icon left">

                            <i class="icon-password"></i>

                            <input class="password placeholder-no-fix valid" id="j_password" type="password" placeholder="密码" name="j_password">
                        </div>
                    </div>
                    <!-- display: none-->
                    <div id="errorMessage" style="display: none;color: orangered;margin-top: 5px;">
                        <span>用户名或密码错误</span>
                    </div>
                    <div class="form-actions">

                        <button type="button" class="btn green pull-right loginSubmit" onclick="checkAndLogin();">

                            登录 <i class="m-icon-swapright m-icon-white"></i>

                        </button>

                    </div>

                </form>
            </div>
        </div>

    <script type="text/javascript">
            function checkAndLogin(){
                var userName = $.trim($('.username').val());
                var password = $.trim($('.password').val());
                $.ajax({
                    type : 'GET',
                    dataType : 'json',
                    contentType : 'application/json',
                    url : BASE_PATH +"/login/check",
                    data : {
                        'userName' : userName,
                        'password' : password
                    },
                    success : function(result){
                        if (result.success) {
                            console.log("登陆成功");
                            window.location.href=  '${BASE_PATH}/index';
                        } else {
                            $('#errorMessage').css('display', 'block');
                            //alert(result.errorMsg)
                            return false;
                        }
                    },
                    error : function(a,b,c){

                    }

                });
            }

    </script>
    </body>
</html>