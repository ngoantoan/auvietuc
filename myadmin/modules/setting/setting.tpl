<h3 class="ic-default">Cấu hình</h3>

<div class="pad-lr">
    <table id="list"></table>
    <div id="pager"></div>
</div>
<script type="text/javascript">var folder_lib = "{folder_lib}";
    jQuery(document).ready( function() {
        jQuery("#list").jqGrid({
            url:'index_ajax.php?q=setting&r=getJsonList',
            datatype: 'json',
            styleUI : 'Bootstrap',
            mtype: 'GET',
            colNames:['ID','Phí giải bài ND(VND)','Phí giải bài QT($)','Bài khó (%)','Meta','Google analytics'],
            colModel :[{ name:'id', index:'id', hidden:true,width:20, searchoptions: { sopt:['cn']}},
                { name:'phi_giai_bai', index:'phi_giai_bai', width:60, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
                { name:'phi_giai_bai_en', index:'phi_giai_bai', width:60, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
                { name:'bai_kho', index:'bai_kho', width:60, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
                { name:'meta', index:'meta', width:90, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
                { name:'google_analytics', index:'google_analytics', width:90, align:'left', editable:true, editrules: { required:true}, searchoptions: { sopt:['cn']}},
            ],
            pager: '#pager',
            rowNum:10,
            width:1170,
            height:'auto',
            rowList:[10,20,30],
            subGrid : false,
            viewrecords: true,
            multiselect: true,
            multiboxonly: true,
            caption:"Cấu hình",
            editurl: "index_ajax.php?q=setting&r=update",

        });

        var grid = jQuery('#list').navGrid('#pager', {
            edit : true,
            add : false,
            del : false,
            search : false
        }, {

            reloadAfterSubmit : true

        }, {
            closeAfterEdit : false,
            reloadAfterSubmit : true

        }, {
            reloadAfterSubmit : true

        });
    });</script>