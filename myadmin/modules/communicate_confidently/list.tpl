
<h2 class="ic-default">Danh sách Vieo</h2>
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
        // $.get("index_ajax.php?q=student&r=getCategory", '', function(resp) {
        //     $('#cate_id').replaceWith('<select style="width:300px;" id="cate_id" name="cate_id" class="FormElement"><option value="">-- ROOT --</option></select>');
        //     $('#cate_id').html(resp);
        //     $('#cate_id').val(pr);
        // });
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
        $.get("index_ajax.php?q=student&r=getCategory&lang=" + $('#lang').val(), '', function(resp) {
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
        reload();
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
        var folder_lib = "{folder_lib}";
        jQuery("#list").jqGrid({
            url: 'index_ajax.php?q=communicate_confidently&r=getJsonListCategory&lang=' + $('#lang').val(),
            datatype: 'json',
            mtype: 'POST',
            styleUI: 'Bootstrap',
            colNames: ['Chỉnh sửa', 'Tiêu đề', 'Hiển thị'],
            colModel: [{
                    name : 'id',
                    width : 120,
                    index : 'id',
                    hidden: true,
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
            width: "1400",
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
            editurl: "index_ajax.php?q=communicate_confidently&r=updateCategory",
            subGridRowExpanded: function (subgrid_id, row_id) {
                var subgrid_table_id, pager_id;
                subgrid_table_id = subgrid_id + "_t";
                pager_id = "p_" + subgrid_table_id;
                $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
                jQuery("#" + subgrid_table_id).jqGrid({
                    url: 'index_ajax.php?q=communicate_confidently&r=getJsonList&id_category='+row_id,
                    datatype: 'json',
                    styleUI: 'Bootstrap',
                    mtype: 'POST',
                    colNames: ['Chỉnh sửa', 'Trạng thái', 'Tiêu đề', 'Image', 'Link video', 'Video upload', 'kích hoạt', 'Ngày tạo', 'Ảnh', 'Thao tác'],
                    colModel: [{
                            name: 'act',
                            width: 120,
                            search: false,
                            hidden:true,
                            index: 'act'
                        },{
                            name: 'id_onoff',
                            width: 120,
                            search: false,
                            index: 'id_onoff'
                        }, {
                            name: 'title',
                            width: 350,
                            index: 'title',
                            editoptions: {
                                style: "width:200px;"
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
                            name: 'video',
                            width: 250,
                            index: 'video',
                            editoptions: {
                                style: "width:250px;"
                            },
                            editable: true,
                            editrules: {
                                required: true
                            },
                            searchoptions: {
                                sopt: ['cn']
                            },
                            search: false
                        }, {
                            name: 'video_upload',
                            width: 250,
                            index: 'video_upload',
                            editoptions: {
                                style: "width:250px;"
                            },
                            editable: true,
                            editrules: {
                                required: true
                            },
                            searchoptions: {
                                sopt: ['cn']
                            },
                            search: false
                        }, {
                            name: 'status',
                            index: 'status_video',
                            editable: true,
                            width: 0,
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
                            width: 170,
                            index: 'news_date',
                            align: 'left',
                            search: false
                        }, {
                            name: "preview",
                            width: 80,
                            sortable: false,
                            search: false
                        },{
                            index : 'actions',
                            name: "actions",
                            width: 200,
                            search:false
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
                    editurl: "index_ajax.php?q=student&r=updatesub&lang=" + $('#lang').val() + "&id_category=" + row_id,
                    loadComplete: function () {
                        var arrIds = jQuery("#" + subgrid_table_id).jqGrid('getDataIDs');
                        jQuery.each(arrIds, function () {
                            var image_path = jQuery("#" + subgrid_table_id).jqGrid('getCell', this, "image");
                            var id = jQuery("#" + subgrid_table_id).jqGrid('getCell', this, "id_onoff");
                            var status_data = jQuery("#" + subgrid_table_id).jqGrid('getCell', this, 'status');
                            if(status_data==="1"){
                                status_ac="On";
                                checked="checked";
                            }else{
                                status_ac="Off";
                                checked=" ";
                            }
                            var status_action="" +
                                "<div class='onoffswitch'>" +
                                "    <input type='checkbox' name='onoffswitch' class='onoffswitch-checkbox' id='myonoffswitch_"+id+"' "+checked+">" +
                                "    <label class='onoffswitch-label checkonoffstatus_"+id+"  "+ status_ac +"' for='myonoffswitch "+id+"'  onclick='update_status("+ id +")'></label>" +
                                "</div>";

                            jQuery("#" + subgrid_table_id).jqGrid('setRowData', this, {
                                preview: "<img height='40px' width='40px' src='" + folder_lib + "/images/" + image_path + "'/>",
                                id_onoff:status_action,
                                actions : "<a style='margin-right:5px;' class='btn btn-primary' onclick='editVideo("+ id +")' >Cập nhật</a><button data-id='"+ id +"' onclick='deleteVideo("+ id +")' class=' btn btn-danger' >Xóa</button>"
                            });
                        });
                    },
                });
                jQuery("#" + subgrid_table_id).jqGrid('navGrid', "#" + pager_id, {
                    edit: false,
                    add: false,
                    del: false,
                    search: false
                }),
                jQuery("#" + subgrid_table_id).jqGrid('navButtonAdd', "#" + pager_id, {
                    caption: "<b>Thêm mới</b>",
                    buttonicon: "ui-icon-plus",
                    position: "first",
                    onClickButton: function () {
                        $('#id_category_add').val(row_id);
                        $('#addVideo').modal({show:true});
                        return true;
                    }
                });
            }
        });
        var grid = jQuery('#list').navGrid('#list_toppager', {
            edit : true,
            add : true,
            del : true,
            search : false
        });
    });

    $('#lang').change(function () {
        jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=student&r=getJsonList&lang=" + $('#lang').val(),
            editurl: "index_ajax.php?q=student&r=update&lang=" + $('#lang').val()
        }).trigger("reloadGrid");
    });
    
    function reload() {
        jQuery("#list").jqGrid('setGridParam', {
            url: "index_ajax.php?q=communicate_confidently&r=getJsonList"
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
        var url = 'index_ajax.php?q=communicate_confidently&r=update&oper=update_status&id=' + _id + '&status=' + status;
        $.post( url, function( data ) {
            return false;
        });
    }

    // cập nhật Video
    function editVideo(_id) {
        if (_id) {
            var url = 'index_ajax.php?q=communicate_confidently&r=showEdit&id=' + _id ;
            $.ajax({
                url: url,
                type: "POST",
                data: _id,
                success: function (data) {
                    var result = JSON.parse(data)
                    $("#id_edit").val(result['id']);
                    $("#title_edit").val(result['title']);
                    $("#image_edit").val(result['image']);
                    $("#video_edit").val(result['video']);
                    $("#value_file_edit").html(result['video_upload']);
                    if (result['status'] == '1') {
                        $('input[id=status_1]:nth-child(1)').attr('checked', 'checked');
                    } else {
                        $('input[id=status_0]:nth-child(1)').attr('checked', 'checked');
                    }
                    $('#editVideo').modal({show:true});
                }
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }

    // xóa danh Video
    function deleteVideo(id) {
        var person = prompt("Lý do xóa danh mục sản phẩm này?", "");
        if (person != null && person != "") {
            var url = 'index_ajax.php?q=communicate_confidently&r=update&oper=del&id=' + id;
            $.ajax({
                url: url,
                type: "POST",
                data: id,
                success: function (data) {
                    swal({
                        title: 'Thành công!',
                        text: 'xóa Video thanh công',
                        type: 'success',
                        timer: 1500
                    });
                    self.parent.jQuery("#list").trigger("reloadGrid");
                }
            });
            return true;
        }
	};
</script>

<div class="modal fade" id="addVideo" tabindex="-1" role="dialog" aria-labelledby="addLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addLabel">Thêm Video</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="http://www.auvietuc.edu.vn/myadmin/?q=communicate_confidently&r=add"  enctype="multipart/form-data">
            <section>
                <div class="col-sm-3">
                    <input type="hidden" class="form-control" name="id_category" id="id_category_add">
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" required class="form-control" name="title" id="title"
                            placeholder="Enter title">
                </div>
            </section>
            <section>
                <div class="form-group">
                    <label for="image"> Hình ảnh video: </label>
                    <div class="input-group">
                        <input class="form-control" type="text" required placeholder="Click browse to choose image path"
                                name="image" value="{image_path}" id="image" size="46"/>
                        <span class="input-group-btn">
                    <button type="button" onclick="BrowseImageFromServer('images:/','image');"
                            class="btn btn-default">
                        Duyệt thư mục
                    </button> </span>
                    </div>
                </div>

                <p class="bg-warning">Vui lòng chỉ nhập 1 trong 2 (link video hoặc upload video)</p>
                <div class="form-group">
                    <label for="video"> Link video: </label>
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Click browse to choose video path"
                                name="video" id="video" size="150"/>
                        <span class="input-group-btn"> </span>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="video"> Upload video: </label>
                    <div class="input-group">
                        <!--input class="form-control" type="file" name="file" id="file" size="150"/-->
                        <input class="form-control" type="text" placeholder="Click browse to choose video path"
                                name="video_upload" id="video_upload" size="150"/>
                        <span class="input-group-btn"> </span>
                    </div>
                </div>
            </section>

            <h3>Trạng thái</h3>
            <section>
                <div class="form-group">
                    <label for="status">Xác nhận:</label>
                    <label class="checkbox-inline">
                        <input type="radio" id="status" name="status" checked="checked" value="1" {sactive}> Hiển thị
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" id="status" name="status" value="0" {sunactive}> Không
                    </label>
                </div>
            </section>
            <div class="modal-footer">
                <button type="submit" id="submit_add" class="btn btn-primary">Lưu</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="editVideo" tabindex="-1" role="dialog" aria-labelledby="editLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="editLabel">Sửa Video</h4>
      </div>
      <div class="modal-body-edit">
        <form method="post" action="http://www.auvietuc.edu.vn/myadmin/?q=communicate_confidently&r=edit"  enctype="multipart/form-data">
            <input type="hidden" name="id_edit" id="id_edit">
            <section>
                <div class="col-sm-3">
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" required class="form-control" name="title_edit" id="title_edit" placeholder="Enter title">
                </div>

            </section>
            <section>
                <div class="form-group">
                    <label for="image"> Hình ảnh video: </label>
                    <div class="input-group">
                        <input class="form-control" type="text" required placeholder="Click browse to choose image path" name="image_edit" id="image_edit" size="46"/>
                        <span class="input-group-btn">
                    <button type="button" onclick="BrowseImageFromServer('images:/','image_edit');"
                            class="btn btn-default">
                        Duyệt thư mục
                    </button> </span>
                    </div>
                </div>

                <p class="bg-warning">Vui lòng chỉ nhập 1 trong 2 (link video hoặc upload video)</p>
                <div class="form-group">
                    <label for="video"> Link video: </label>
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Click browse to choose video path" name="video_edit" id="video_edit" size="150"/>
                        <span class="input-group-btn"> </span>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="video"> Upload video: </label>
                    <div class="input-group">
                        <div class="row">
                            <div class="col-md-6">
                                <!--input class="form-control" type="file" name="file_edit" id="file_edit"/-->
                                <input class="form-control" type="text" placeholder="Click browse to choose video path"
                                name="video_upload_edit" id="video_upload_edit" size="150"/>
                            </div>
                            <div class="col-md-6">
                                <p id="value_file_edit"></p>
                            </div>
                         </div>
                    </div>
                </div>
            </section>

            <h3>Trạng thái</h3>
            <section>
                <div class="form-group">
                    <label for="status">Xác nhận:</label>
                    <label class="checkbox-inline">
                        <input type="radio" id="status_1" name="status_edit" value="1"> Hiển thị
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" id="status_0" name="status_edit" value="0"> Không
                    </label>
                </div>
            </section>
            <div class="modal-footer">
                <button type="submit" id="submit_edit" class="btn btn-primary">Lưu</button>
                <button type="button" id="close_edit"  class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>

<style>
    .modal-body {
        padding: 15px !important;
    }
    .modal-body-edit {
        padding: 15px !important;
    }
    .close {
        color: #000;
    }
    #file_edit {
        width: 220px;
    }
</style>

<script>
    // $('#close_edit').click(function () {
    //     var video = $('#video_edit').val();
    // });


    var msg = $("#msg").val();
    if (msg !== "") {
        if (msg == '1') {
            swal({
                title: 'Thêm video thành công',
                type: 'success',
            })
        } else if (msg == '0') {
            swal({
                title: 'Thêm video thất bại!',
                type: 'error'
            })
        } else if (msg == '3') {
                swal({
                title: 'Sửa video thành công',
                type: 'success',
            })
        } else if (msg == '4') {
            swal({
                title: 'Sửa video thất bại!',
                type: 'error'
            })
        } else if (msg == '5') {
            swal({
                title: 'Upload video không thành công!',
                type: 'error'
            })
        } else if (msg == '6') {
            swal({
                title: 'Vui lòng chọn link video hoặc upload video!',
                type: 'error'
            })
        }
        
    } 
</script>
