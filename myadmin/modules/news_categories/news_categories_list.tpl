<h2 class="ic-default">Danh mục tin tức</h2>
<div class="pad-lr">
    <div class="clear" style="clear: both"></div>
    <table id="list"></table>
    <div id="pager"></div>
</div>
<script type="text/javascript">
    function ab_afterShowForm(ids) {
        var pr = $('#cate_id').val();
        $('#cate_id').show();
        $.get("index_ajax.php?q=product&r=getCategory", '', function(resp) {
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
        $.get("index_ajax.php?q=product&r=getCategory&lang=" + $('#lang').val(), '', function(resp) {
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
            });
        }
        CKEDITOR.instances.detail.setData("");
        CKEDITOR.instances.description.setData("");

    };
    function your_after_submit_add(resp) {
        var result = jQuery.trim(resp.responseText);
        if (result == 1) {
            return [false, "Thành công", ""];
        } else { ab_afterShowForm;
            return [false, "Thất bại", "Thất bại"];
        }
    };

    function your_before_submit_add(data) {
        va = $('#list').getRowData(selID);
        return [true];
    }

    function ab_beforeSubmit(data) {
        va = $('#list').getRowData(selID);
        return [true];
    };

    function ab_afterclickPgButtons() {
        CKEDITOR.instances.detail.setData("");
        CKEDITOR.instances.description.setData("");
    }
    
    jQuery(document).ready(function () {
        var selectedId;
        jQuery("#list").jqGrid({
            url: 'index_ajax.php?q=news_categories&r=getJsonList&lang=' + $('#lang').val(),
            datatype: 'json',
            mtype: 'POST',
            styleUI: 'Bootstrap',
            colNames: ['Chỉnh sửa', 'Tiêu đề', 'Mã', 'Hiển thị'],
            colModel: [{
                name : 'id',
                width : 120,
                index : 'id',
                formatter: 'actions',
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
                name: 'cate_code',
                index: 'cate_code',
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
            width: "1200",
            autowidth: false,
            autoheight: false,
            scrollOffset:"0",
            forceFit : true,
            closeAfterAdd : true,
            closeAfterEdit : true,
            rownumbers : true,
            subGrid : false,
            multiselect : true,
            multiboxonly : true,
            sortname : "id",
            pagerpos: 'right',
            sortorder : "desc",
            viewrecords : false,
            toppager: true,
            editurl: "index_ajax.php?q=news_categories&r=update&lang=" + $('#lang').val()
        });
        var grid = jQuery('#list').navGrid('#list_toppager', {
            edit : false,
            add : true,
            del : true,
            search : false
        }, {
            width : 'auto',
            height : 'auto',
            afterclickPgButtons : ab_afterclickPgButtons,
            afterShowForm : ab_afterShowForm,
            afterSubmit : your_after_submit_add,
            beforeSubmit : your_before_submit_add,
            closeAfterEdit : true,
            reloadAfterSubmit : true,
            refresh:true

        }, {

            width : 'auto',
            height : 'auto',
            afterShowForm : ab_afterShowFormAdd,
            afterSubmit : your_after_submit_add,
            beforeSubmit : your_before_submit_add,
            reloadAfterSubmit : true

        }, {
            height : 'auto',
            width : 300,
            reloadAfterSubmit : true

        });
    });

    $('#selProductCate').change(function () {
        var value = this.value;
        category_id = value;
        jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=product_categories&r=getJsonList&category_id=" + value,
            editurl: "index_ajax.php?q=product_categories&r=update&category_id=" + value
        }).trigger("reloadGrid");
    });

    function reload() {
        var value =$('#selProductCate').val();
                jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=product_categories&r=getJsonList&category_id=" + value,
            editurl: "index_ajax.php?q=product_categories&r=update&category_id=" + value
        }).trigger("reloadGrid");
    }
</script>
