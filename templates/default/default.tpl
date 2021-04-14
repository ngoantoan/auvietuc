<!DOCTYPE html>
<html lang="{LANG}">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{website_name}</title>
    <link rel="shortcut icon" href="favicon.png" type="image/x-icon" rel="shortcut icon"/>
    <meta name="keywords" content="{site_keywords}"/>
    <meta name="description" content="{site_description}"/>
    <meta name="generator" content="Âu Việt Úc"/>
    <meta name="robots" content="index,follow,all"/>
    <meta name="refresh" http-equiv="refresh"/>
    <meta name="language" content="Vietnamese"/>
    <meta property="og:title" content="{website_name}"/>
    <meta property="og:description" content="{site_description}"/>
    <meta property="og:url" content="{RAW_LINK}"/>
    <meta property="og:image" content="{IMAGE_LINK}"/>
    <meta property="og:type" content="article"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5, user-scalable=no">

    <link href="https://fonts.googleapis.com/css?family=Sigmar+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,500,600,700,800,900" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">

    <link href="{template_location}/css/all.min.css" rel="stylesheet">
    <link href="{template_location}/css/jquery.fancybox.min.css" rel="stylesheet">
    <link href="{template_location}/css/styles.css" rel="stylesheet">
    <link href="{template_location}/css/sweet-alert.css" rel="stylesheet">
    <script>
        var site_folder = '{site_folder}', baseLink = '{baselink}';
    </script>
    
  </head>
  <body class="sticky-head">
      <header class="header navbar" id="top" data-spy="affix" data-offset-top="80">
          <!-- START BLOCK : HEADER -->
          {content}
          <!-- END BLOCK : HEADER -->
      </header>
      <div class="main">
          <!-- START BLOCK : LEFT -->
          {content}
          <!-- END BLOCK : LEFT -->
          <!-- START BLOCK : TOP -->
          {content}
          <!-- END BLOCK : TOP -->
          <!-- START BLOCK : RIGHT -->
          {content}
          <!-- END BLOCK : RIGHT -->
          <!-- START BLOCK : BOTTOM -->
          {content}
          <!-- END BLOCK : BOTTOM -->
      </div>
      
          <!-- START BLOCK : FOOTER -->
          {content}
          <!-- END BLOCK : FOOTER -->

    <script src="{template_location}/js/jquery.min.js"></script>
    <script src="{template_location}/js/bootstrap.min.js"></script>
    <script src="{template_location}/js/plugins.js"></script>
    <script src="{template_location}/js/isotope.min.js"></script>
    <script src="{template_location}/js/jquery.fancybox.min.js"></script>
    <script src="{template_location}/js/main.js"></script>
    <script src="{template_location}/js/sweet-alert.min.js"></script>

    <script src="{template_location}/js/ajax.js"></script>
    <script>
        $(function(){
    
            $(window).scroll(function(event) {
                
                var vitri = $('html').scrollTop();  //tính vị trí body
                //vi tri xuat hien btn-to-top
                if(vitri >= 300){
                    $('.footer__call').addClass('active');
                } else if(vitri==0){
                    $('.footer__call').removeClass('active');
                }

            })

            $('.footer__call').on('click',function(event) {
                event.preventDefault();
                $('html').animate({scrollTop: 0}, 600)

            });

            $('a.link-kh-1').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-1').offset().top;
                height_top=height_top-70;
                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);

            });

            $('a.link-kh-2').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-2').offset().top;
                height_top=height_top-70;
                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('a.link-kh-3').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-3').offset().top;
                height_top=height_top-70;
                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('a.link-kh-4').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-4').offset().top;
                height_top=height_top-70;
                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('a.link-kh-5').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-5').offset().top;
                height_top=height_top-70;
                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('a.link-kh-6').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.kh-6').offset().top;
                height_top=height_top-70;

                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('a.see-more-dh').on('click',function(event) {
                
                //ham tinh chieu cao den top
                var height_top= $('.section-website').offset().top;

                event.preventDefault();
                $('html').animate({scrollTop: height_top}, 600);
                return false;

            });

            $('#watching-video').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget); // Button that triggered the modal
              var name_modal = button.data('whatever');
              var modal = $(this);
              modal.find('.modal-title').text(name_modal);
            })

            $('#watching-video-upload').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var name_modal = button.data('whatever');
                var modal = $(this);
                modal.find('.modal-title').text(name_modal);
            })

            $('.list-video a.img-video').click(function(event) {
                var link = $(this);
                
                $("#video_upload_modal").append("<video width='550' height='400' controls> <source id='' src='http://www.auvietuc.edu.vn/upload/videos/" + link[0].dataset.link +" ' type='video/mp4'> </video>");

                var iframe = $('#watching-video .video iframe');
                iframe[0].src =link[0].dataset.link;
                console.log(link[0].dataset.link);
            });

            $('#watching-video button.close').click(function(event) {
                var iframe = $('#watching-video .video iframe');
                iframe[0].src ="";

                $("#video_upload_modal").html("");
            });

            $('#watching-video-upload button.close').click(function(event) {
                $("#video_upload_modal").html("");

                var iframe = $('#watching-video .video iframe');
                iframe[0].src ="";
            });
        });
    </script>
    <script>
        $(document).ready(function(){

            $(".filter-button").click(function(){
                var value = $(this).attr('data-filter');

                $('.button-filter ul li a').each(function(index, el) {
                    if ($(this).hasClass('active')) {
                        $(this).removeClass('active');
                    }
                });
                $(this).addClass('active');
                
                if(value == "all")
                {
                    $('.filter').show('1000');
                }
                else
                {
                    $(".filter").not('.'+value).hide('3000');
                    $('.filter').filter('.'+value).show('3000');
                }
            });
        });

        // slider audio
        $('.carousel').carousel({
            interval: false,
        });

        function playAudio(code) {
            $('.volume-down-' + code).css('display', 'none');
            $('.volume-up-' + code).css('display', 'block');
            document.getElementById(code).play();
        }

        function stopAudio(code) {
            $('.volume-down-' + code).css('display', 'block');
            $('.volume-up-' + code).css('display', 'none');
            let audio = document.getElementById(code);
            audio.pause();
        }

        function stopAllAudio() {
            var sounds = document.getElementsByTagName('audio');
            for(i=0; i<sounds.length; i++) sounds[i].pause();
        }

        $('.carousel-inner .item').each(function(i) {
            if ( i === 0 ) {
                $(this).addClass('active');
            }
        });
        // end slider audio
    </script>
</body>
</html>