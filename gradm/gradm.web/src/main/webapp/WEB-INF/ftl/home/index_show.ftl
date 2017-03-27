<#include "layout/header.ftl">
<!-- BEGIN CONTAINER -->
<!-- BEGIN PAGE -->
<div class="page-content">
    <ul class="breadcrumb" style="clear:both;">
        <li>
            <i class="icon-home"></i>
            <a href="#">首页</a>
        </li>
        <li style="float:right;">
            <button type="button" style="padding:0px 5px" class="btn blue" onclick="window.history.go(-1)">返回</button>
        </li>
    </ul>
    <!-- BEGIN PAGE CONTAINER-->
    <div class="container-fluid">
        <!-- BEGIN PAGE HEADER-->
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                <h3 class="page-title">
                    欢迎光临！
                    <small>汽车配件销售库存管理</small>
                </h3>
                <!-- END PAGE TITLE & BREADCRUMB-->
                <div class="message-content">
                    <p class="p1">&nbsp;</p>

                    <p class="p1">
                        本系统后端使用Mybatis+Spring+Springmvc框架，系统前端使用ArtTemplate.js模板引擎异步渲染页面，jQuery用于一般的页面处理,前端布局主要HTML+CSS，部分布局bootstrap2。</p>




                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN PAGE -->
</div>
<!-- END CONTAINER -->
<#include "layout/footer.ftl" >