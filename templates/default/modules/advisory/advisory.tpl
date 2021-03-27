<section class="section-subheader" style="background-image: url({template_location}/images/background/solution-mobile-1.jpg);">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--7">
            <h1 class="heading__title">TƯ VẤN DU HỌC</h1>
        </div>
        <ul class="breadcrumbs">
            <li><a href="{link_home}">Home</a></li>
            <li>Tư vấn du học</li>
        </ul>
    </div>
</section>
<!-- / subHeader -->
<section class="section-description section-description--divider">
    <div class="section-description__top"><span></span><span></span></div>
    <div class="container  animate" data-anim-type="fadeInUp">
        <p class="section-description__content">Không có gì hiệu quả hơn việc học một ngôn ngữ bằng cách sống tại quốc gia bản xứ. Khi đó, bạn sẽ được bao quanh bởi ngôn ngữ đó mỗi ngày, nhanh chóng lưu nhớ cách sử dụng từ vựng, cấu trúc ngữ pháp trong những tình huống chân thật nhất.</p>
    </div>
    <a href="" class="btn animate" data-anim-type="fadeInUp" data-anim-delay="100" title="đăng ký tư vấn" data-toggle="modal" data-target="#registration-form-modal"><i class="fas fa-location-arrow"></i> ĐĂNG KÝ TƯ VẤN</a>
    <a href="" class="see-more-dh btn animate" data-anim-type="fadeInUp" data-anim-delay="140" title="tìm hiểu thêm">TÌM HIỂU THÊM</a>
</section>
<!-- / description -->
<section class="section-mobile" style="background-image: url({template_location}/images/solution-mobile-2.jpg);">
    <div class="container">
        <h2 class=" animate" data-anim-type="cardAnimating">Du học giúp bạn phát triển kỹ năng từ chính trong các trải nghiệm:</h2>
        <div class="boxBuild">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <div class="boxBuild__item boxBuild__item--green animate" data-anim-type="fadeInLeft">
                        <i class="icon_rook"></i>
                        <span>Du học giúp khám phá văn hóa, học hỏi từ các nước phát triển</span>
                    </div>
                    <div class="boxBuild__item boxBuild__item--violet animate" data-anim-type="fadeInLeft" data-anim-delay="100">
                        <i class="icon_group"></i>
                        <span><span>&nbsp&nbsp&nbsp</span>Du học cho phép bạn kết bạn vòng quanh thế giới. </span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <div class="boxBuild__item boxBuild__item--orange animate" data-anim-type="fadeInRight">
                        <i class="icon_cogs"></i>
                        <span>Du học nâng cao khả năng xin được việc làm, tăng giá trị bằng cấp. </span>
                    </div>
                    <div class="boxBuild__item boxBuild__item--blue animate" data-anim-type="fadeInRight" data-anim-delay="100">
                        <i class="icon_lightbulb"></i>
                        <span>Du học giúp bứt phá con đường học thuật. </span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="boxBuild__graphic">
                        <img src="{template_location}/images/solution-mobile-3.png" alt="{template_location}/images/solution-mobile-3.png" class="animate" data-anim-type="zoomIn" data-anim-delay="600">
                        <img src="{template_location}/images/solution-mobile-4.png" alt="{template_location}/images/solution-mobile-4.png" class="animate" data-anim-type="zoomIn">
                    </div>
                </div>
            </div>
        </div>
        <!-- / boxBuild -->
    </div>
</section>

<section class="section-faqs">
    <span class="section-faqs__bg section-faqs__bg--left"></span>
    <span class="section-faqs__bg section-faqs__bg--right"></span>
    <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <!-- START BLOCK : advisory_blog_categories -->
                <li role="presentation" class="{active}">
                    <a href="#{code}" aria-controls="{code}" role="tab" data-toggle="tab">
                        <span>{title}</span>
                    </a>
                </li>
            <!-- END BLOCK : advisory_blog_categories -->
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <!-- START BLOCK : categories -->
                <div role="tabpanel" class="tab-pane {active}" id="{code}">
                    <div class="panel-group" id="{code}-wrap" role="tablist" aria-multiselectable="true">
                        <!-- START BLOCK : advisory_blog -->
                            <div class="panel">
                                <div class="panel-heading" role="tab" id="{code}-h{k}">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#{code}-wrap" href="#{code}-{k}" aria-expanded="true" aria-controls="{code}-{k}">{title}</a>
                                    </h4>
                                </div>
                                <div id="{code}-{k}" class="panel-collapse collapse {in}" role="tabpanel" aria-labelledby="{code}-h{k}">
                                    <div class="panel-body">
                                        {description}
                                        <a href="{link}">Xem thêm</a>
                                    </div>
                                </div>
                            </div>
                        <!-- END BLOCK : advisory_blog -->
                    </div>
                </div>
            <!-- END BLOCK : categories -->
        </div>
        <!-- / Tab panels -->
    </div>
</section>

<!-- / mobile 1 -->
<section class="section-mobile">
    <div class="container">
        <h2>Top quốc gia gợi ý cho bạn đáng để du học nhất thế giới</h2>
        <div class="row">
            <div class="">
                <ul class="listPlanning">
                    <!-- START BLOCK : country -->
                        <li class="col-sm-6 col-md-4 col-md-offset-0 col-lg-3 col-lg-offset-1 animate" data-anim-type="fadeInRight"><span>{title}</span></li>
                    <!-- END BLOCK : country -->
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- / mobile 2 -->
<section class="section-website section-website--2">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 text-center">
                <div class="video animate" data-anim-type="fadeInLeft">
                    <iframe src="https://www.youtube.com/embed/vxXunO2hn58?rel=0&amp;autoplay=0&amp;loop=1" allow="autoplay; encrypted-media" frameborder="0" style="width:100%;margin:0 auto">
                    </iframe>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <p class="animate" data-anim-type="fadeInRight">Canada tự hào có các trường đại học hàng đầu và được đánh giá về chất lượng giảng dạy. Du học Canada sẽ giúp bạn được trải nghiệm chất lượng sống tuyệt vời mà người dân địa phương được hưởng. Canada được quốc tế công nhận là một trong những quốc gia tốt nhất để sống và học tập, vậy bạn còn chờ gì nữa?</p>
                <p class="animate" data-anim-type="fadeInRight" data-anim-delay="100">
                </p>
            </div>
        </div>
    </div>
</section>