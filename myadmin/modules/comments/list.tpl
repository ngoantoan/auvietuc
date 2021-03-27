<h3 class="ic-default">Comments List</h3>
<div class="pad-lr">
    <table id="list"></table>
    <div id="pager"></div>
</div>
<script type="text/javascript">var folder_lib = "{folder_lib}";
    jQuery(document).ready( function() {
        jQuery("#list").jqGrid({
            url:'index_ajax.php?q=comments&r=getJsonList',
            datatype: 'json',
            styleUI : 'Bootstrap',
            mtype: 'GET',
            colNames:['ID','Fullname','Title', 'Contents ','Rate', 'Created Date'],
            colModel :[{
                name:'id',
                index:'id',
                hidden:true,
                width:80,
                searchoptions: {
                    sopt:['cn']
                }
            },{
                name:'fullname',
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
            },{
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
            }, {
                name:'contents',
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
                name : 'rate',
                index : 'rate',
                width : '30',
                align : 'left',
                editable : true,
            }, {
                name:'created_date',
                index:'created_date',
                width:40,
                align:'left',
                editable:true,
                formatter:'date',
                editrules: {
                    required:true
                },
                searchoptions: {
                    sopt:['cn']
                }
            },
            ],
            pager: '#pager',
            rowNum:10,
            width:1170,
            height:'auto',
            rowList:[10,20,30],
            viewrecords: true,
            multiselect: true,
            multiboxonly: true,
            caption:"Comments Management",
            editurl: "index_ajax.php?q=comments&r=update"
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
                var url = 'index_ajax.php?q=comments&r=show';
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
                    var url = 'index_ajax.php?q=comments&r=show&id=' + id;
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