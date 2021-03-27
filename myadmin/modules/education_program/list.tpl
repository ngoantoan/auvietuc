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
            url: 'index_ajax.php?q=education_program&r=getJsonList&lang=' + $('#lang').val(),
            datatype: 'json',
            styleUI: 'Bootstrap',
            mtype: 'POST',
            colNames: ['Chỉnh sửa', 'Trạng thái', 'Tiêu đề', 'Image', 'kích hoạt', 'Sắp xếp', 'Ngày tạo', 'Ảnh'],
            colModel: [{
                    name: 'act',
                    width: 100,
                    search: false,
                    index: 'act'
                },{
                    name: 'id_onoff',
                    width: 100,
                    search: false,
                    index: 'id_onoff'
                },{
                    name: 'title',
                    width: 250,
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
                },{
                    name: 'sort',
                    width: 50,
                    index: 'sort',
                    editoptions: {
                        style: "width:250px;"
                    },
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
            width: "1300",
            autowidth: false,
            autoheight: false,
            scrollOffset: "0",
            forceFit: true,
            closeAfterAdd: true,
            closeAfterEdit: true,
            rownumbers: true,
            subGrid: true,
            multiselect: true,
            multiboxonly: true,
            sortname: "sort",
            sortorder: "asc",
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
                        "  <ul class='dropdown-menu' style='position: initial;' role='menu' aria-labelledby='dropdownMenu1'>\n" +
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
            editurl: "index_ajax.php?q=education_program&r=update&lang=" + $("#lang").val(),
            loadComplete: function () {
                var arrIds = jQuery("#list").jqGrid('getDataIDs');
                jQuery.each(arrIds, function () {
                    var image_path = jQuery("#list").jqGrid('getCell', this, "image");
                    jQuery("#list").jqGrid('setRowData', this, {
                        preview: "<img height='40px' width='40px' src='" + folder_lib + "/images/" + image_path + "'/>",
                    });
                });
            },
            subGridRowExpanded: function(subgrid_id, row_id) {
				var subgrid_table_id, pager_id;
				subgrid_table_id = subgrid_id+"_t";
				pager_id = "p_"+subgrid_table_id;
				$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
				jQuery("#"+subgrid_table_id).jqGrid({
					url:"index_ajax.php?q=education_program&r=getEducationCategoryGridJsonList&education_id="+row_id,
					datatype: "json",
                    styleUI : 'Bootstrap',
					colNames: ['ID','Tiêu đề ', 'Trạng thái', 'Thao tác'],
					colModel: [{
                            name:"id",
                            index:"id",
                            width:50
                        },{
                            name:"title",
                            index:"title",
                            width:200,
                            hidden:false,
                            editable:true,
                            editrules: {
                                required:true
                            }
                        },{
                            name:"status",
                            index:"status",
                            width:80,
                            editable:true,
                            edittype:'checkbox',
                            editoptions: {
                                value:"1:0",
                                defaultValue: '1'
                            },
                            formatter:'checkbox'
                        },{
                            index : 'actions',
                            name: "actions",
                            width: 90,
                            search:false
                        }],
					rowNum:20,
					pager: pager_id,
					height: '100%',
					width:1180,
					multiselect: true,
					multiboxonly: true,
					subGrid : true,
					caption:"Danh mục",
					viewrecords: true,
					// editurl: "index_ajax.php?q=education_program&r=updateBanner&cate_id="+row_id+"&lang="+$('#lang').val(),
					// preview Col
					loadComplete: function() {
						var arrIds = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
						jQuery.each(arrIds, function() {
                            var id = jQuery("#" + subgrid_table_id).jqGrid('getCell', this, "id");
							jQuery("#"+subgrid_table_id).jqGrid('setRowData',this, {
                                actions : "<a style='margin-right:5px;' class='btn btn-primary' onclick='editEducationCategoryBlog("+ id +")' >Cập nhật</a><button data-id='"+ id +"' onclick='delEducationCategoryBlog("+ id +")' class=' btn btn-danger' >Xóa</button>"
							});
						});
					},
                    subGridRowExpanded: function(subgrid_id2, row_id2) {
						var subgrid_table_id2, pager_id2;
						subgrid_table_id2 = subgrid_id2+"_t";
						pager_id2 = "p_"+subgrid_table_id2;
						$("#"+subgrid_id2).html("<table id='"+subgrid_table_id2+"' class='scroll'></table><div id='"+pager_id2+"' class='scroll'></div>");
						jQuery("#"+subgrid_table_id2).jqGrid({
							url:"index_ajax.php?q=education_program&r=getSubGridJsonList&category_id="+row_id2,
							datatype: "json",
							styleUI : 'Bootstrap',
							colNames: ['ID','Tiêu đề ','Mô tả','Trạng thái', 'Thao tác'],
                            colModel: [{
                                    name:"id",
                                    index:"id",
                                    width:50
                                },{
                                    name:"title",
                                    index:"title",
                                    width:200,
                                    hidden:false,
                                    editable:true,
                                    editrules: {
                                        required:true
                                    }
                                },
                                {
                                    name:"description",
                                    index:"description",
                                    width:200,
                                    editable:true,
                                    editrules: {
                                        required:false
                                    }
                                },{
                                    name:"status",
                                    index:"status",
                                    width:80,
                                    editable:true,
                                    edittype:'checkbox',
                                    editoptions: {
                                        value:"1:0",
                                        defaultValue: '1'
                                    },
                                    formatter:'checkbox'
                                },{
                                    index : 'actions',
                                    name: "actions",
                                    width: 90,
                                    search:false
                                }],
                            rowNum:20,
							pager: pager_id2,
							height: '100%',
							width:1100,
							multiselect: true,
							multiboxonly: true,
							viewrecords: true,
							// editurl: "index_ajax.php?q=banner&r=updateBanner2&cate_id="+row_id2+"&lang="+$('#lang').val(),
							// preview Col
							loadComplete: function() {
								var arrIds2 = jQuery("#"+subgrid_table_id2).jqGrid('getDataIDs');
								jQuery.each(arrIds2, function() {
                                    var id = jQuery("#" + subgrid_table_id2).jqGrid('getCell', this, "id");
                                    jQuery("#"+subgrid_table_id2).jqGrid('setRowData',this, {
                                        actions : "<a style='margin-right:5px;' class='btn btn-primary' onclick='editEducationBlog("+ id +")' >Cập nhật</a><button data-id='"+ id +"' onclick='delCoupon("+ id +")' class=' btn btn-danger' >Xóa</button>"
                                    });
                                });
							},
						});
						jQuery("#"+subgrid_table_id2).jqGrid('navGrid',"#"+pager_id2, {
                            edit:false,
                            add:false,
                            del:false,
                            search: false
                        });
                        jQuery("#" + subgrid_table_id2).jqGrid('navButtonAdd', "#" + pager_id2, {
                            caption: "<b><i class='glyphicon glyphicon-plus'></i></b>",
                            buttonicon: "ui-icon-plus",
                            position: "first",
                            onClickButton: function () {
                                var url = 'index_ajax.php?q=education_program&r=showBlogEducation&category_id=' + row_id2;
                                $('.modal-body').load(url, function (result) {
                                    $('#myModal').modal({show:true});
                                });
                                return true;
                            }
                        });
					}
				});
				jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id, {
					edit:false,
					add:false,
					del:false,
                    search: false
				});
                jQuery("#" + subgrid_table_id).jqGrid('navButtonAdd', "#" + pager_id, {
                    caption: "<b><i class='glyphicon glyphicon-plus'></i></b>",
                    buttonicon: "ui-icon-plus",
                    position: "first",
                    onClickButton: function () {
                        var url = 'index_ajax.php?q=education_program&r=showEducationCategoryBlog&education_id=' + row_id;
                        $('.modal-body').load(url, function (result) {
                            $('#myModal').modal({show:true});
                        });
                        return true;
                    }
                });
			},
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
                var url = 'index_ajax.php?q=education_program&r=show&lang=' + $("#lang").val();
                $('.modal-body').load(url, function (result) {
                    $('#myModal').modal({show:true});
                    $("#img_load_gif").addClass("hidden");
                });
                return true;
            }
        });
    });

    function edit(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=education_program&r=show&lang=' + $("#lang").val()+'&id=' + _id ;
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }
    function getList(lang_id) {
        $.post("index_ajax.php?q=education_program&r=getCategory3", "", function (res) {
            reload();
        });
    }
    function reload() {
        jQuery("#list").jqGrid('setGridParam', {
            url: 'index_ajax.php?q=education_program&r=getJsonList&lang=' + $("#lang").val()
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
        var url = 'index_ajax.php?q=education_program&r=update&oper=update_status&id=' + _id + '&status=' + status + '&lang=' + $("#lang").val();
        $.post( url, function( data ) {
            return false;
        });
    }
    function duplicate(_id) {
        $("#img_load_gif").removeClass("hidden");
        if (_id) {
            var url = 'index_ajax.php?q=education_program&r=show_copy&id=' + _id + '&lang=' + $("#lang").val();
            $('.modal-body').load(url, function (result) {
                $('#myModal').modal({show:true});
                $("#img_load_gif").addClass("hidden");
            });
            return true;
        } else {
            alert("Please select Row")
        }
    }
    function editEducationBlog(_id) {
        $("#img_load_gif").removeClass("hidden");
        var url = 'index_ajax.php?q=education_program&r=showBlogEducation&id=' + _id;
        $('.modal-body').load(url, function (result) {
            $('#myModal').modal({show:true});
            $("#img_load_gif").addClass("hidden");
        });
        return true;
    }
    function delCoupon(id) {
        var person = prompt("Lý do xóa danh mục sản phẩm này?", "");
        if (person != null && person != "") {
            window.location.href = site_folder + "/myadmin/?q=education_program&r=updateEducationBlog&oper=del&id=" + id;
        }
	};
    // cập nhật danh mục tin tức chương trình đào tạo
    function editEducationCategoryBlog(_id) {
        $("#img_load_gif").removeClass("hidden");
        var url = 'index_ajax.php?q=education_program&r=showEducationCategoryBlog&id=' + _id;
        $('.modal-body').load(url, function (result) {
            $('#myModal').modal({show:true});
            $("#img_load_gif").addClass("hidden");
        });
        return true;
    }
    // xóa danh mục tin tức chương trình đào tạo
    function delEducationCategoryBlog(id) {
        var person = prompt("Lý do xóa danh mục sản phẩm này?", "");
        if (person != null && person != "") {
            var url = 'index_ajax.php?q=education_program&r=updateEducationCategoryBlog&oper=del&id=' + id;
            $('.modal-body').load(url, function (result) {
                if (result == 0) {
                    swal({
                        title: 'Cảnh báo!',
                        text: 'Vui lòng xóa tin tức trong danh mục này trước!',
                        type: 'warning',
                        icon: 'warning',
                    })
                } else {
                    swal({
                        title: 'Thành công!',
                        text: 'xóa danh mục thanh công',
                        type: 'success',
                        timer: 1500

                    }).then(function () {
                            $('#myModal').modal('hide');
                            self.parent.jQuery("#list").trigger("reloadGrid");
                        },
                        function (dismiss) {
                            if (dismiss === 'timer') {
                                $('#myModal').modal('hide');
                                self.parent.jQuery("#list").trigger("reloadGrid");
                            }
                        }
                    )
                }
            });
        }
	};

</script>

<style>
    .ui-jqgrid .ui-jqgrid-btable tbody tr.jqgrow td {
        white-space: inherit!important;
    }
    .ui-pg-div b {
        padding: 6px 10px;
    }
</style>