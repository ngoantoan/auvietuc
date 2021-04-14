<section class="section-subheader" style="background-color: #cc2324;">
    <div class="container">
        <div class="heading heading--gradient heading--gradient--7">
            <h1 class="heading__title" style="letter-spacing: 5px;font-family: 'iCiel-Crocante', cursive;font-size: 3.857143em;">
                <img src="http://www.auvietuc.edu.vn/upload/images/evas.png" style="height: 7rem;" alt="">
                PICTURE DICTIONARY
            </h1>
        </div>
    </div>
</section>
<section class="section-description section-description--divider">
    <div class="section-description__top"><span></span><span></span></div>
    <div class="container  animate" data-anim-type="fadeInUp">
        <p class="section-description__content">Không có gì hiệu quả hơn việc học một ngôn ngữ bằng cách sống tại quốc gia bản xứ. Khi đó, bạn sẽ được bao quanh bởi ngôn ngữ đó mỗi ngày, nhanh chóng lưu nhớ cách sử dụng từ vựng, cấu trúc ngữ pháp trong những tình huống chân thật nhất.</p>
    </div>
</section>
<div class="section-description section-description--divider">
    <div class="album-area" style="z-index: 49;">
        <div class="button-filter animate" data-anim-type="fadeInUp">
            <ul style="max-width: 900px;margin-left: auto;margin-right: auto;">
                <!-- START BLOCK : slider_audio_parent_categories -->
                    <li><a href="{link_audio_parent_categories}" class="filter-button {active_parent_category}" data-filter="{code}">{title}</a></li>
                <!-- END BLOCK : slider_audio_parent_categories -->
            </ul>
        </div>
    </div>
    
    <div class="row block-audio" style="z-index: 48;">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-12 col-sm-12 col-md-12" style="padding-left: unset;">
                <div class="col-xs-12 col-sm-3 col-md-3" style="padding-left: unset;padding-right: unset;">
                    <div class="powerpoint-left-top">
                        <img src="http://www.auvietuc.edu.vn/upload/images/powerpoint-left-top.png">
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 title-audio-parent-category">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <span>{title_parent_category}</span>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                    <form action="javscript:void(0)" id="form-search">
                        <input type="text" id="search" placeholder="Search..." autocomplete="off"/>
                        <a><i class="fa fa-search"></i></a>
                    </form>
                </div>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3 powerpoint-left">
                <div class="powerpoint-left-bottom">
                    <ul class="list-audio-category">
                        <!-- START BLOCK : slider_audio_categories -->
                            <li><a href="{link_audio_categories}" class="{active_category}">{title}</a></li>
                        <!-- END BLOCK : slider_audio_categories -->
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-9 block-slider-audio">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 slider-image-audio" style="background:#f1f6fa;height:490px;padding: 0;">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner" style="height: 490px;">
                                <!-- START BLOCK : slider_audio -->
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-12 col-md-12 background-item" style="background-image: url({image});">
                                            <div class="carousel-caption">
                                                <h3 class="title-audio">{title}</h3>
                                                <p>
                                                    <i class="fa fa-volume-up volume-down-{code}" onclick="playAudio('{code}')"></i>
                                                    <i class="fa fa-volume-up volume-up-{code}" onclick="stopAudio('{code}')" style="display:none;"></i>
                                                    <span class="spelling">{spelling}</span>
                                                    <audio id="{code}" src="{mp3}"></audio>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 description-audio">
                                            <span>{description}</span>
                                        </div>
                                    </div>
                                <!-- END BLOCK : slider_audio -->
                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 footer-slider-audio">
                <div class="row">
                    <div class="col-xs-12 col-sm-9 col-md-9 col-md-offset-3" style="padding-top: 8px;">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <button type="button" href="#carousel-example-generic" data-slide="prev" onclick="stopAllAudio()" class="btn back">BACK</button>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <button type="button" href="#carousel-example-generic" data-slide="next" onclick="stopAllAudio()" class="btn next">NEXT</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<style>
    .block-audio {
        top: -70px;
    }
    .title-audio-parent-category {
        background:#cc2324;
        height:50px;
        text-align: left;
    }

    .title-audio-parent-category span {
        font-family: 'iCiel-Crocante', cursive;
        padding-top: 8px;display: block;
        padding-left: 30px; 
        color:#fff;
        font-size:3rem;
    }
    .list-audio-category {
        color: #fff;
        padding-top: 15px;
        font-size: 2.7rem;
        list-style-type: none;
        display: block;
        padding-left: 50px;
        font-family: 'iCiel-Crocante', cursive;
    }

    .list-audio-category a {
        color: #fff;
    }

    .list-audio-category a.active {
        color: red;
        font-size: 3.5rem;
    }

    .list-audio-category a:hover {
        color: red;
        font-size: 3.5rem;
    }
    
    .carousel-caption {
        right: 15%;
        top: 30%;
        left: unset;
        bottom: unset;
        color: #fff;
    }
    .carousel-caption h3 {
        color: #ff0000;
    }

    .powerpoint-left {
        height:450px;
        text-align: left;
    }

    .powerpoint-left-bottom {
        z-index: 2;
        position: absolute;
        left: 0;
        height: 117%;
        background-color: #9e2425;
        width:100%;
        opacity: 0.9;
    }

    .description-audio {
        background-image: linear-gradient(to right, #ff7979, #cc2324, #cc2324 , #cc2324, #ff7979);
        height: 9%;
        text-align: center;
        color: #fff;
        font-size: 2.5rem;
    }

    .carousel-inner .item {
        width: 100%;
        height: 100%;
    }

    .carousel-inner .item .background-item {
        width: 100%;
        height: 91%;
        background-size: cover;
    }

    .carousel-inner .item .fa-volume-up {
        cursor: pointer;
    }

    .carousel-inner .item .fa-volume-down, .carousel-inner .item .fa-volume-up {
        font-size: 3rem;
        color:#e6e1e1;
        float: left;
        margin-left: -45px;
        margin-top: 5px;
    }

    .carousel-inner .item .spelling {
        font-size: 2.5rem;
        float: left;
        color: #000;
        font-family: 'Patrick Hand', cursive;
    }
    .carousel-caption .title-audio {
        font-size: 4.5rem;
        font-family: 'Patrick Hand', cursive;
    }

    .footer-slider-audio {
        background:#6a6a6a;
        height:55px;
        text-align: center;
        font-family: 'iCiel-Crocante', cursive;
        font-size: 2.5rem;
        color:#fff;
    }

    .footer-slider-audio .back, .footer-slider-audio .next {
        border-radius: 10px;
        padding: 0px 4px;
        background-color: #cc1e1e;
    }

    @media (max-width:767px) {
        .block-audio {
            top: unset;
        }
        .powerpoint-left-top {
            display: none;
        }
        .powerpoint-left-bottom {
            height: 100%;
        }
        .list-audio-category a {
            font-size: 2.8rem;
        }
        .list-audio-category a.active {
            font-size: 2.8rem;
        }
        .slider-image-audio {
            height: 50vh!important;
        }
        .slider-image-audio .carousel-inner {
            height: 50vh!important;
        }
        .carousel-inner .item .background-item {
            height: 87%;
        }
        .description-audio {
            height: 13%;
        }
        .block-slider-audio {
            padding-left: 5px;
            padding-right: 5px;
        }
        button.btn.back, button.btn.next {
            font-size: 0.8em;
        }
        .powerpoint-left-bottom {
            position: unset!important;
        }
        .powerpoint-left {
            height: auto;
            padding-left:0;
            padding-right:0;
        }
        .powerpoint-left-bottom ul {
            margin-bottom: 0;
            padding-bottom: 10px;
        }

        .section-description__top>span {
            margin-top: -70px!important;
        }
    }
    .section-description__top>span {
        left: 35%!important;
        margin-top: -115px;
    }
    .section-description__top>span:first-child:before, .section-description__top>span:first-child:after {
        display: none;
    }

    #form-search {
        position: relative;
        width: 25rem;
        max-width: 90%;
        float: right;
        padding-top: 8px;
    }

    #form-search input {
        height: 35px;
        border: 0;
        border-radius: 50px;
        font-size: 1.6rem;
        padding: 1rem 2rem;
        width: 100%;
        border: 2px solid #000;
    }

    #form-search a {
        position: absolute;
        right: 15px;
        top: 12px;
        font-size: 2rem;
    }
</style> 