<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name=”renderer” content=”webkit” />
    <meta charset="utf-8"/>
    <title>汽车配件销售库存管理</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link href="${BASE_PATH}/frontapp/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${BASE_PATH}/frontapp/media/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${BASE_PATH}/frontapp/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/header_style.css"/>
    <link rel="stylesheet" type="text/css" href="${BASE_PATH}/resources/css/page_content.css"/>

    <script src="${BASE_PATH}/frontapp/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${BASE_PATH}/resources/js/lib/jquery.form.js"></script>
    <script type="text/javascript" src="${BASE_PATH}/resources/js/lib/artTemplate/artTemplate.js"></script>
    <script type="text/javascript" src="${BASE_PATH}/resources/js/lib/artTemplate/artTemplate-plugin.js"></script>
    <script type="text/javascript" src="${BASE_PATH}/resources/js/common/gradm_common.js"></script>

    <script type="text/javascript" src="${BASE_PATH}/resources/js/lib/My97DatePicker/WdatePicker.js"></script>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- BEGIN LOGO -->
            <a class="brand" href="${BASE_PATH}">
                汽车配件销售库存管理
            </a>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
            <#--<img src="${BASE_PATH}/frontapp/media/image/menu-toggler.png" alt=""/>-->
            </a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <ul class="nav pull-right">

                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <#--<img alt="" src="${BASE_PATH}/frontapp/media/image/hello_kitty.jpeg" width="29px" height="29px"/>-->
                        <span class="username">${Session.SESSION_NAME}</span>
                        <span class="caret"></span>
                    <#--<i class="icon-angle-down"></i>-->
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${BASE_PATH}/login/show/uptPwd?id=${Session.SESSION_USER_ID}"><i class="icon-lock"></i> 修改密码</a></li>
                        <li><a href="javascript:void(0)" id="logout"><i class="icon-key"></i> 退出</a></li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
            <!-- END TOP NAVIGATION MENU -->
        </div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="page-container row-fluid">
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div id="portlet-config" class="modal hide">
        <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"></button>
            <h3>Widget Settings</h3>
        </div>
        <div class="modal-body">
            <p>Here will be a configuration form</p>
        </div>
    </div>
    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- BEGIN SIDEBAR1 -->
    <div class="page-sidebar nav-collapse collapse">
        <!-- BEGIN SIDEBAR MENU1 -->
        <ul class="page-sidebar-menu" id="sideBar">


        <script type="text/html" id="sideBarTpl">
            <li>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON ;-->
                <div class="sidebar-toggler hidden-phone"></div>

            </li>

            <% for(var i in templateData){%>
            <% var menu = templateData[i]; %>
            <li <% if(menu.active){ %> class="active" <%}%>>
            <a href="javascript:;">
                <i class="icon-cogs"></i>
                <span class="title"><%=menu.name%></span>
                <span class="selected"></span>
                <span class="arrow <% if(menu.active){ %> open <%}%>"></span>
            </a>
            <ul class="sub-menu">
                <% var childList = menu.childList; %>
                <% for(var j in childList){ %>
                <% var child = childList[j]; %>
                <li <% if(child.active){ %> class="active" <%}%>>
                <a href="${BASE_PATH}<%=child.url%>">
                    <%=child.name%>
                </a>
                </li>
                <%}%>
            </ul>
            </li>
            <%}%>
        </script>


            <!-- END SIDEBAR MENU1 -->
    </div>
    <!-- END SIDEBAR1 -->
