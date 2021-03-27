<section class="section-subheader" style="background-image: url({template_location}/images/faqs-header-bg.jpg);">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--6">
            <h1 class="heading__title">TIN TỨC & SỰ KIỆN</h1>
        </div>
        <ul class="breadcrumbs">
            <li><a href="{link_home}">Home</a></li>
            <li>Blog</li>
        </ul>
        <div class="faqsSearch">
            <h3>What can we help you with?</h3>
            <div class="faqsSearch__inner">
                <input type="text" id="faqsSearch" class="faqsSearch__control" placeholder="Key word..." data-list=".panel-group">
                <!-- <button class="faqsSearch__btn">Search</button> -->
            </div>
        </div>
    </div>
</section>
<!-- / subHeader -->

<section class="section-casestudies" style="padding-top:50px;">
    <!-- / heading -->
    <div class="boxBusiness">
        <div class="container">
            <div class="row">
                <!-- START BLOCK : news -->
                    <div class="col-xs-12 col-md-6 animate" data-anim-type="fadeInUp" data-anim-delay="100">
                        <div class="item-blog">
                            <a href="{link}">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-5">
                                        <img class="img-responsive img-blog" src="{image}" alt="{title}" style="height: 155px;object-fit: contain;">
                                    </div>
                                    <div class="col-xs-12 col-sm-7">
                                        <div class="description-blog">
                                            <div class="news-time">
                                                <h4><i class="far fa-newspaper"></i> Tin Tức</h4>
                                                <p>{created_at}</p>
                                            </div>
                                            <h4 class="title-blog">{title}</h4>
                                            <p>{description}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                <!-- END BLOCK : news -->
            </div>
            <div class="boxCaseStudies__readmore animate" data-anim-type="fadeInUp" data-anim-delay="800">
                <ul class="pagination">
                    <!-- START BLOCK : PAGING -->
                        {paging}
                    <!-- END BLOCK : PAGING -->
                </ul>
            </div>
        </div>
    </div>
    <!-- / box BusinessClient -->
</section>
<!-- / news -->