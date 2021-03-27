<h3 class="ic-default">Policies List</h3>
<div class="pad-lr">
    <table id="list"></table>
    <div id="pager"></div>
</div>
<script type="text/javascript">var folder_lib = "{folder_lib}";
    jQuery(document).ready( function() {
        jQuery("#list").jqGrid({
            url:'index_ajax.php?q=policy&r=getJsonList&lang=' + $("#lang").val(),
            datatype: 'json',
            styleUI : 'Bootstrap',
            mtype: 'GET',
            colNames:['ID','Code', 'Title','Status'],
            colModel :[{
                name:'id',
                index:'id',
                hidden:true,
                width:80,
                searchoptions: {
                    sopt:['cn']
                }
            },{
                name:'code',
                index:'code',
                width:90,
                align:'left',
                editable:true,
                editrules: {
                    required:true
                },
                searchoptions: {
                    sopt:['cn']
                }
            }, {
                name:'title',
                index:'title',
                width:90,
                align:'left',
                editable:true,
                editrules: {
                    required:true
                },
                searchoptions: {
                    sopt:['cn']
                }
            },{
                name : 'status',
                index : 'status',
                width : '10%',
                align : 'left',
                editable : true,
                edittype : "checkbox",
                editoptions : {
                    value : "1:0",
                    defaultValue : '1'
                },
                formatter : 'checkbox'
            }
            ],
            pager: '#pager',
            rowNum:10,
            width:1170,
            height:'auto',
            rowList:[10,20,30],
            viewrecords: true,
            multiselect: true,
            multiboxonly: true,
            caption:"Policies Management",
            editurl: "index_ajax.php?q=policy&r=update"
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
            caption : "Add",
            buttonicon : "ui-icon-plus",
            position : "first",
            onClickButton : function() {
                var url = 'index_ajax.php?q=policy&r=show&lang=' + $("#lang").val();
                $('.modal-body').load(url, function(result){
                    $('#myModal').modal({show:true});
                });
                return true;
            }
        });
        jQuery("#list").jqGrid('navButtonAdd', '#pager', {
            caption : "Edit",
            buttonicon : "ui-icon-plus",
            position : "first",
            onClickButton : function() {
                var id = jQuery("#list").jqGrid('getGridParam', 'selrow');
                if (id) {
                    var url = 'index_ajax.php?q=policy&r=show&id=' + id + "&lang="+ $("#lang").val();
                    $('.modal-body').load(url, function(result){
                        $('#myModal').modal({show:true});
                    });
                    return true;
                } else {
                    alert("Please select Row");
                }
                return true;
            }
        });
//        $("#lang").on("change", function() {
//            var lang = $("#lang").val();
//            var url = site_folder + "/myadmin/?q=policy&r=getJsonList&lang=" + lang;
//            $.ajax({
//                url : url,
//                type : "POST",
//                success : function(data) {
//                    location.reload();
//                    return true;
//                }
//            });
//        });
    });</script>