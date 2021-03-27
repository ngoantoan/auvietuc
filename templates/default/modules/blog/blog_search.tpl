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
            <h3>Từ khóa: {keyword}</h3>
        </div>
    </div>
</section>

<section class="section-website section-website--2">
    <div class="container">
        <!-- START BLOCK : blog_search -->
            <div class="study-space-item">
                <div class="row">
                    <div class="col-sm-12 col-md-4">
                        <a href="{link}">
                            <div class="text-center">
                                <img class="animate" data-anim-type="fadeInLeft" data-anim-delay="200" src="{image}" alt="{title}">
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md-8">
                        <a href="{link}">
                            <h3 class="h2 text-light text-color mt-0 mb-0 animate" data-anim-type="fadeInRight">{title}</h3>
                            <p class="animate" data-anim-type="fadeInRight">{description}</p>
                        </a>
                    </div>
                </div>
            </div>
        <!-- END BLOCK : blog_search -->
        <div class="boxCaseStudies__readmore animate" data-anim-type="fadeInUp" data-anim-delay="800">
            <ul class="pagination">
                <!-- START BLOCK : PAGING -->
                    {paging}
                <!-- END BLOCK : PAGING -->
            </ul>
        </div>
        <!-- START BLOCK : NOT-FOUND -->
            <h3 style="text-align: center;">Không tìm thấy tin tức</h3>
        <!-- END BLOCK : NOT-FOUND -->
    </div>
</section>
<!-- / mobile 2 -->