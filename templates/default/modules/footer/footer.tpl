</div>
<section class="bottom">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <img src="{template_location}/images/logo-footer.png" alt="{template_location}/images/logo-footer.png">
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h2 class="bottom__title"><a href="{link_about_us}">Giới Thiệu Về EVAS</a></h2>
                <ul class="bottom__menu">
                    <li><a href="{link_education_program}">Các Khóa Học</a></li>
                    <li><a href="{link_study_space}">Góc Học Tập</a></li>
                    <li><a href="{link_communicate_confidently}">Tự Tin Giao Tiếp</a></li>
                    <li><a href="{link_study_abroad}">Tư Vấn Du Học</a></li>
                    <li><a href="{link_blog}">Tin Tức & Sự Kiện</a></li>
                    <li><a href="{link_job}">Cơ Hội Nghề Nghiệp</a></li>

                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h2 class="bottom__title">Chi Nhánh 1</h2>
                <ul class="bottom__menu">
                    <li><i class="fas fa-map-marker-alt"></i> 79 Trần Hưng Đạo, P.Mỹ Xuyên, TP.Long Xuyên - AG</li>
                    <li><i class="far fa-envelope"></i> evas2@auvietuc.edu.vn</li>
                    <li><i class="fas fa-phone"></i> <span>02963 941 780</span></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <h2 class="bottom__title">Chi Nhánh 2</h2>
                <ul class="bottom__menu">
                    <li><i class="fas fa-map-marker-alt"></i> 328/4 Hùng Vương, P.Mỹ Long, TP.Long Xuyên - AG</li>
                    <li><i class="far fa-envelope"></i> evas3@auvietuc.edu.vn</li>
                    <li><i class="fas fa-phone"></i> <span>02963 533 666</span></li>
                </ul>
                <ul class="bottom__menu" style="margin-top: 40px;position: inherit;width: 300px;">
                    <li>Hotline: <span>02963 941 780</span> - <span>0949 949 226</span> (Ms.Mỹ) - Dịch vụ khách hàng</li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- / bottom -->

<footer class="footer">
    <a href="" class="footer__call"><i class="fas fa-angle-up"></i></a>
    <div class="sticky-bar">
        <a href="{link_education_program}"><i class="icon_search"></i></a>
        <a href="tel:+842963941780"><i class="fas fa-phone-volume"></i><small>02963.941.780</small></a>
        <a data-toggle="modal" data-target="#registration-form-modal"><i class="far fa-envelope"></i><span>ĐĂNG KÝ HỌC</span></a>
    </div>
    <div class="container">
        <div class="footer__contact">
            <ul>
                <li><i class="icon_building"></i>Trụ sở: 815-816 Hà Hoàng Hổ, P.Đông Xuyên, TP. Long Xuyên - An Giang (Vietnam)</li>
                <li><i class="icon_phone"></i> <a href="tel:+842963941780">|+84| 02963 941 780</a> or <a href="tel:+842963666888">|+84| 02963 666 888</a></li>
                <li><i class="icon_mail"></i> <a href=""><span class="__cf_email__">evas@auvietuc.edu.vn</span></a></li>
            </ul>
        </div>
        <div class="footer__social">
            <!-- <p>We created this website in 2017</p> -->
            <a href="https://www.facebook.com/ngoainguauvietuc" class="social_facebook" target="_bank"></a>
            <a href="" class="social" target="_bank"><i class="fab fa-instagram"></i></a>
            <a href="https://www.youtube.com/channel/UCd_CSM5xT--PyCqQrKhEG4w" class="social" target="_bank"><i class="fab fa-youtube"></i></a>
            <a href="" class="social" target="_bank"><img src="{template_location}/images/background/zalo.png" style="width: 14px" alt=""></a>
        </div>
    </div>
</footer>
<!--/ footer-->

<div class="slideMenu">
    <div class="slideMenu__inner">
        <ul class="slideMenu__nav">
            <li class="active"><a href="{link_home}">Home</a></li>
            <li class="hasChild">
                <a href="{link_about_us}">GIỚI THIỆU VỀ EVAS</a>
                <ul class="sub">
                    <li><a href="{link_about_us}">PHƯƠNG PHÁP ĐÀO TẠO</a></li>
                    <li><a href="{link_base_system}">HỆ THỐNG CƠ SỞ</a></li>
                </ul>
            </li>
            <li class="hasChild">
                <a href="{link_education_program}">Chương trình đào tạo</a>
                <ul class="sub">
                    <!-- START BLOCK : education_program -->
                        <li><a href="{link}">{title}</a></li>
                    <!-- END BLOCK : education_program -->
                </ul>
            </li>
            <li>
                <a href="{link_study_space}" target="">Góc học tập</a>
            </li>
            <li class="hasChild">
                <a href="{link_communicate_confidently}">GÓC HỌC VIÊN</a>
                <ul class="sub">
                    <li><a href="{link_communicate_confidently}">HỌC QUA VIDEO</a></li>
                    <li><a href="{link_student}">VINH DANH HỌC VIÊN</a></li>
                </ul>
            </li>
            <li>
                <a href="{link_study_abroad}">Tư vấn du học</a>
            </li>
            <li>
                <a href="{link_blog}">Blog</a>
            </li>
            <li>
                <a href="{link_job}">Tuyển dụng</a>
            </li>
            <li>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#registration-form-modal"><i class="fas fa-location-arrow"></i> Liên hệ ngay</button>
            </li>
        </ul>
    </div>
