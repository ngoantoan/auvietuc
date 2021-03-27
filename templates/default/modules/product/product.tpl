<section class="w-container bannerBox ">
    <div class="banner" style="height: auto;">
        <img src="{template_location}/img/home/2019/04/19/5cb97c13b0080.jpg" alt="{template_location}/img/home/2019/04/19/5cb97c13b0080.jpg" title="" style="" />
        <a href="javascript:void(0);" target="_self"><span id="f94af07584a7a2211fe0b6d4389c8e24" style="display:none;">none</span></a>
    </div>
</section>
<div class="w-container w-main">
    <div class="row">

        <div class="wrap-content-in w-system w-productcom">
            <div class="w-system-in">
                <div class="side_bar">
                    <div class="w-com-menu w-com-menu-V">
                        <div class="w-com-menu-in" id="Lroccomp-01ae98d70dee329280138563e6de4fb2">
                            <div class="systitle">
                                <div class="systitle-in">Product</div><i class="fa icon_menuControl"></i></div>
                            <ul class="ul-parent">
                                <!-- START BLOCK : parent_category -->
                                    <li class="li-parent" data-cateid="11961">
                                        <div class="div-parent"> <a href="{link_parent_category}">{title}</a><span class="menu_simpline_cur"></span><i class="fa fa-plus"></i></div>
                                        <div class="ul-submenu">
                                            <div class="ul-submenu-up"></div>
                                            <ul class="clearfix">
                                                <!-- START BLOCK : category -->
                                                    <li class="li-parent" data-cateid="11963">
                                                        <div class="div-parent"> <a href="{link_category}">{title}</a></div>
                                                    </li>
                                                <!-- END BLOCK : category -->
                                            </ul>
                                        </div>
                                    </li>
                                <!-- END BLOCK : parent_category -->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="side_left">
                    <style type="text/css">
                        .w-prd-list1 .w-prd-list-cell {
                            width: 33.32%;
                            *width: 33.31%;
                        }
                    </style>
                    <div class="crumbs">
                        <div class="crumbs_in">Your current location: &nbsp; {cate} {cate1}</div>
                    </div>
                    <div class="w-prd-list w-prd-list1 prd_imgScaleBig" id="id8bcfe6e4eaed530a516ed089289c91bb">
                        <div class="w-prd-list-in clearfix">
                            <!-- START BLOCK : products -->
                                <div class="w-prd-list-cell">
                                    <div class="w-prd-list-cell-in">
                                        <div class="w-prd-con">
                                            <div class="w-prd-imgbox" title="Automatic glue machine">
                                                <a target="_self" href="{link}" class="img-count w-prd-img">
                                                    <div class="aspectRatio" style="padding-bottom:75%"></div>
                                                    <div class="img-count-in"><img alt="{image}" title="{image}" src="{image}" /></div>
                                                </a>
                                            </div>
                                            <div class="w-prd-infobox" style="text-align:center">
                                                <h2 class="w-prd-name" title="Automatic glue machine">
                                                                                <a target="_self" href="{link}">{title}</a>
                                                                        </h2>
                                                <div class="w-prd-sum"></div>
                                                <div class="w-prd-more"><a target="_self" href="{link}l"><span>Details &gt;</span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!-- END BLOCK : products -->
                        </div>
                    </div>
                    <div class="w-pages">
                        <!-- START BLOCK : PAGING -->
                            {paging}
                        <!-- END BLOCK : PAGING -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    (function($) {
        if ($("#Lroccomp-01ae98d70dee329280138563e6de4fb2").length > 0) {
            var joinCate = [""];
            for (var i in joinCate) {
                $("#Lroccomp-01ae98d70dee329280138563e6de4fb2 li").each(function(key) {
                    if ($(this).data("cateid") == joinCate[i]) {
                        $(this).addClass("cur");
                    }
                });
            }
        }
    })(jQuery);

    $(function() {
        $("#id8bcfe6e4eaed530a516ed089289c91bb").listRow({
            row: 3,
            rowList: ".w-prd-list-cell",
            rowFind: ".w-prd-infobox"
        });
    });
</script>