<html lang="zh_CN.UTF-8"><head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- stylesheets -->

    <link href="${BASE_PATH}/frontapp/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${BASE_PATH}/frontapp/media/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${BASE_PATH}/resources/css/login.css" rel="stylesheet" type="text/css"/>
<#--    <link href="resources/bootstrap2/css/login.css" rel="stylesheet">
    <link href="resources/bootstrap2/css/style.css" rel="stylesheet">
    <link href="resources/bootstrap2/css/font-awesome.css" rel="stylesheet">
    <link href="resources/bootstrap2/css/openId.css?20151109" rel="stylesheet">-->

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<#--
    <!--[if lt IE 9]>
    <script type="text/javascript" src="resources/js/html5.js"></script>
    <![endif]&ndash;&gt;

    <!-- favico &ndash;&gt;
    <link rel="shortcut icon" href="resources/images/mitreid-connect.ico">
    <link rel="shortcut icon" href="resources/bootstrap2/img/favicon.ico">

    <!-- Load jQuery up here so that we can use in-page functions &ndash;&gt;
    <script type="text/javascript" src="resources/bootstrap2/js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap2/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap2/js/app.js"></script>
    <script type="text/javascript" src="resources/bootstrap2/js/login.js"></script>
    <script type="text/javascript" src="resources/js/lib/jquery.md5.js"></script>
-->

</head>

<body class="login">

<div id="wrap">


<#--<div id="div1">
    <img style="width:100%;height:100%;z-index:-1;" src="${BASE_PATH}/frontapp/media/image/wallpaper.jpg">
</div>-->


<!-- BEGIN LOGO -->
<div id="div2">
<#--    <div class="logo">

        <img src="resources/images/tqmall.png" alt="">
    </div>-->

    <!-- END LOGO -->

    <!-- BEGIN LOGIN -->

    <div class="content wrapper wrapper_top_s wrapper_top_f">

        <!-- BEGIN LOGIN FORM -->

        <form class="form-vertical login-form" action="" method="POST" novalidate="novalidate">

            <div class="alert alert-error hide">

                <button class="close" data-dismiss="alert"></button>

                <span>Enter any username and password.</span>

            </div>

            <div class="control-group">

                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

                <label class="control-label visible-ie8 visible-ie9"></label>

                <div class="controls">

                    <div class="input-icon left">

                        <i class="icon-user"></i>

                        <input class="username placeholder-no-fix valid" id="j_username" type="text" placeholder="用户名" name="j_username"> </div>

                </div>

            </div>

            <div class="control-group">

                <label class="control-label visible-ie8 visible-ie9"></label>

                <div class="controls">

                    <div class="input-icon left">

                        <i class="icon-lock"></i>

                        <input class="username placeholder-no-fix password" id="j_password" type="password" placeholder="密&nbsp;&nbsp;&nbsp;&nbsp;码">
                        <input id="password" type="hidden" name="j_password">
                    </div>

                </div>

            </div>
            <div id="errorMessage" style="display: none"><span></span></div>
            <div class="form-actions">

                <button type="button" class="btn green pull-right loginSubmit" onclick="checkAndLogin()">

                    登录 <i class="m-icon-swapright m-icon-white"></i>

                </button>

            </div>

        </form>

    </div>
</div>

<#--
function keyDownAction (){
    var j_username = $('#j_username').val();
    if(j_username == ''){
        return ;
    }
    var result = false;
    $.ajax({
        url:"/idp/user/check",
        type:"GET",
        data:{"staffNo":j_username},
        dataType:"json",
        contentType:"application/json",
        async:false,
        success:function(res){
            if(!res.success){
                $('#errorMessage').text(res.errorMsg).css({"color":'red','margin':'0 30px'}).show();
                result = false;
            }else{
                result = true;
            }

        }
    });
    return result;
}

function checkPassword(){
    var j_username = $('#j_username').val();
    var j_password = $.md5($('#j_password').val());
    $("#password").val(j_password);
    var result = false;
    $.ajax({
        url:"/idp/user/checkLogin",
        type:"GET",
        data:{"username":j_username,"password":j_password},
        dataType:"json",
        contentType:"application/json",
        async:false,
        success:function(res){
            if(!res.success){
                $('#errorMessage').text(res.errorMsg).css({"color":'red','margin':'0 30px'}).show();
                result = false;
            }else{
                result = true;
            }

        }
    });
    return result;
}

function checkAndLogin(){
    var result = checkPassword();
    if(!result) return result;
    result = keyDownAction();
    if(!result) return result;
    $('.login-form').submit();
}
</script>-->

<!-- END JAVASCRIPTS -->
<#--

<!-- Placed at the end of the document so the pages load faster &ndash;&gt;
<script type="text/javascript" src="resources/bootstrap2/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/lib/underscore.js"></script>
<script type="text/javascript" src="resources/js/lib/backbone.js"></script>
<script type="text/javascript" src="resources/js/lib/purl.js"></script>
<script type="text/javascript" src="resources/js/lib/bootstrapx-clickover.js"></script>
<script type="text/javascript" src="resources/js/lib/moment.js"></script>
<script type="text/javascript" src="resources/js/lib/bootstrap-sheet.js"></script>
<script type="text/javascript" src="resources/js/lib/bootpag.js"></script>


<script type="text/javascript" src="resources/js/lib/retina.js"></script>
-->


</div>
</body>
</html>