</div>
<!-- / slide Menu -->

<!-- Modal -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <input type="text" class="form-control" placeholder="Search...">
            </div>
        </div>
    </div>
</div>

<!-- Modal contact -->
<div class="modal fade" id="registration-form-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">ĐĂNG KÝ TƯ VẤN ĐỂ NHẬN LỘ TRÌNH HỌC</h4>
        </div>
        <div class="modal-body">
        <form action="">
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <input type="text" id="name_footer" placeholder="Tên học viên *">
                </div>
                <div class="col-xs-12 col-md-6">
                    <input type="text" id="birthday_footer" placeholder="Ngày tháng sinh (dd/mm/yyyy)">
                </div>
                <div class="col-xs-12 col-md-6">
                    <input type="text" id="email_footer" placeholder="Email">
                </div>
                <div class="col-xs-12 col-md-6">
                    <input type="text" id="address_footer" placeholder="Địa chỉ">
                </div>
                <div class="col-xs-12 col-md-6">
                    <input type="text" id="phone_footer" placeholder="Số điện thoại *">
                </div>
                <div class="col-xs-12 col-md-6">
                    <select name="education_program_footer" id="education_program_footer">
                        <!-- START BLOCK : form -->
                            <option>{title}</option>
                        <!-- END BLOCK : form -->
                    </select>
                </div>
                <div class="col-xs-12">
                    <textarea name="body" id="body_footer" cols="30" rows="5" placeholder="Thông tin về nhu cầu học..."></textarea>
                </div>
                <div class="col-xs-12">
                    <button onclick="ajaxRegisterContactFooter()" class="btn btn-submit-registration" style="float: right;" data-dismiss="modal" aria-label="Close"><i class="fas fa-paper-plane"></i><span>GỬI THÔNG TIN</span></button>
                </div>
                <div class="col-xs-12">
                    <div class="contact-modal">
                        <h4>TRUNG TÂM ANH NGỮ QUỐC TẾ ÂU VIỆT ÚC</h4>
                        <p class="phone"><i class="fas fa-phone-volume"></i> <a href="tel:+842963941780">|+84| 02963 941 780</a> or <a href="tel:+842963666888">|+84| 02963 666 888</a></p>
                        <p class="email"><i class="icon_mail"></i> <a href=""><span class="__cf_email__">auvietuclongxuyenag@gmail.com</span></a></p>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </div>
    </div>
</div>
<!-- Modal contact -->

<!-- Modal register -->
<div class="modal fade" id="form-register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document" style="width: 600px;">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">ĐĂNG KÝ TÀI KHOẢN</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div style="color: red; text-align: center;" class="error-register"></div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <span style="color: red;" class="error-name-register"></span>
                            <input type="text" id="name_register" placeholder="Họ tên *">
                        </div>
                        <div class="col-xs-12 col-md-12">
                            <span style="color: red;" class="error-email-register"></span>
                            <input type="email" id="email_register" placeholder="Email *">
                        </div>
                        <div class="col-xs-12 col-md-12">
                            <span style="color: red;" class="error-password-register"></span>
                            <input type="password" id="password_register" placeholder="Password *">
                        </div>
                        <div class="col-xs-12 col-md-12">
                            <input type="text" id="address_register" placeholder="Địa chỉ">
                        </div>
                        <div class="col-xs-12 col-md-12">
                            <input type="text" id="phone_register" placeholder="Số điện thoại *">
                        </div>
                        <div class="col-xs-12">
                            <a id="btn-register" class="btn btn-submit-registration" style="float: right;"><i class="fas fa-paper-plane"></i><span>Đăng ký</span></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal register -->

<!-- Modal login -->
<div class="modal fade" id="form-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document" style="width: 600px; padding-top: 50px;">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">ĐĂNG NHẬP</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div style="color: red; text-align: center;" class="error-login"></div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <span style="color: red;" class="error-email-login"></span>
                            <input type="email" id="email_login" placeholder="Email *">
                        </div>
                        <div class="col-xs-12 col-md-12">
                            <span style="color: red;" class="error-password-login"></span>
                            <input type="password" id="password_login" placeholder="Password *">
                        </div>
                        <div class="col-xs-12">
                            <a id="btn-login" class="btn btn-submit-registration" style="float: right;"><i class="fas fa-paper-plane"></i><span>Đăng nhập</span></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal login -->

<div class="modal fade" id="watching-video" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
            <div class="video">
                <iframe src="https://www.youtube.com/embed/U2px_x3elZI?rel=0&amp;autoplay=0&amp;loop=1" allow="autoplay; encrypted-media" frameborder="0" style="width:100%;margin:0 auto">
                </iframe>
            </div>
        </div>
    </div>
    </div>
</div>

<div class="modal fade" id="watching-video-upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
            <div class="video" id="video_upload_modal">
                
            </div>
        </div>
    </div>
    </div>
</div>