<script src="{location}/js/grid.treegrid.js"></script>
<h2 class="ic-default">CẤU HÌNH CÁC THÔNG TIN</h2>
<div class="pad-lr">
	<table id="list"></table>
	<div id="jqGridPager"></div>
</div>
<script type="text/javascript">var folder_lib = "{folder_lib}";
	jQuery(document).ready( function() {
		jQuery("#list").jqGrid({
			url:'index_ajax.php?q=infosetting&r=getJsonList',
			datatype: 'json',
            styleUI : 'Bootstrap',
			mtype: 'GET',
            colNames:['ID','CODE', 'Tiêu đề', 'Trạng thái'],
			colModel :[{
				name:'id',
				index:'id',
				width:40,
				searchoptions: {
					sopt:['cn']
				}
			},{
				name:'code',
				index:'code',
				width:180,
				align:'left',
				editable:false,
				editrules: {
					required:true
				},
				searchoptions: {
					sopt:['cn']
				}
			},{
                name:"title",
                index:"title",
                width:100,
                editable:true
			},{
                name : 'status',
                index : 'status',
                editable : true,
                width : 80,
                edittype : "checkbox",
                editoptions : {
                    value : "1:0",
                    defaultValue : '1'
                },
                formatter : 'checkbox',
                search : false
            }],
			pager: '#jqGridPager',
			rowNum:10,
			width:1170,
			height:'auto',
			rowList:[10,20,30],
			subGrid : false,
            sortname : "id",
            sortorder : "desc",
			viewrecords: true,
			multiselect: true,
			multiboxonly: true,
			editurl: "index_ajax.php?q=infosetting&r=update"
		});

		jQuery("#list").jqGrid('navGrid','#jqGridPager', {
			edit:true,
			add:true,
			del:false
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

