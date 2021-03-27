
<h2 class="ic-default">Danh sách bình luận tin tức</h2>
<div class="clear" style="clear: both">
<div class="pad-lr">
    <br/>
    <table id="list"></table>
    <div id="pager"></div>
</div>
</div>
<script type="text/javascript">
    function ab_afterShowForm(ids) {
        var pr = $('#cate_id').val();
        $('#cate_id').show();
        $.get("index_ajax.php?q=product_category&r=getCategory", '', function(resp) {
            $('#cate_id').replaceWith('<select style="width:300px;" id="cate_id" name="cate_id" class="FormElement"><option value="">-- ROOT --</option></select>');
            $('#cate_id').html(resp);
            $('#cate_id').val(pr);
        });
        selID = $('#list').getGridParam('selrow');
        // get selected row

        if (CKEDITOR.instances.detail) {
            CKEDITOR.instances.detail.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('detail', {
                height : 130,
                filebrowserBrowseUrl : '{path}ckfinder.html',
                filebrowserImageBrowseUrl : '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl : '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl : '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl : '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
                /*
                 toolbar:
                 [['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript']],removePlugins: 'maximize,resize,scayt'
                 */
            });
        }

        if (CKEDITOR.instances.description) {
            CKEDITOR.instances.description.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('description', {
                height : 130,
                filebrowserBrowseUrl : '{path}ckfinder.html',
                filebrowserImageBrowseUrl : '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl : '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl : '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl : '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
                /*
                 toolbar:
                 [['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript']],removePlugins: 'maximize,resize,scayt'
                 */
            });
        }
        if (!($('appData').is(':hidden') || $('appData').is(':hidden') && selID == null)) {
            va = $('#list').getRowData(selID);
            CKEDITOR.instances.detail.setData(va['detail']);
            CKEDITOR.instances.description.setData(va['description']);

        } else {
            CKEDITOR.instances.detail.setData("");
            CKEDITOR.instances.description.setData("");

        }
        //Dùng để làm cate cho SP

    };
    function ab_afterShowFormAdd(ids) {
        $.get("index_ajax.php?q=product_category&r=getCategory&lang=" + $('#lang').val(), '', function(resp) {
            $('#cate_id').replaceWith('<select style="width:300px;" id="cate_id" name="cate_id" class="FormElement"><option value="">-- ROOT --</option></select>');
            $('#cate_id').html(resp);
            $('#cate_id').val();
        });
        selID = $('#list').getGridParam('selrow');
        // get selected row
        if (CKEDITOR.instances.detail) {
            CKEDITOR.instances.detail.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('detail', {
                height : 130,
                filebrowserBrowseUrl : '{path}ckfinder.html',
                filebrowserImageBrowseUrl : '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl : '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl : '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl : '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
                /*
                 toolbar:
                 [['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript']],removePlugins: 'maximize,resize,scayt'
                 */
            });
        }

        if (CKEDITOR.instances.description) {
            CKEDITOR.instances.description.setData("");
        } else {
            //tao instance moi
            CKEDITOR.replace('description', {
                height : 130,
                filebrowserBrowseUrl : '{path}ckfinder.html',
                filebrowserImageBrowseUrl : '{path}ckfinder.html?Type=images',
                filebrowserFlashBrowseUrl : '{path}ckfinder.html?Type=flash',
                filebrowserUploadUrl : '{path}coreconnector/php/connector.php?command=QuickUpload&type=files',
                filebrowserImageUploadUrl : '{path}core/connector/php/connector.php?command=QuickUpload&type=images',
                /*
                 toolbar:
                 [['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript']],removePlugins: 'maximize,resize,scayt'
                 */
            });
        }
        CKEDITOR.instances.detail.setData("");
        CKEDITOR.instances.description.setData("");

    };
    function your_after_submit_add(resp) {
        var result = jQuery.trim(resp.responseText);
        if (result == 1) {
            //CKEDITOR.instances.detail.setData("");
            return [false, "Thành công", ""];
        } else { ab_afterShowForm;
            return [false, "Thất bại", "Thất bại"];
        }
    };
    function your_before_submit_add(data) {
        va = $('#list').getRowData(selID);
//        data['detail'] = CKEDITOR.instances.detail.getData(va['detail']);
//        data['description'] = CKEDITOR.instances.description.getData(va['description']);
        reload();
        return [true];
    }

    function ab_beforeSubmit(data) {
        va = $('#list').getRowData(selID);
//        data['detail'] = CKEDITOR.instances.detail.getData(va['detail']);
//        data['description'] = CKEDITOR.instances.detail.getData(va['description']);
        return [true];
    };
    function ab_afterclickPgButtons() {
        CKEDITOR.instances.detail.setData("");
        CKEDITOR.instances.description.setData("");
    }
    jQuery(document).ready(function () {
        var selectedId;
        jQuery("#list").jqGrid({
            url: 'index_ajax.php?q=comments_blog&r=getJsonList&lang=' + $('#lang').val(),
            datatype: 'json',
            mtype: 'POST',
            styleUI: 'Bootstrap',
            colNames: ['Chỉnh sửa', 'Tiêu đề', 'Hiển thị'],
            colModel: [{
                name : 'id',
                width : 120,
                index : 'id',
                hidden: true,
                // formatter: 'actions',
                formatoptions: {
                    keys: true,
                    editformbutton: false,
                    delformbutton: true
                }
            }, {
                name: 'title',
                index: 'title',
                width: '200px',
                editable: true,
                edittype: "text",
                editrules: {
                    required: true
                }
            }, {
                name: 'status',
                index: 'status',
                width: '200px',
                align: 'left',
                editable: true,
                edittype: "checkbox",
                editoptions: {
                    value: "1:0",
                    defaultValue: '1'
                },
                formatter: 'checkbox'
            }],
            pager : '#list_toppager',
            rowNum : '10',
            rowList : [10, 20, 50, 70, 100, 150, 200],
            loadonce:false,
            height: "auto",
            width: "1300",
            autowidth: false,
            autoheight: false,
            scrollOffset:"0",
            forceFit : true,
            closeAfterAdd : true,
            closeAfterEdit : true,
            rownumbers : true,
            subGrid : true,
            multiselect : true,
            multiboxonly : true,
            sortname : "id",
            sortorder : "desc",
            viewrecords : false,
            toppager: true,
            editurl: "index_ajax.php?q=comments_blog&r=update&lang=" + $('#lang').val(),
            subGridRowExpanded: function (subgrid_id, row_id) {
                var subgrid_table_id, pager_id;
                subgrid_table_id = subgrid_id + "_t";
                pager_id = "p_" + subgrid_table_id;
                $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
                jQuery("#" + subgrid_table_id).jqGrid({
                    url: "index_ajax.php?q=comments_blog&r=getSubGridJsonList&id=" + row_id,
                    datatype: "json",
                    styleUI: 'Bootstrap',
                    colNames: ['ID', 'Họ tên', 'Email', 'Điện thoại', 'Địa chỉ', 'Nội dung', 'Hiển thị', 'Ngày'],
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        key: true,
                        width: '50px',
                        hidden: false
                    }, {
                        name: 'name',
                        index: 'name',
                        width: '150px',
                        editable: true,
                        edittype: "text",
                        editrules: {
                            required: true
                        }
                    }, {
                        name: 'email',
                        index: 'email',
                        width: '250px',
                        editable: true,
                        edittype: "text",
                        editrules: {
                            required: true
                        }
                    }, {
                        name: 'phone',
                        index: 'phone',
                        width: '150px',
                        editable: true,
                        edittype: "text",
                        editrules: {
                            required: true
                        }
                    }, {
                        name: 'address',
                        index: 'address',
                        width: '200px',
                        editable: true,
                        edittype: "text",
                        editrules: {
                            required: true
                        }
                    }, {
                        name: 'contents',
                        index: 'contents',
                        width: '300px',
                        editable: true,
                        edittype: "text",
                        editrules: {
                            required: true
                        }
                    }, {
                        name: 'status',
                        index: 'status',
                        width: '80px',
                        align: 'center',
                        editable: true,
                        edittype: "checkbox",
                        editoptions: {
                            value: "1:0",
                            defaultValue: '1'
                        },
                        formatter: 'checkbox'
                    }, {
                        name: 'created_at',
                        width: '200px',
                        index: 'news_date',
                        align: 'left',
                        search: false
                    }],
                    rowNum: 20,
                    pager: pager_id,
                    height: 'auto',
                    width: '1200',
                    multiselect: true,
                    multiboxonly: true,
                    sortname : "id",
                    sortorder : "desc",
                    viewrecords: true,
                    editurl: "index_ajax.php?q=comments_blog&r=updatesub&lang=" + $('#lang').val()
                });
                jQuery("#" + subgrid_table_id).jqGrid('navGrid', "#" + pager_id, {
                    edit: true,
                    add: false,
                    del: true
                })

            }
        });
        var grid = jQuery('#list').navGrid('#list_toppager', {
            edit : false,
            add : false,
            del : false,
            search : false
        });
    });

    $('#lang').change(function () {
        jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=comments_blog&r=getJsonList&lang=" + $('#lang').val(),
            editurl: "index_ajax.php?q=comments_blog&r=update&lang=" + $('#lang').val()
        }).trigger("reloadGrid");
    });

    //	var getNewsCateBylangId = function(formid) {
    //		var url = "index_ajax.php?q=product_category_categories&r=getCategory";
    //		$.get(url, function(data) {
    //			jQuery("#parent_id").html(data);
    //		});
    //	};
    function reload() {
        var value =$('#lang').val();
                jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=comments_blog&r=getJsonList&lang=" + value,
            editurl: "index_ajax.php?q=comments_blog&r=update&lang=" + value
        }).trigger("reloadGrid");
    }
</script>
