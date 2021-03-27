<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Module setting</title>
        <link type="text/css" rel="stylesheet" href="{location}/css/admin.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="//cdn.ckeditor.com/4.5.4/full/ckeditor.js"></script>
        <script type="text/javascript" src="../editor/filemanagement/ckfinder.js"></script>
        <script>var ckfinder_path = '{ckfinder_path}', site_folder = '{site_folder}';</script>
         <script src="{location}/js/main.js" type="text/javascript"></script>
    </head>
    <body>
<script>
function saveStaticContent(){
    var static_content = document.getElementById('agent').value;
    var layout_id = document.getElementById('layout_id').value;
    page_setting.updateStaticContentModule(static_content, layout_id, {
        target: 'dragDropContainer'
    });
}

//function BrowseImageFromServer(elementId ) {
//    CKFinder.popup( {
//        chooseFiles: true,
//        width: 900,
//        height: 600,
//        onInit: function( finder ) {
//            finder.on( 'files:choose', function( evt ) {
//                var file = evt.data.files.first();
//                var output = document.getElementById( elementId );
//                output.value = file.getUrl().replace(site_folder + "/upload/images/", '');
//            } );
//
//            finder.on( 'file:choose:resizedImage', function( evt ) {
//                var output = document.getElementById( elementId );
//                output.value = evt.data.resizedUrl.replace(site_folder + "/upload/images/", '');
//            } );
//        }
//    } );
//};
function browse_file(targetElement){
	var browse = window.open("?q=browse_files&targetElement="+targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	browse.document.close();
}
function browse_object(targetElement, object){
	if (object == "poller") {
		var browse = window.open("?q=browse_object&object=poller&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	} else if (object == "banner_categories") {
		var browse = window.open("?q=browse_object&object=banner_categories&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	} else if (object == "news_categories") {
		var browse = window.open("?q=browse_object&object=news_categories&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	} else if (object == "santhanhly") {
		var browse = window.open("?q=browse_object&object=santhanhly&fields=id,title&where=santhanhly&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	}else if (object == "shop_category") {
		var browse = window.open("?q=browse_object&object=shop_category&fields=category_id,category_name&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
	}
	browse.document.close();
}
function browse_data(targetElement, data){
        var browse = window.open("?q=browse_object&r=data&data=" + data + "&targetElement=" + targetElement, "Browse_files", "height=400, width=500, menubar=0, status=0, toolbar=0; addressbar=0");
        browse.document.close();
}
</script>


<div class="container">
    <!-- START BLOCK : messages -->
    <div id="message" class="updated">
        <p>
            <strong>{message}</strong>
        </p>
    </div>
    <!-- END BLOCK : messages -->
    <!-- START BLOCK : module_description -->
    <div id="description" class="updated2">
        <strong>{MODULE_DESCRIPTION}</strong>
    </div>
    <!-- END BLOCK : module_description -->
    <div id="innercontent">
        <form name="myForm" class="form-inline" action="{action}" method="post" id="myForm">
            <input type="hidden" id="layout_id" name="layout_id" value="{LAYOUT_ID}"/>
            <div style="{STATIC_STATUS}">
                <table width="100%" cellspacing="0" border="0" id="tbstatic">
                    <input type="hidden" id="id" name="id" value="{ID}"/>
					<tr class="alternate">
                        <td>
                            <!-- START BLOCK : static_content_title -->
                            <div style="vertical-align:middle; padding:10">
                                <img src="{language_icon_url}"/>
                            </div>
                            <div>
                            	<input class="form-control" type="text" style="width:600px" name="static_content_title_{language_code_sufix}" value="{static_content_title}" />
                            </div>
                            <!-- END BLOCK : static_content_title -->
                        </td>
                    </tr>
                    <tr class="alternate">
                        <td>
                            <!-- START BLOCK : static_content_image -->
                            <div style="vertical-align:middle; padding:10">
                                <img src="{language_icon_url}"/>
                            </div>
                            <div>
                                <div class="form-group">
                                    <label for="image"> Hình nền: </label>
                                    <div class="input-group">
                                        <input class="form-control" type="text" placeholder="Click browse to choose image path"
                                               name="static_content_image_{language_code_sufix}" value="{static_content_image}" id="static_content_image_{language_code_sufix}" size="46"/>
                                        <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','static_content_image_{language_code_sufix}');"
                                class="btn btn-default">
                            Duyệt thư mục
                        </button> </span>
                                    </div>
                            <!-- END BLOCK : static_content_image -->
                        </td>
                    </tr>
                    <tr class="alternate">
                        <td>
                            <!-- START BLOCK : agent -->
                            <div style="vertical-align:middle; padding:10">
                                <img src="{language_icon_url}"/>
                            </div>
                            <div>
                                {CK_STATIC_VALUE}
                            </div>
                            <!-- END BLOCK : agent -->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" class="btn btn-primary button" value="{UPDATE}" id="btSave" onclick="updateStaticModule();">
                        </td>
                    </tr>
                </table>
            </div>

        <div style="{STATUS}">
            <p>
				<input type="button" class="btn btn-primary button" onclick="submitRows('tblInsertRowPHP');" value="{UPDATE}"/>
            </p>

            <div class="main_setting">

                            {CONFIG_PARA}


                    <!-- START BLOCK : modules_item -->
                    <div class="row sett">
                        <div class="col-md-4">
                            <input type="hidden" id="txtid{INDEX}" value="{ID}" />
                            <div class="form-group">
                                <label for="name_en">Key {INDEX}:</label>
                                <input readonly class="form-control" type="text" value="{KEY_VALUE}" id="txtRow{INDEX}"/>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <input type="hidden" id="txtType{INDEX}" value="{TYPE}" />
                            <input type="hidden" id="txtData{INDEX}" value="{DATA}" />
                            <div class="form-group">
                                <label for="image"> Value {INDEX}:</label>
                                <input class="form-control" type="text" value="{VALUE_VALUE}" id="txtValue{INDEX}" />

                            </div>
                            <!-- START BLOCK : type_browser_file -->
                            <input type="button" class="btn btn-primary button" onclick="{FUNCTION}" value="Browse"/>
                            <!-- END BLOCK : type_browser_file -->
                        </div>

                    </div>

					<!-- END BLOCK : modules_item -->
					<!-- START BLOCK : modules_xml_item -->
                    <div class="row sett">
                        <div class="col-md-4">
                        <input type="hidden" id="txtid{INDEX}" value="{ID}" />
                        <div class="form-group">
                        <label for="txtRow{INDEX}"> Key {INDEX}:</label>
                        <input class="form-control" type="text" value="{KEY_VALUE}" id="txtRow{INDEX}"/>
                            </div>
                    </div>
                        <div class="col-md-8">
                        <input type="hidden" id="txtType{INDEX}" value="{TYPE}" />
                        <input type="hidden" id="txtData{INDEX}" value="{DATA}" />
                        <div class="form-group">
                            <label for="txtValue{INDEX}"> Value {INDEX}:</label>
                            <input class="form-control" type="text" value="{VALUE_VALUE}" id="txtValue{INDEX}" />
                        </div>
                            <!-- START BLOCK : type_xml_browser_file -->
                                <input type="button" class="btn btn-primary button" onclick="{FUNCTION}" value="Browse"/>
                            <!-- END BLOCK : type_xml_browser_file -->
                    </div>

                    </div>
					<!-- END BLOCK : modules_xml_item -->
                    <!-- START BLOCK : no_modules_item -->
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input class="form-control" type="hidden" id="txtid0" />
                        </td>
                        <td>
                            Key 0: 
                        </td>
                        <td>
                            <input type="text" id="txtRow0" size="20"/>
                        </td>
                        <td>
                            Value 0: 
                        </td>
                        <td>
                            <input class="form-control" type="text" id="txtValue0" size="20"/>
							<input type="hidden" id="txtType0" value="TEXT" />
                        </td>
                    </tr><!-- END BLOCK : no_modules_item -->
                </tbody>
            </div>
        </div>
        </form>
        <script>
            function insertRowPHP(){
                var tbl = document.getElementById('tblInsertRowPHP');
                var iteration = tbl.tBodies[0].rows.length;

                newRow = tbl.tBodies[0].insertRow(-1);
                
                var newCell = newRow.insertCell(0);
                var newCell = newRow.insertCell(1);
                var el = document.createElement('input');
                el.type = 'hidden';
                el.id = 'txtid' + iteration;
                newCell.appendChild(el);
                
                var newCell = newRow.insertCell(2);
                newCell.innerHTML = 'Key ' + iteration + ':';
                
                var newCell1 = newRow.insertCell(3);
                var el = document.createElement('input');
                el.type = 'text';
                el.id = 'txtRow' + iteration;
                el.size = 20;
				newCell1.appendChild(el);
                
                var newCell = newRow.insertCell(4);
                newCell.innerHTML = 'Value ' + iteration + ':';
                
                var newCell2 = newRow.insertCell(5);
                var e2 = document.createElement('input');
                e2.type = 'text';
                e2.id = 'txtValue' + iteration;
                e2.size = 20;
                newCell2.appendChild(e2);
                
               // var newCell = newRow.insertCell(6);
               // newCell.innerHTML = 'Default ' + iteration + ':';
              //  var newCell3 = newRow.insertCell(7);
                var e3 = document.createElement('input');
                e3.type = 'hidden';
                e3.id = 'txtType' + iteration;
				e3.value = 'TEXT';
                e3.size = 20;
                newCell2.appendChild(e3);
            }
            
            function deleteAllRows(tblId){
                for (var i = $(".sett").length - 1; i >= 0; i--) {
                    tbl.tBodies[0].deleteRow(i);
                }
            }
            
            function validationData(tblId){
                var strToken = "";
                var tbl = document.getElementById(tblId);
                for (var i = $(".sett").length - 1; i >= 0; i--) {
                    var key = document.getElementById("txtRow" + i);
                    if (key.value == "") {
                        alert("PLease input data for Key " + i);
                        key.focus();
                        return false;
                    }
					//Can input null value
//                    var value = document.getElementById("txtValue" + i);
//                    if (value.value == "") {
//                        alert("PLease input data for Value " + i);
//                        value.focus();
//                        return false;
//                    }
                }
                return true;
            }
            
            function submitRows(tblId){
                if (validationData(tblId)) {
                    var strToken = "";
                    var saveString = '{ "items":[';
                    var tbl = document.getElementById(tblId);
                    for (var i = $(".sett").length - 1; i >= 0; i--) {
                        var id = document.getElementById("txtid" + i);
                        var key = document.getElementById("txtRow" + i);
                        var value = document.getElementById("txtValue" + i);
                        var type = document.getElementById("txtType" + i);
                        var data = document.getElementById("txtData" + i);
                        saveString = saveString +
                        '{ "id":"' +
                        id.value +
                        '","key":"' +
                        key.value +
                        '","value":"' +
                        value.value +
						'","type":"' +
                        type.value +
                        '","data":"' +
                        data.value +
                        '"},';
                    }
                    saveString = saveString.substr(0, (saveString.length - 1)) + ']}'
                    strToken = saveString;
					//alert(strToken);
                    saveString = "";
                    var layout_id = document.getElementById('layout_id').value;
                    updateConfigModule(strToken, layout_id);
                    return true;
                }
                return false;
            }
			function updateConfigModule(data, layout_id){
               $.post("index_ajax.php?q=page_setting&r=updateConfigModule", { data: data, layout_id: layout_id },
						function(data){
    						alert(data);
							//self.parent.tb_remove();
  				});
			}
			function updateStaticModule(){
	      		$('textarea').each(function(){
					$(this).val(CKEDITOR.instances[this.id].getData());
				});
				var url = $('#myForm').attr('action');
				var data = $('#myForm').serialize();
				 $.post(url, data,
						function(result){
    						alert(result);
							//self.parent.tb_remove();
  				});
			}
        </script>
    </div>
</div>
</body>
</html>