<h2 class="ic-default">Danh sách tài khoản</h2>
<div class="pad-lr">
        <table id="list"></table>
        <div id="pager"></div>
</div>
<script type="text/javascript">
var folder_lib = "{folder_lib}";
jQuery(document).ready(function(){ 
	var list = jQuery("#list");
	list.jqGrid({
	    url:'index_ajax.php?q=user&r=getJsonList',
	    datatype: 'json',
        styleUI : 'Bootstrap',
	    mtype: 'GET',
	    colNames: ['ID','UserName','Tên thật','Email','Điện thoại','Password','Active'],
				colModel: [
					{ name:"id",index:"id",width:50,hidden:true},
					{ name:"login_name",index:"login_name",width:200,editable:true,editrules:{ required:true}, editoptions:{  size:40},searchoptions:{ sopt:['cn']} },
					{ name:"fullname",index:"fullname",width:200,editable:true,editrules:{ required:true}, editoptions:{  size:40},searchoptions:{ sopt:['cn']} },
					{ name:"email",index:"email",width:200,editable:true,editrules:{ required:true}, editoptions:{  size:40},searchoptions:{ sopt:['cn']} },
					{ name:"phone",index:"phone",width:200,editable:true,editrules:{ required:true}, editoptions:{  size:40},searchoptions:{ sopt:['cn']} },
					{ name:"password",index:"password",width:200,hidden:true,edittype:'password',editoptions:{  size:30},editrules:{ edithidden:true, required:true}},
					{ name:"is_active",index:"is_active",width:200,editable:true,edittype:'checkbox',editoptions:{  value:"1:0"}, formatter:'checkbox',searchoptions:{ sopt:['cn']} },
				 ], 
	    pager: '#pager',
	    rowNum:10,
		width:1200,
		height:'auto',
	    rowList:[10,20,30],
		viewrecords: true,
        subGrid : false,
	    caption: '{page_title}',
		editurl: "index_ajax.php?q=user&r=update",
        subGridRowExpanded: function(subgrid_id, row_id) {
            var subgrid_table_id, pager_id;
            subgrid_table_id = subgrid_id+"_t";
            pager_id = "p_"+subgrid_table_id;
            $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
            jQuery("#"+subgrid_table_id).jqGrid({
                url:"index_ajax.php?q=user&r=getSubGridJsonList&id=" + row_id,
                datatype: "json",
                styleUI : 'Bootstrap',
                colNames: ['ID','Title'],
                colModel: [
                    { name:'id', index:'id', hidden:true, width:80, searchoptions: { sopt:['cn']}},
                    { name:'description', index:'description', width:200, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}}
                ],
                rowNum:20,
                pager: pager_id,
                height: '100%',
                width:1070,
                multiselect: true,
                multiboxonly: true,
                caption:"Roles",
                viewrecords: true,
                editurl: "index_ajax.php?q=user&r=updatesub&id=" + row_id
            });
            jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id, {
                        edit:false,
                        add:false,
                        del:false
                    }
            );
        }
  });
var id;
	list.jqGrid('navGrid',"#pager",{ edit:false,add:false,del:true});
	list.jqGrid('navButtonAdd', "#pager", {
		caption: "Edit",buttonicon: "ui-icon-pencil",position: "first",
		onClickButton: function(){
		    id = list.jqGrid('getGridParam', 'selrow');
		    if (id) {
                var url = 'index_ajax.php?q=user&r=show&id=' +id;
                $('.modal-body').load(url, function(result){
                    $('#myModal').modal({show:true});
                });
				return true;
		    } else {
		        alert("Please select Row")
		    }
		}
	});
	
	jQuery("#list").jqGrid('navButtonAdd', "#pager", {
	    caption: "Add",buttonicon: "ui-icon-plus",position: "first",
	    onClickButton: function(){
            var url = 'index_ajax.php?q=user&r=show';
            $('.modal-body').load(url, function(result){
                $('#myModal').modal({show:true});
            });
            return true;
	    }
	});
});
</script>