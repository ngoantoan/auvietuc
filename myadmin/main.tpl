<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin zone</title>
    <link rel="stylesheet" type="text/css"
          href="{location}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="{location}/css/ui.jqgrid-bootstrap.css"/>
    <link type="text/css" rel="stylesheet"
          href="{location}/css/bootstrap-datetimepicker.min.css"/>
    <link href="{location}/css/select2.min.css" rel="stylesheet" />
    <link href="{location}/css/jquery.steps.css" rel="stylesheet" />
    <link href="{location}/css/normalize.css" rel="stylesheet" />
    <link href="{location}/css/sweetalert2.min.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="{location}/css/admin.css"/>
    <script>var ckfinder_path = '{ckfinder_path}',ckeditor_path = '{ckeditor_path}', site_folder = '{site_folder}'; 
            var server_url = '{server_url}';</script>
    <script src="{location}/js/jquery.min.js" type="text/javascript"></script>
    <script src="{location}/js/bootstrap.min.js"></script>
    <script src="{location}/js/moment.min.js" type="text/javascript"></script>
    <script src="{location}/js/bootstrap-datetimepicker.js"
            type="text/javascript"></script>
     <script src="{location}/js/i18n/grid.locale-en.js" type="text/javascript"></script>
    <script src="{location}/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <!--script src="//cdn.ckeditor.com/4.5.4/full/ckeditor.js"></script-->
    <script src="../editor/ckeditor.js"></script>
    <script src="../editor/filemanagement/ckfinder.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="{location}/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <script src="{location}/js/select2.min.js"></script>
    <script src="{location}/js/accounting.min.js"></script>
    <script src="{location}/js/sweetalert2.min.js"></script>
    <script src="{location}/js/main.js" type="text/javascript"></script>

    <style>
        #myModal, .modal-open{
            padding-right: 0 !important;
        }

    </style>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-custom">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="menu-header1">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a target="_blank" href="#" class="navbar-brand custom-logo">
                    <span class="title-logo">Âu Việt Úc</span>
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="link_website"><a  target="_blank" href="../" >Xem website <i class="glyphicon glyphicon-share" aria-hidden="true"></i></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
                                    class="glyphicon glyphicon-user"></span>  <strong>{BACKEND_USERNAME}</strong> <span class="caret"></span> </a>
                        <ul class="dropdown-menu">
                            <!--li>
                                <a href="?q=infosetting">Cấu hình thông tin</a>
                            </li>

                            <li>
                                <a href="?q=pages">Quản lý trang</a>
                            </li>
                            <li>
                                <a href="?q=contact">Quản lý góp ý</a>
                            </li-->
                            <!-- START BLOCK : superadmin -->
                                <li>
                                    <a href="?q=user">Tài khoản</a>
                                </li>
                            <!-- END BLOCK : superadmin -->
                            
                            <li>
                                <a href="?q=change_password">Đổi mật khẩu</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="?q=logout" >Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div  id="img_load_gif" class=" hidden">
    <img id="loading-img" src="{site_folder}/myadmin/images/Gear.svg" alt="" >
    </div>
    <div class="collapse navbar-collapse menu">
        <ul class="nav navbar-nav">
            <li class="dropdown {product_active} {product_category_active}">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Giới thiệu<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?q=about_us">Giới thiệu</a>
                    </li>
                    <li>
                        <a href="?q=opinion">Ý kiến</a>
                    </li>
                    <li>
                        <a href="?q=job">Tuyển dụng</a>
                    </li>
                </ul>
            </li>
            
            <li class="{contact_active}">
                <a href="?q=contact">Liên hệ</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tin tức<span class="caret"></span> </a>
                <ul class="dropdown-menu">

                    <li>
                        <a href="?q=news_items">Tin tức</a>
                    </li>
                    <li>
                        <a href="?q=tag_blog">Thẻ tag</a>
                    </li>
                </ul>
            </li>

            <li class="dropdown {banner_active} {gallery_active}">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Media<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li><a href="?q=slider">Slider</a></li>
                    <li><a href="?q=communicate_confidently">Video</a></li>
                    <li><a href="?q=student">Ảnh góc học viên</a></li>
                    <li><a href="?q=slider_audio">slider audio</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">CT đào tạo<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?q=education_program">Chương trình đào tạo</a>
                    </li>
                    <li>
                        <a href="?q=education_video">Video</a>
                    </li>
                    <li>
                        <a href="?q=tag_education">Thẻ tag</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Triết lý giáo dục<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?q=philosophy">Triết lý giáo dục trang chủ</a>
                    </li>
                    <li>
                        <a href="?q=advisory_text">Form triết lý giáo dục</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Du học<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?q=advisory">Tư vấn du học</a>
                    </li>
                    <li>
                        <a href="?q=country">Quốc gia</a>
                    </li>
                    <li>
                        <a href="?q=advisory_blog">Tin tức tư vấn du học</a>
                    </li>
                    <li>
                        <a href="?q=advisory_blog_categories">Danh mục tin tức tư vấn du học</a>
                    </li>
                </ul>
            </li>
            <li class="{project_active}">
                <a href="?q=study_space">Góc học tập</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Comments<span class="caret"></span> </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="?q=comments_education">Comments khóa học</a>
                    </li>
                    <li>
                        <a href="?q=comments_blog">Commnets Tin Tức</a>
                    </li>
                </ul>
            </li>
            <li class="{project_active}">
                <a href="?q=member">Người dùng</a>
            </li>
        </ul>
        <!--ul class="nav navbar-nav navbar-right">
            <li class="{htkh_active}"><a  href="?q=htkh" ><i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i> Hỗ trợ</a></li>
        </ul-->
    </div>

    <div class="clearfix"></div>
    <div class="clearfix" style="width:100%; padding: 0 15px 15px 15px;">
        {CONTAINER}
    </div>
</div>
<div class="modal fade" id="myModal" style="background-color: #fff; ">
    <div class="modal-body">
        Loading content...
    </div>
</div>
<footer>
    <div style="width:100%; padding: 0;">
        ATA 2020. All rights reserved.
    </div>
</footer>
</body>
<script>
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexString = "[\\?&]" + name + "=([^&#]*)";
        var regex = new RegExp(regexString);
        var found = regex.exec(window.location.search);
        if (found == null)
            return "";
        else
            return decodeURIComponent(found[1].replace(/\+/g, " "));
    };
</script>

<script src="{location}/js/jquery.validate.min.js"></script>
<script src="{location}/js/modernizr-2.6.2.min.js"></script>
<script src="{location}/js/jquery.form.js"></script>
<script src="{location}/js/jquery.steps.js"></script>
</html>