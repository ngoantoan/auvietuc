
<section class="section-subheader section-subheader--career" style="background-image: url({template_location}/images/careers-1.jpg);">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--9">
            <h1 class="heading__title">TIN TỨC & SỰ KIỆN</h1>
        </div>
        <ul class="breadcrumbs">
            <li><a href="{link_home}">Home</a></li>
            <li><a href="{link_blog}">Blog</a></li>
            <li>{title}</li>
        </ul>
    </div>
    <div class="section-description__bottom"></div>
</section>
<!-- / subHeader -->
<section class="section-careerPositions">
    <div class="container">
        <div class="careerPositions">
            <div class="row">
                <div class="col-xs-12 col-md-8">
                    <h2 class="careerPositions__title product-title">{title}</h2>
                    <div class="txt-product-detail">{detail}</div>
                    <ul class="tag-kh">
                        <li><a href="javascript:void(0)"><i class="fas fa-tag"></i> tag</a></li>
                        <!-- START BLOCK : tag -->
                            <li><a href="{link_tag}">{title}</a></li>
                        <!-- END BLOCK : tag -->
                    </ul>
                    <div class="comment-area visible-md visible-lg">
                        <div class="title-comment">
                            <h4>Bình luận & đánh giá</h4>
                            <div id="fb-share-button"><a href="javascript:void(0)"><i class="fab fa-facebook-f"></i> Share facebook</a></div>
                        </div>
                        <div class="list-comment" id="list-comment">
                            <!-- START BLOCK : comments -->
                                <div class="item-comment">
                                    <h4><span>{name}</span> - <small>{created_at}</small></h4>
                                    <p class="txt-comment">{contents}</p>
                                </div>
                            <!-- END BLOCK : comments -->
                        </div>
                        <div class="see-more-comment">
                            <div class="hidden" id="idComment">{id_comment}</div>
                            <a href="javascript:void(0)" id="load-comment-blog"><i class="fas fa-angle-down"></i> xem thêm bình luận</a>
                        </div>
                        <div class="form-comment">
                            <h4>Tham gia bình luận:</h4>
                            <form onsubmit="return false;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea name="content" id="content" rows="3" placeholder="Nội dung bình luận..."></textarea>
                                    </div>
                                    <div class="row">
                                    <div class="col-md-7">
                                        <a class="btn-check-login hidden" data-toggle="modal" data-target="#form-register"><button style="background-color: #9f2323; color: #fff;" class="btn"> Đăng ký</button></a>
                                        <a class="btn-check-login hidden" data-toggle="modal" data-target="#form-login"><button style="background-color: #9f2323; color: #fff;" class="btn"> Đăng Nhập</button></a>
                                    </div>
                                    <div class="col-md-5">
                                        <button class="btn" onclick="comment_blog('{id}')"><i class="far fa-paper-plane"></i> Comment</button>
                                    </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <h5 class="title-sidebar">CÓ THỂ BẠN QUAN TÂM</h5>
                    <!-- START BLOCK : news -->
                        <div class="item-blog">
                            <a href="{link}">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <img class="img-responsive img-blog" src="{image}" alt="{title}">
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="description-blog">
                                            <div class="news-time">
                                                <h4><i class="far fa-newspaper"></i> Tin Tức</h4>
                                                <p>{created_at}</p>
                                            </div>
                                            <h4 class="title-blog">{title}</h4>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>  
                    <!-- END BLOCK : news -->   
                </div>
            </div>
            <!-- / listing -->
        </div>
        <!-- / careerPositions -->
    </div>
</section>
<!-- / careerPositions section -->
<section class="section-cta section-cta--career">
    <div class="container">
        <div class="section-cta__inner animate" data-anim-type="cardAnimating" data-anim-delay="200" style="background-image: url({template_location}/images/cta-2.jpg);">
            <h3>Sometimes the questions are complicated and the answers are simple.</h3>
            <a class="btn btn-danger" data-toggle="modal" data-target="#registration-form-modal"><i class="fas fa-location-arrow"></i> ĐĂNG KÝ TƯ VẤN</a>
        </div>
        <div class="careerPositions">
            <div class="careerPositions__list">
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="200">
                        <a href="quality-assurance-team-leader/index.html" class="careerPositions__item__title  careerPositions__item__title--Senior"><span>Anh văn mẫu giáo</span><small>4 đến 6 tuổi</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">01</span>

                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="300">
                        <a href="app-bugs-finder/index.html" class="careerPositions__item__title careerPositions__item__title--Junior"><span>Anh văn thiếu nhi</span><small>Cambridge Stars</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">02</span>

                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="400">
                        <a href="php-laravel-developer/index.html" class="careerPositions__item__title careerPositions__item__title--Junior"><span>Anh Văn Thiếu Niên</span><small>KET & PET</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">03</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="500">
                        <a href="business-analyst/index.html" class="careerPositions__item__title careerPositions__item__title--Senior"><span>Tiếng anh giao tiếp</span><small>Người mất gốc</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">04</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="600">
                        <a href="mobile-application-designer/index.html" class="careerPositions__item__title"><span>Luyện thi IELTS</span><small>Cam kêt đầu ra</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">05</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="700">
                        <a href="application-content-manager/index.html" class="careerPositions__item__title careerPositions__item__title--Junior "><span>Luyện thi TOEIC</span><small>Cam kêt đầu ra</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">06</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="800">
                        <a href="client-account-manager/index.html" class="careerPositions__item__title"><span>Tiếng anh theo yêu cầu</span><small>Thời gian linh hoạt</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">07</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
                <div class="careerPositions__item">
                    <div class="careerPositions__item__inner animate" data-anim-type="fadeInUp" data-anim-delay="900">
                        <a href="cross-platform-developer/index.html" class="careerPositions__item__title careerPositions__item__title--Senior"><span>Khung ngoại ngữ 6 bậc</span><small>VSTEP</small></a>
                        <div class="careerPositions__item__vacancies">
                            <span class="careerPositions__item__vacancies__number">08</span>
                        </div>
                    </div>
                </div>
                <!-- / item -->
            </div>
            <!-- / listing -->
        </div>
        <!-- / careerPositions -->
    </div>
</section>
<!-- / CTA -->

</div>

<script>
	var fbButton = document.getElementById('fb-share-button');
	var url = window.location.href;

	if (fbButton) {
		fbButton.addEventListener('click', function() {
			window.open('https://www.facebook.com/sharer/sharer.php?u=' + url,
				'facebook-share-dialog',
				'width=800,height=600'
			);
			return false;
		});
	}
</script>