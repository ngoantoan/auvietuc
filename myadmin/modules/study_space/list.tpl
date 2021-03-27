<div class="pad-lr" style="padding-top: 20px;">
    <div class="clear" style="clear: both"></div>
    <table id="list"></table>
    <div id="pager"></div>
    <a style="display:none;" id="linkmodal" class="thickbox" href="#">modal</a>
</div>

<script type="text/javascript">
    function ab_afterShowForm(ids) {
        selID = $('#list').getGridParam('selrow');
        if (CKEDITOR.instances.detail) {
            CKEDITOR.instances.detail.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('detail', {
                height: 100,
                filebrowserBrowseUrl: '{path}ckfinder.html',
                filebrowserImageBrowseUrl: '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl: '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl: '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl: '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
            });
        }

        if (!($('appData').is(':hidden') || $('appData').is(':hidden') && selID == null)) {
            va = $('#list').getRowData(selID);
            CKEDITOR.instances.detail.setData(va['detail']);
        } else {
            CKEDITOR.instances.detail.setData("");
        }
    };

    function ab_afterShowFormAdd(ids) {
        selID = $('#list').getGridParam('selrow');
        // get selected row
        if (CKEDITOR.instances.detail) {
            CKEDITOR.instances.detail.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('detail', {
                height: 100,
                filebrowserBrowseUrl: '{path}ckfinder.html',
                filebrowserImageBrowseUrl: '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl: '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl: '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl: '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
            });
        }
        CKEDITOR.instances.detail.setData("");
    };

    function your_after_submit_add(resp) {
        var result = jQuery.trim(resp.responseText);
        if (result == 1) {
            return [true, "Thành công", ""];
        } else {
            ab_afterShowForm;
            return [false, "Thất bại", "Thất bại"];
        }
    }
    ;
    function your_before_submit_add(data) {
        va = $('#list').getRowData(selID);
        return [true];
    }

    function ab_beforeSubmit(data) {
        va = $('#list').getRowData(selID);
        return [true];
    }
    ;
    function ab_afterclickPgButtons() {
        CKEDITOR.instances.detail.setData("");
    }


    jQuery(document).ready(function () {
        var folder_lib = "{folder_lib}";
        jQuery("#list").jqGrid({
            url: 'index_ajax.php?q=study_space&r=getJsonList&lang=' + $('#lang').val(),
            datatype: 'json',
            styleUI: 'Bootstrap',
            mtype: 'POST',
            colNames: ['Chỉnh sửa', 'Trạng thái', 'Tiêu đề', 'Image', 'kích hoạt', 'Ngày tạo', 'Ảnh'],
            colModel: [{
                name: 'act',
                width: 120,
                search: false,
                index: 'act'
            },{
                name: 'id_onoff',
                width: 120,
                search: false,
                index: 'id_onoff'
            }, {
                    name: 'title',
                    width: 500,
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
                }, {
                    name: 'image',
                    width: "auto",
                    index: 'image',
                    search: false,
                    hidden: true,
                    editrules: {
                        required: false,
                        edithidden: true
                    },
                    editable: true,
                    searchoptions: {
                        sopt: ['cn']
                    },
                    editoptions: {
                        size: 20,
                        dataEvents: [{
                            type: 'click',
                            data: {
                                i: 7
                            },
                            fn: function (e) {
                                BrowseImageFromServerTHIS('image');
                            }
                        }]
                    }
                }, {
                    name: 'status',
                    index: 'status',
                    editable: true,
                    width: 80,
                    edittype: "checkbox",
                    hidden:true,
                    editoptions: {
                        value: "1:0",
                        defaultValue: '1'
                    },
                    formatter: 'checkbox',
                    search: false
                }, {
                    name: 'created_at',
                    width: 120,
                    index: 'news_date',
                    align: 'left',
                    search: false
                }, {
                    name: "preview",
                    width: 60,
                    sortable: false,
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
            pagerpos: 'right',
            viewrecords: false,
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
                        "    <li role='presentation'><a title='' role='menuitem' tabindex='-1' href='#'  onclick=\"jQuery.fn.fmatter.rowactions.call(this,'del');\" onmouseover=\"jQuery(this).addClass('active');\" onmouseout=\"jQuery(this).removeClass('active');\" >Xóa</a></li>\n" +
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
            editurl: "index_ajax.php?q=study_space&r=update&lang=" + $("#lang").val(),
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
            del: true,
            search: false
        }, {
            width: 'auto',
            height: 'auto',
            afterclickPgButtons: ab_afterclickPgButtons,
            afterShowForm: ab_afterShowForm,
            afterSubmit: your_after_submit_add,
            beforeSubmit: your_before_submit_add,
            closeAfterEdit: true,
            reloadAfterSubmit: true,
            refresh: true

        }, {

            width: 950,
            height: 'auto',
            afterShowForm: ab_afterShowFormAdd,
            afterSubmit: your_after_submit_add,
            beforeSubmit: your_before_submit_add,
            reloadAfterSubmit: true

        }, {
            height: 'auto',
            width: 300,
            reloadAfterSubmit: true
        });
        jQuery("#list").jqGrid('filterToolbar');

        jQuery("#list").jqGrid('navButtonAdd', '#list_toppager', {
            caption: "<b>Thêm mới</b>",
            buttonicon: "ui-icon-plus",
            position: "first",
            onClickButton: function () {
                $("#img_load_gif").removeClass("hidden");
                var url = 'index_ajax.php?q=study_space&r=show&lang=' + $("#lang").val();
                $('.modal-body').load(url, function (result) {
                    $('#myModal').modal({show:true});
                    $("#img_load_gif").addClass("hidden");
                });
                return true;
            }
        });

        $('#lang_id').change(function () {
            var value = $("#selProductCate").val();
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=study_space&r=getJsonList&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });

        $('#selProductCate').change(function () {
            var value = this.value;
            jQuery("#list").jqGrid('setGridParam', {
                url: "index_ajax.php?q=study_space&r=getJsonList&lang=" + $("#lang").val()
            }).trigger("reloadGrid");
        });
    })
    ;

    function edit(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=study_space&r=show&lang=' + $("#lang").val()+'&id=' + _id ;
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }

    function reload() {
        jQuery("#list").jqGrid('setGridParam', {
            url: 'index_ajax.php?q=study_space&r=getJsonList&lang=' + $("#lang").val()
        }).trigger("reloadGrid");
    }

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
        var url = 'index_ajax.php?q=study_space&r=update&oper=update_status&id=' + _id + '&status=' + status + '&lang=' + $("#lang").val();
        $.post( url, function( data ) {
            return false;
        });
    }
    function duplicate(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=study_space&r=show_copy&id=' + _id + '&lang=' + $("#lang").val();
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }

</script>