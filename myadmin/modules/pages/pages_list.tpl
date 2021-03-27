<h2 class="ic-default">PAGE LIST</h2>
<div class="pad-lr">
	<div class="BodyContainer">
		<table id="list"></table>
		<div id="pager"></div>
	</div>
</div>
<div id="content-iframe" class="col-xs-12">
	<div>
	<a href="#close" title="Close" class="close">X</a>
	<iframe id="modal-iframe" scrolling="no" style="overflow:hidden;" border='none' src="" width="100%" height="650px" frameborder="0" allowtransparency="true"></iframe>
	</div>
</div>
<!-- /.modal -->
<script type="text/javascript">
	function config() {
		var id = jQuery("#list").jqGrid('getGridParam', 'selrow');
		if (id == null || id == "") {
			alert("Please, select row");
			return false;
		}
		document.location = "?q=page_setting&id=" + id;
	};
	$(".close").click(function(e){
		$("#content-iframe").css("opacity", 0);
		$("#content-iframe").css("pointer-events", "none");
		$("#content-iframe").hide();
	});
	jQuery(document).ready(function() {
		jQuery("#list").jqGrid({
			url : 'index_ajax.php?q=pages&r=getJsonList',
			datatype : 'json',
			mtype : 'GET',
            styleUI : 'Bootstrap',
			colNames : ['ID', 'Page Code', 'Template'],
			colModel : [{
				name : 'id',
				index : 'id',
				hidden : true,
				width : 80,
				searchoptions : {
					sopt : ['cn']
				}
			}, {
				name : 'code',
				index : 'code',
				align : 'left',
				editable : true,
				editrules : {
					required : true
				},
				searchoptions : {
					sopt : ['cn']
				}
			}, {
				name : 'html_file',
				index : 'html_file',
				align : 'left',
				editable : true,
				edittype : "select",
				editoptions : {
					value : "default.tpl:default.tpl"
				},
				searchoptions : {
					sopt : ['cn']
				}
			}],
			pager : '#pager',
			rowNum : 15,
			width : 1170,
			height : 'auto',
            autoWidth: true,
			rowList : [15, 30, 50],
			subGrid : true,
			viewrecords : true,
			caption : '{page_title}',
			sortorder : 'desc',
			editurl : "index_ajax.php?q=pages&r=update",
			subGridRowExpanded : function(subgrid_id, row_id) {
				var subgrid_table_id, pager_id;
				subgrid_table_id = subgrid_id + "_t";
				pager_id = "p_" + subgrid_table_id;
				$("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
				jQuery("#" + subgrid_table_id).jqGrid({
					url : "index_ajax.php?q=pages&r=getSubGridJsonList&id=" + row_id,
					datatype : "json",
                    styleUI : 'Bootstrap',
					colNames : ['ID', 'Page name', 'Description', 'Meta Title', 'Meta Keyword', 'Meta Description', 'Language'],
					colModel : [{
						name : 'id',
						index : 'id',
						hidden : true,
						width : 80,
						searchoptions : {
							sopt : ['cn']
						}
					}, {
						name : 'pages_title',
						index : 'pages_title',
						width : 150,
						align : 'left',
						editable : true,
						editoptions : {

						},
						editrules : {
							required : true
						}
					}, {
						name : 'pages_description',
						index : 'pages_description',
						width : 150,
						align : 'left',
						editable : true,
						edittype : "textarea",
						editoptions : {
							rows : "4",
							cols : "25"
						}
					}, {
						name : 'seo_title',
						index : 'seo_title',
						width : 150,
						align : 'left',
						editable : true,
						editoptions : {

						}
					}, {
						name : 'seo_keyword',
						index : 'seo_keyword',
						width : 150,
						align : 'left',
						editable : true,
						editoptions : {

						}
					}, {
						name : 'seo_description',
						index : 'seo_description',
						width : 150,
						align : 'left',
						editable : true,
						edittype : "textarea"
					}, {
						name : 'lang',
						index : 'lang',
						width : 100,
						sortable : false,
						search : false,
						editable : true,
						edittype : 'select',
						formatter : 'select',
						editoptions : {
							value : "1:Vietnamese;2:English"
						}
					}],
					rowNum : 20,
					pager : pager_id,
					height : '100%',
					width : 1000,
					viewrecords : true,
					sortname : 'lang',
					sortorder : 'desc',
					editurl : "index_ajax.php?q=pages&r=updatePageLang&pages_id=" + row_id
				});
				jQuery("#" + subgrid_table_id).jqGrid('navGrid', "#" + pager_id, {
					edit : true,
					add : true,
					del : true,
					search : false
				});
			}
		});

		jQuery("#list").jqGrid('navGrid', '#pager', {
			edit : true,
			add : true,
			del : true
		});
		jQuery("#list").jqGrid('navButtonAdd', '#pager', {
			caption : "config",
			buttonicon : "ui-icon-gear",
			position : "first",
			onClickButton : function() {
				var id = jQuery("#list").jqGrid('getGridParam', 'selrow');
				if (id == null || id == "") {
					alert("Please, select row");
					return false;
				}
				var src = "index_ajax.php?q=page_setting&id=" + id + "&r=show";
				$("#modal-iframe").attr('src', src);
				$("#content-iframe").css("opacity", 1);
				$("#content-iframe").css("pointer-events", "auto");
//				$("#content-iframe").show();
				var url= site_folder+ "/myadmin/index_ajax.php?q=page_setting&id=" + id + "&r=show";
				window.open(url);
				return;
			}
		});

	}); 
</script>