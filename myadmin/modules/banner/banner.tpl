<script src="{location}/js/grid.treegrid.js"></script>
<h2 class="ic-default">Thư viện hình ảnh</h2>
<div class="pad-lr">
	<table id="list"></table>
	<div id="jqGridPager"></div>
</div>
<script type="text/javascript">var folder_lib = "{folder_lib}";
	jQuery(document).ready( function() {
		jQuery("#list").jqGrid({
			url:'index_ajax.php?q=banner&r=getJsonList',
			datatype: 'json',
            styleUI : 'Bootstrap',
			mtype: 'GET',
			colNames:['ID','Tiêu đề', 'Hiển thị','Sắp xếp '],
			colModel :[{
				name:'id',
				index:'id',
				width:80,
				searchoptions: {
					sopt:['cn']
				}
			},{
				name:'title',
				index:'title',
				width:250,
				align:'left',
				editable:true,
				
				editrules: {
					required:true
				},
				searchoptions: {
					sopt:['cn']
				}
			},{
				name:'status',
				index:'status',
				width:100,
				align:'left',
				editable:true,
				edittype:'checkbox',
				editoptions: {
					value:"1:0"
				},
				formatter:'checkbox',
				searchoptions: {
					sopt:['cn']
				}
			},{
				name:'order',
				index:'order',
				width:100,
				align:'left',
				editable:true,
				editrules: {
					number:true
				},
				editoptions: {
					defaultValue: '0'
				},
				searchoptions: {
					sopt:['cn']
				}
			},
			],
			pager: '#jqGridPager',
			rowNum:10,
			width:1000,
			height:'auto',
			rowList:[10,20,30],
			subGrid : true,
			viewrecords: true,
			multiselect: true,
			multiboxonly: true,
			editurl: "index_ajax.php?q=banner&r=updateBannerCate&lang="+$('#lang').val(),
			subGridRowExpanded: function(subgrid_id, row_id) {
				var subgrid_table_id, pager_id;
				subgrid_table_id = subgrid_id+"_t";
				pager_id = "p_"+subgrid_table_id;
				$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
				jQuery("#"+subgrid_table_id).jqGrid({
					url:"index_ajax.php?q=banner&r=getSubGridJsonList&id="+row_id+"&lang="+$('#lang').val(),
					datatype: "json",
                    styleUI : 'Bootstrap',
					colNames: ['ID','Title','Description','Link','Image','is Active?','Order','Preview'],
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
					},
					{
						name:"link",
						index:"link",
						width:200,
						editable:true,
						editrules: {
							required:false
						}
					},{
						name:"image",
						index:"image",
						width:250,
						editable:true,
						editoptions: {
							dataEvents: [{
								type: 'click',
								data: {
									i: 7
								},
								fn: function(e) {
									BrowseImageFromServer("images:/","image");
								}
							}]
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
						name:"order",
						index:"order",
						width:80,
						editable:true,
						editrules: {
							number:true
						},
						editoptions: {
							defaultValue: '0'
						}
					},
                        {
						name:"preview",width:40,sortable: false
					}
					],
					rowNum:20,
					pager: pager_id,
					height: '100%',
					width:900,
					multiselect: true,
					multiboxonly: true,
					subGrid : true,
					caption:"Banner Management",
					viewrecords: true,
					editurl: "index_ajax.php?q=banner&r=updateBanner&cate_id="+row_id+"&lang="+$('#lang').val(),
					// preview Col
					loadComplete: function() {
						var arrIds = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
						jQuery.each(arrIds, function() {
							var image_path = jQuery("#"+subgrid_table_id).jqGrid('getCell',this,"image");
							jQuery("#"+subgrid_table_id).jqGrid('setRowData',this, {
								preview:"<img height='40px' width='40px' src='"+folder_lib+"images/"+image_path+"'/>"
							});
						});
					},
					subGridRowExpanded: function(subgrid_id2, row_id2) {
						var subgrid_table_id2, pager_id2;
						subgrid_table_id2 = subgrid_id2+"_t";
						pager_id2 = "p_"+subgrid_table_id2;
						$("#"+subgrid_id2).html("<table id='"+subgrid_table_id2+"' class='scroll'></table><div id='"+pager_id2+"' class='scroll'></div>");
						jQuery("#"+subgrid_table_id2).jqGrid({
							url:"index_ajax.php?q=banner&r=getSubGridJsonList2&id="+row_id2+"&lang="+$('#lang').val(),
							datatype: "json",
							styleUI : 'Bootstrap',
							colNames: ['ID','Tiêu đề','Mô tả','Link','Đường dẫn hình','Hiển thị','Sắp xếp','Hình ảnh'],
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
								},
								{
									name:"link",
									index:"link",
									width:200,
									editable:true,
									editrules: {
										required:false
									}
								},{
									name:"image",
									index:"image",
									width:250,
									editable:true,
									editoptions: {
										dataEvents: [{
											type: 'click',
											data: {
												i: 7
											},
											fn: function(e) {
												BrowseImageFromServerTHIS(this);
											}
										}]
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
									name:"order",
									index:"order",
									width:80,
									editable:true,
									editrules: {
										number:true
									},
									editoptions: {
										defaultValue: '0'
									}
								},
								{
									name:"preview",width:40,sortable: false
								}
							],
							rowNum:20,
							pager: pager_id2,
							height: '100%',
							width:900,
							multiselect: true,
							multiboxonly: true,
							viewrecords: true,
							editurl: "index_ajax.php?q=banner&r=updateBanner2&cate_id="+row_id2+"&lang="+$('#lang').val(),
							// preview Col
							loadComplete: function() {
								var arrIds = jQuery("#"+subgrid_table_id2).jqGrid('getDataIDs');
								jQuery.each(arrIds, function() {
									var image_path = jQuery("#"+subgrid_table_id2).jqGrid('getCell',this,"image");
									jQuery("#"+subgrid_table_id2).jqGrid('setRowData',this, {
										preview:"<img height='40px' width='40px' src='"+folder_lib+"images/"+image_path+"'/>"
									});
								});
							}
						});
						jQuery("#"+subgrid_table_id2).jqGrid('navGrid',"#"+pager_id2, {
									edit:true,
									add:true,
									del:true
								}

						)
					}
				});
				jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id, {
					edit:true,
					add:true,
					del:true
				}

				)
			}
		});

		jQuery("#list").jqGrid('navGrid','#jqGridPager', {
			edit:true,
			add:true,
			del:true
		}, {

		}, {

		}, {
			afterSubmit: function(resp) {
				var result = jQuery.trim(resp.responseText);				
				if (result == 1) {
					//document.localtion.href= "";
				} else {
					return [false, result, "Xóa thất bại"];
				}
			}
		});
	});</script>

