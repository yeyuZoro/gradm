
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
         create by lfl 汽车配件销售库存信息管理
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
    </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<#--<script src="${BASE_PATH}/frontapp/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>-->

<!-- 不要放在jquery-1.10.1.min.js前面! -->
<script src="${BASE_PATH}/frontapp/media/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${BASE_PATH}/frontapp/media/js/app.js"></script>

<script>
    jQuery(document).ready(function () {

        //$('.page-sidebar .ajaxify.start').click() // load the content for the dashboard page.
        $("#logout").click(
                function () {
                    $.ajax({
                        type: 'GET',
                        url: '${BASE_PATH}/login/logout',
                        dataType: 'json',
                        success: function (result) {
                            window.location.href = '${BASE_PATH}/login';
                        }
                    });

                }
        );

        $.ajax({
            type: 'GET',
            url: '${BASE_PATH}/menu/list',
            dataType: 'json',
            data:{path:window.location.pathname},
            success: function (result) {
                var  templateHtml = template.render('sideBarTpl', {'templateData': result.data});
                $('#sideBar').html(templateHtml);
            }
        });
        App.init();

    });

</script>
<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>
