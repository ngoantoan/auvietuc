<section class="section-subheader section-subheader--down" style="background-image: url({template_location}/images/case-studies-1.jpg);">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--13">
            <h1 class="heading__title">CHƯƠNG TRÌNH ĐÀO TẠO</h1>
        </div>
        <ul class="breadcrumbs">
            <li><a href="link_home">Home</a></li>
            <li>Chương trình đào tạo</li>
        </ul>
        <ul class="breadcrumbs" style="padding-top: 10px;">
            <li>Từ khóa: {keyword}</li>
        </ul>
    </div>
</section>

<section class="section-website section-website--2">
    <div class="container">
        <!-- START BLOCK : education_search -->
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
        <!-- END BLOCK : education_search -->
        <div class="boxCaseStudies__readmore animate" data-anim-type="fadeInUp" data-anim-delay="800">
            <ul class="pagination">
                <!-- START BLOCK : PAGING -->
                    {paging}
                <!-- END BLOCK : PAGING -->
            </ul>
        </div>
        <!-- START BLOCK : NOT-FOUND -->
            <h3 style="text-align: center;">Không tim thấy khóa học</h3>
        <!-- END BLOCK : NOT-FOUND -->
    </div>
</section>
<!-- / mobile 2 -->