<h3 class="ic-default">Contact</h3>
<div class="pad-lr">
    <table id="list"></table>
    <div id="pager"></div>
</div>
<script type="text/javascript">
var folder_lib = "{folder_lib}";
jQuery(document).ready( function() {
    jQuery("#list").jqGrid({
        url:'index_ajax.php?q=contact&r=getJsonList',
        datatype: 'json',
        styleUI : 'Bootstrap',
        mtype: 'GET',
        colNames:['ID','Họ tên','Ngày sinh', 'Địa chỉ','Số điện thoại','Email', 'Khóa học quan tâm', 'Content'],
        colModel :[{ name:'id', index:'id', hidden:true,width:20, searchoptions: { sopt:['cn']}},
            { name:'name',index:'name', width:50, editable:true, searchoptions: { sopt:['cn']}},
            { name:'birthday', index:'birthday', width:40, align:'left', editable:false, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            { name:'address', index:'address', width:60, align:'left', editable:false, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            { name:'phone', index:'phone', width:40, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            { name:'email', index:'email', width:60, align:'left', editable:false, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            { name:'education_program', index:'education_program', width:100, align:'left', editable:false, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            { name:'body', index:'body', hidden:false, width:50, align:'left', editable:false, editrules: { required:true}, searchoptions: { sopt:['cn']}},
        ],
        pager: '#pager',
        rowNum:10,
        width:1200,
        height:'auto',
        rowList:[10,20,30],
        subGrid : false,
        viewrecords: true,
        multiselect: true,
        multiboxonly: true,
        editurl: "index_ajax.php?q=contact&r=update"
    });
    var grid = jQuery('#list').navGrid('#pager', {
        edit : false,
        add : false,
        del : true,
        search : false
    }, {
        reloadAfterSubmit : true
    }, {
        closeAfterEdit : false,
        reloadAfterSubmit : true
    }, {
        reloadAfterSubmit : true
    });
    jQuery("#list").jqGrid('navButtonAdd', '#pager', {
        caption : "Export Excel",
        buttonicon : "ui-icon-pencil",
        viewrecords : true,
        position : "first",
        onClickButton : function() {
            var id = jQuery("#list").jqGrid('getGridParam', 'selrow');
            // if (id) {
                window.location.href = site_folder + '/myadmin?q=contact&r=export&id=' + id;
            // } else {
            //     alert("Please select row");
            // }
        }
    });
});</script>