<section class="section-subheader" style="background-image: url({template_location}/images/case-studies-1.jpg);">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--7">
            <h1 class="heading__title">CHƯƠNG TRÌNH ĐÀO TẠO</h1>
        </div>
        <ul class="breadcrumbs">
            <li><a href="{link_home}">Home</a></li>
            <li><a href="{link_education_program}">Chương trình đào tạo</a></li>
            <li>{education_title}</li>
        </ul>
    </div>
</section>
<!-- / subHeader -->
<section class="section-description section-description--divider">
    <div class="section-description__top"><span></span><span></span></div>
    <div class="container  animate" data-anim-type="fadeInUp" style="margin: 0 auto;font-size: 1.14285714em;line-height: 1.875;">
        <p style="text-align: center;"><span style="font-size:18px"><strong>{education_title}</strong></span></p>
        {education_description1}
        <p class="section-description__content"></p>
    </div>
    <a href="" class="btn animate" data-anim-type="fadeInUp" data-anim-delay="100" title="đăng ký tư vấn" data-toggle="modal" data-target="#registration-form-modal"><i class="fas fa-location-arrow"></i> ĐĂNG KÝ TƯ VẤN</a>
    <a href="" class="see-more-dh btn animate" data-anim-type="fadeInUp" data-anim-delay="140" title="tìm hiểu thêm">TÌM HIỂU THÊM</a>
</section>

<section class="section-faqs">
    <span class="section-faqs__bg section-faqs__bg--left"></span>
    <span class="section-faqs__bg section-faqs__bg--right"></span>
    <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <!-- START BLOCK : education_blog_categories -->
                <li role="presentation" class="{active}">
                    <a href="#{code}" aria-controls="{code}" role="tab" data-toggle="tab">
                        <span>{title}</span>
                    </a>
                </li>
            <!-- END BLOCK : education_blog_categories -->
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <!-- START BLOCK : categories -->
                <div role="tabpanel" class="tab-pane {active}" id="{code}">
                    <div class="panel-group" id="{code}-wrap" role="tablist" aria-multiselectable="true">
                        <!-- START BLOCK : education_blog -->
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
                        <!-- END BLOCK : education_blog -->
                    </div>
                </div>
            <!-- END BLOCK : categories -->
        </div>
        <!-- / Tab panels -->
    </div>
</section>

<!-- / mobile 2 -->
<section class="section-website section-website--2">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 text-center">
                <div class="video animate" data-anim-type="fadeInLeft">
                    <iframe src="https://www.youtube.com/embed/{link_video}" allow="autoplay; encrypted-media" frameborder="0" style="width:100%;margin:0 auto">
                    </iframe>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <p class="animate" data-anim-type="fadeInRight">{description_video}</p>
            </div>
        </div>
    </div>
</section>