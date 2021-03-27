
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="{location}/css/admin.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript" src="{location}/js/json.js"></script>
    <script type="text/javascript" src="{location}/js/ui.js"></script>
    <script type="text/javascript" src="{location}/js/jquery.draggable.js"></script>
    <script type="text/javascript" src="{location}/js/jquery.sortable.js"></script>
    <script type="text/javascript" src="{location}/js/jquery.droppable.js"></script>
    <script type="text/javascript" src="{location}/js/thickbox.js"></script>
    <link type="text/css" href="{location}/css/thickbox.css" rel="stylesheet" />
<style type="text/css">
	body {
		background: none;
		background-color: #FFFFFF;
		height: 99%;
	}
    .column {
        width: 170px;
        float: left;
        padding-bottom: 0px;
        border: 2px solid #F6A828;
        margin: 10px;
		min-height:50px;
    }
    
    .column_module {
        width: 170px;
        float: left;
        padding-bottom: 0px;
        border: 2px solid #A6C9E2;
       /* margin-left: 10px;*/
        margin-right: 10px;
    }
    
    #module_list {
        height: 425px;
        overflow-y: auto;
        position: static;
    }
    
    .portlet, .portlet_module {
        margin: 0.5em;
    }
    
    .portlet-header {
        margin: 0.3em;
        padding: 4px;
    }
    
    .portlet-header .ui-icon {
        float: right;
    }
    
    .portlet-content {
        padding: 0.4em;
    }
    
    .ui-sortable-placeholder {
        border: 1px dotted #F6A828;
        visibility: visible !important;
        height: 50px !important;
    }
    
    .ui-sortable-placeholder * {
        visibility: hidden;
    }
       
    #module_setting {
        background-color: #F9FCFE;
    }
</style>
<script type="text/javascript">
    $(function(){
        $(".column").sortable({
            connectWith: '.column'
        });
        var trash_icon = '<a href="#" title="Delete this module" class="ui-icon ui-icon-trash">Delete</a>';
        var plusthick_icon = '<a href="#" title="toogle this module" class="ui-icon ui-icon-plusthick">toogle</a>';
        
        //.ui-icon-wrench
        $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".portlet-header").addClass("ui-widget-header ui-corner-all").prepend(trash_icon) //.prepend(plusthick_icon)
   		 .end().find(".portlet-content");
        
        $(".portlet_module").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".portlet-header").addClass("ui-widget-header ui-corner-all").prepend(plusthick_icon).end().find(".portlet-content");
         
        $(".portlet_module").draggable({
            connectToSortable: '.column',
            helper: 'clone',
            revert: 'true',
            opacity: .50
        });
        
        $(".column").droppable({
            accept: '.portlet_module',
            activeClass: 'ui-state-highlight',
            drop: function(ev, ui){
                //Add Delete Icon
                if (ui.draggable.find(".portlet-header").find('a.ui-icon-trash').length < 1) {
                    var el = $(trash_icon).filter('a').click(function(){
                        el.parents(".portlet_module:first").remove()
                    }).end();
                    ui.draggable.find(".portlet-header").append(el);
                }
                
                ui.draggable.find(".portlet-header").find('a.ui-icon-plusthick').parents(".portlet_module:first").find(".portlet-content").remove();
                ui.draggable.find(".portlet-header").find('a.ui-icon-plusthick').remove();
            }
        });
        
        
        $(".column").disableSelection();
        $(".portlet_module").disableSelection();
        
        // resolve the icons behavior with event delegation
        $('.portlet-header .ui-icon').click(function(ev){
            var $item = $(this);
            var $target = $(ev.target);
            if ($target.is('a.ui-icon-wrench')) {
                openModuleSetting($item);
            }
            else
                if ($target.is('a.ui-icon-trash')) {
                    deleteModule($item);
                }
                else 
                    if ($target.is('a.ui-icon-plusthick')) {
                        toogleDescription($item);
                    }
            return false;
        });
        
        function deleteModule(obj){
            var answer = confirm("Are you sure to remove this module?")
            if (answer) {
                obj.parents(".portlet:first").remove();
            }
            return false;
        }
        
        function toogleDescription(obj){
            obj.toggleClass("ui-icon-minusthick");
            obj.parents(".portlet_module:first").find(".portlet-content").toggle();
        }
        
        $('.portlet-content').css('display', 'none');
    });
    //Save Setting
    function SaveSetting(){
        var saveString = '[ ';
        var blocks = $('.column');
        jQuery.each(blocks, function(i, val){
            var blockitem = this;
            var modules = $(this).find('.module');
            jQuery.each(modules, function(i, val){
            
                saveString = saveString + '{ "modules_id":"' + this.id + '","positions_id":"' + blockitem.id + '","modules_order":"' + i + '"},';
                
            });
            
        });
        saveString = saveString.substr(0, (saveString.length - 1)) + ']';
        var url = "index_ajax.php?q=page_setting&r=savePage&page_id=" + "{page_id}";
        
        
        $.post(url, {
            items: saveString
        }, function(data){
            var config_icon = '<a class="ui-icon ui-icon-wrench" title="config modules" href="#">Config</a>';
            var news = $('.column').find('.portlet-header.module');
            $(news).find('a.ui-icon-wrench').remove();
            $(news).append(config_icon);
            document.location = document.location.href;//refesh
        });
        
    }
    
    function openModuleSetting(obj){
        var id = $(obj).attr("id");
        var src = "index_ajax.php?q=page_setting&r=configModule&layout_id=" + id ;//+ "&TB_iframe=true&width=900&height=650";
		//$("#linkconfig").attr('href', src);
		//$("#linkconfig").click();
		window.open(src);
		//var src = "index_ajax.php?q=page_setting&r=configModule&layout_id=" + id;
		//$("#modal-iframe").attr('src', src);
		//$("#mySettingModal").modal();
    }
</script>
<h2 class="ic-default">Page configuration <span style="color:red;">{PAGE_NAME}</span></h2>
<div class="pad-lr">
    <!-- START BLOCK : messages -->
    <div id="message" class="updated fade">
        <p>
            <strong>{message}</strong>
        </p>
    </div>
    <!-- END BLOCK : messages -->
    <div class="demo">
        <div style="-moz-user-select: none;" unselectable="off" class="column_module ui-sortable">
            <h3 class="ui-widget-header" style="margin:0;">MODULES LIST</h3>
            <div id="module_list">
                <!-- START BLOCK : modules_item -->
                <div class="portlet_module">
                    <div class="portlet-header module" id="@@{id}">
                        {name}
                    </div>
                    <div style="display: block;" class="portlet-content">
                        {description}
                    </div>
                </div>
                <!-- END BLOCK : modules_item -->
            </div>
        </div>
    </div>
    {modules_of_page}
    <div style="text-align:center;margin-top:15px;">
        <input class="btn btn-primary radius" type="button" value="Save Changes" onclick="SaveSetting();"/>
		<a style="display:none;" id="linkconfig" class="thickbox" href="#">Config</a>
    </div>
</div>