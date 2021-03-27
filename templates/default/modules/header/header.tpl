<div class="header-top">
    <ul>
        <li class="website"><a href="tel:+842963941780">Hotline: |+84| 02963 941 780</a></li>
        <li class="website"><a href=""><span class="__cf_email__">evas@auvietuc.edu.vn</span></a></li>
        <li><a href="https://www.facebook.com/ngoainguauvietuc"><i class="fab fa-facebook-f"></i></a></li>
        <li><a href="https://www.youtube.com/channel/UCd_CSM5xT--PyCqQrKhEG4w"><i class="fab fa-youtube"></i></a></li>
    </ul>
    <ul>
        <!-- START BLOCK : Logout -->
            <li><a>{name}</a></li>
            <li><a href="javascript:void(0)" id="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
        <!-- END BLOCK : Logout -->
        <!-- START BLOCK : Login -->
            <li><a href="" class="btn-check-login" data-toggle="modal" data-target="#form-login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a></li>
            <li><a href="" class="btn-check-login" data-toggle="modal" data-target="#form-register"><i class="fas fa-sign-in-alt"></i> Đăng ký</a></li>
        <!-- END BLOCK : Login -->
    </ul>
</div>
<div class="header__left">
    <a class="header__logo" href="{link_home}" class="navbar-brand" title="auvietuc"><img src="{template_location}/images/logo.png" alt="auvietuc.edu.vn"></a>
</div>
<!--Nav Header-->
<nav class="header__right">
    <ul class="nav">
        <li class="hasChild {home}"><a href="{link_home}">Home</a></li>
        <li class="hasChild {gioi_thieu_evas}">
            <a href="{link_about_us}">GIỚI THIỆU VỀ EVAS</a>
            <ul class="sub">
                <li><a href="{link_about_us}">PHƯƠNG PHÁP ĐÀO TẠO</a></li>
                <li><a href="{link_base_system}">HỆ THỐNG CƠ SỞ</a></li>
            </ul>
        </li>
        <li class="hasChild {chuong_trinh_dao_tao}">
            <a href="{link_education_program}">Chương trình đào tạo</a>
            <ul class="sub">
                <!-- START BLOCK : education_program -->
                    <li><a href="{link}">{title}</a></li>
                <!-- END BLOCK : education_program -->
            </ul>
        </li>
        <li class="hasChild {goc_hoc_tap}">
            <a href="{link_study_space}" target="">Góc học tập</a>
        </li>
        <li class="hasChild {tu_tin_giao_tiep}">
            <a href="{link_communicate_confidently}">GÓC HỌC VIÊN</a>
            <ul class="sub">
                <li><a href="{link_communicate_confidently}">HỌC QUA VIDEO</a></li>
                <li><a href="{link_student}">VINH DANH HỌC VIÊN</a></li>
            </ul>
        </li>
        <li class="hasChild {tu_van_du_hoc}">
            <a href="{link_study_abroad}">Tư vấn du học</a>
        </li>
        <li class="hasChild {tin_tuc}">
            <a href="{link_blog}">Blog</a>
        </li>
        <li class="hasChild {tuyen_dung}">
            <a href="{link_job}">Tuyển dụng</a>
        </li>
    </ul>
    <!-- / nav -->
    <div class="header__tools">
        <a class="header__tools__submit btn btn-danger" data-toggle="modal" data-target="#registration-form-modal"><i class="fas fa-location-arrow"></i> Liên hệ ngay</a>
        <form action="#" class="header__tools__search dropdown">
            <!--a class="btn dropdown-toggle" type="button" id="dropdownSearch" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <i class="icon_search"></i>
            </a-->
            <div class="dropdown-menu" aria-labelledby="dropdownSearch">
                <input type="text" class="form-control" placeholder="Search">
                <button class="btn"><i class="icon_search"></i></button>
            </div>
        </form>
        <a href="#" class="header__tools__menu"><span></span><span></span><span></span><span></span></a>
    </div>
</nav>
<!--/ main menu-->