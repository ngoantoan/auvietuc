<div class="pad-lr">
    <div class="clear" style="clear: both"></div>
    <table id="list"></table>
    <div id="pager"></div>
    <a style="display:none;" id="linkmodal" class="thickbox" href="#">modal</a>
</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        var folder_lib = "{folder_lib}";
        jQuery("#list").jqGrid({
            url: "index_ajax.php?q=about_us&r=getJsonList&lang=" + $('#lang').val() + "&category_id=" + $("#selProductCate").val(),
            datatype: 'json',
            styleUI: 'Bootstrap',
            mtype: 'POST',
            colNames: ['Chỉnh sửa','Trạng thái', 'Tiêu đề', 'kích hoạt', 'Ngày tạo'],
            colModel: [ {
                name: 'act',
                width: 120,
                search: false,
                index: 'act'
            },{
                name: 'id_onoff',
                width: 100,
                search: false,
                index: 'id_onoff'
            },{
                name: 'title',
                width: 720,
                index: 'title',
                editoptions: {
                    style: "width:250px;"
                },
                editable: true,
                editrules: {
                    required: true
                },
                searchoptions: {
                    sopt: ['cn']
                }
            },{
                name: 'status',
                index: 'status',
                editable: true,
                hidden:true,
                width: 200,

                search: false
            },{
                name: 'created',
                width: 200,
                index: 'created',
                align: 'left',
                search: false
            }],
            pager: '#list_toppager',
            rowNum: '10',
            rowList: [10, 20, 50, 70, 100, 150, 200],
            loadonce: false,
            height: "auto",
            width: "1200",
            autowidth: false,
            autoheight: false,
            shrinkToFit: false,
            scrollOffset: "0",
            forceFit: true,
            closeAfterAdd: true,
            closeAfterEdit: true,
            rownumbers: true,
            subGrid: false,
            multiselect: true,
            multiboxonly: true,
            sortname: "id",
            sortorder: "desc",
            viewrecords: false,
            pagerpos: 'right',
            toppager: true,
            gridComplete: function () {
                var ids = jQuery("#list").jqGrid('getDataIDs');
                for (var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    var be = "" +
                        "<div class='dropdown drop-action'>\n" +
                        "  <a data-toggle='dropdown' href='#' title=''>Lựa chọn<span class='caret'></span></a>\n" +
                        "  <ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>\n" +
                        "    <li role='presentation'><a title='' role='menuitem' tabindex='-1' href='#' onclick='edit("+ cl +")'>Chỉnh sửa chi tiết</a></li>\n" +
                        "  </ul>\n" +
                        "</div>" +
                        "";
                    var status_data = jQuery('#list').jqGrid ('getCell', cl, 'status');
                    if(status_data==="1"){
                        status_ac="On";
                        checked="checked";
                    }else{
                         status_ac="Off";
                        checked=" ";
                    }
                    var status_action="" +
                            "<div class='onoffswitch'>" +
                        "    <input type='checkbox' name='onoffswitch' class='onoffswitch-checkbox' id='myonoffswitch_"+cl+"' "+checked+">" +
                        "    <label class='onoffswitch-label checkonoffstatus_"+cl+"  "+ status_ac +"' for='myonoffswitch "+cl+"'  onclick='update_status("+ cl +")'></label>" +
                        "</div>";
                    jQuery("#list").jqGrid('setRowData', ids[i], {
                        act: be,
                        id_onoff:status_action
                    });
                };
            },
            editurl: "index_ajax.php?q=about_us&r=update&lang=" + $("#lang").val(),
            loadComplete: function () {
                var arrIds = jQuery("#list").jqGrid('getDataIDs');
                jQuery.each(arrIds, function () {
                    var image_path = jQuery("#list").jqGrid('getCell', this, "image");
                    jQuery("#list").jqGrid('setRowData', this, {
                        preview: "<img height='40px' width='40px' src='" + folder_lib + "/images/" + image_path + "'/>",
                    });
                });
            }
        });
        var grid = jQuery('#list').navGrid('#list_toppager', {
            edit: false,
            add: false,
            del: false,
            search: false
        }, {
            width: 'auto',
            height: 'auto',
            closeAfterEdit: true,
            reloadAfterSubmit: true,
            refresh: true

        }, {

            width: 950,
            height: 'auto',
            reloadAfterSubmit: true

        }, {
            height: 'auto',
            width: 300,
            reloadAfterSubmit: true

        });
        jQuery("#list").jqGrid('filterToolbar');

        $('#selProductCate').change(function () {
            var value = this.value;
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });

        // jQuery("#list").jqGrid('navButtonAdd', '#list_toppager', {
        //     caption: "<b>Thêm mới</b>",
        //     buttonicon: "ui-icon-plus",
        //     position: "first",
        //     onClickButton: function () {
        //         $("#img_load_gif").removeClass("hidden");
        //         var url = 'index_ajax.php?q=about_us&r=show&lang=' + $("#lang").val() + "&category_id=" + $("#selProductCate").val();
        //         $('.modal-body').load(url, function (result) {
        //             $('#myModal').modal({show:true});
        //             $("#img_load_gif").addClass("hidden");
        //         });
        //         return true;
        //     }
        // });

        $('#lang').change(function () {
            var value = $("#selProductCate").val();
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });
        $('#selProductCate').change(function () {
            var value = this.value;
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });
        $('#category_step1').change(function () {
            var value = this.value;
            $('#category_step2').empty();
            $.ajax({
                url: "index_ajax.php?q=about_us&r=get_category_step2&category_id=" + value + "&lang=" + $("#lang").val(),
                success: function (res) {
                    if (res !== "") {
                        $('#category_step2').append(res);
                        jQuery("#list").jqGrid('setGridParam', {
                            url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
                        }).trigger("reloadGrid");
                        $("#div_category_2").css("display","block");
                    } else {
                        jQuery("#list").jqGrid('setGridParam', {
                            url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
                        }).trigger("reloadGrid");
                        $("#div_category_2").css("display","none");
                    }
                }
            });
        });
        $('#category_step2').change(function () {
            var value = this.value;
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=about_us&r=getJsonList&category_id=" + value + "&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });
        $("#update_action").change( function () {
           var value=$(this).val();
           if(value === 'edit'){
               edit(_id)();
           }else if(value === 'duplicate'){
                duplicate(_id);
            }
        });
    });
    function update_status(_id) {
            if ($(".checkonoffstatus_"+_id).hasClass('On')){
                $(".checkonoffstatus_"+_id).removeClass('On').addClass('Off');
                document.getElementById("myonoffswitch_"+_id).checked=false;
                status=0;
            } else {
                $(".checkonoffstatus_"+_id).removeClass('Off').addClass('On');
                document.getElementById("myonoffswitch_"+_id).checked=true;
                status=1;
            }
            var url = 'index_ajax.php?q=about_us&r=update&oper=update_status&id=' + _id + '&status=' + status + '&lang=' + $("#lang").val();
            $.post( url, function( data ) {
                return false;
            });
    }
    function edit(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=about_us&r=show&id=' + _id + '&lang=' + $("#lang").val();
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }

    // function del(_id) {
    //     if (_id) {
    //         var url = 'index_ajax.php?q=about_us&r=update&oper=del&id=' + _id + '&lang=' + $("#lang").val();
    //         $.post( url, function( data ) {
    //             return true;
    //         });
    //     } else {
    //         alert("Please select Row")
    //     }
    // }

    function duplicate(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=about_us&r=show_copy&id=' + _id + '&lang=' + $("#lang").val();
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }

    function getList(lang) {
        $.post("index_ajax.php?q=about_us&r=getCategory3", "", function (res) {
            $("#selProductCate").html(res);
            reload();
        });
    }

    function reload() {
        jQuery("#list").jqGrid('setGridParam', {
            url: 'index_ajax.php?q=about_us&r=getJsonList&lang=' + $("#lang").val() + "&category_id=" + $("#selProductCate").val()
        }).trigger("reloadGrid");
    }
</script>