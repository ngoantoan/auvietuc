<script>
	function get_view_file(folder, perpage, pagenumber) {
		c.view_object(folder, perpage, pagenumber, {
			target : 'page_content',
			preloader : 'preload',
			preloader_style : 'display'
		});
	}

	function getFile(file) {
		document.getElementById('file_selected').value = file;
	}

	function setTarget(targetId) {
		opener.document.getElementById(targetId).value = document.getElementById('file_selected').value;
		window.close();
	}
</script>
<style>
	.alternate{
	    background: #ccc;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<form>
    <table class="widefat" border="0">
        <tbody id="the-list">
            <tr class="alternate">
                <td>Select Object</td>
            </tr>

            <tr class="alternate">
                <td id="container">
                <div style="width:400px; height:250px; overflow:auto">
                    <table class="widefat" style="background-color:#ffffff" width="100%">
                        <thead>
                            <tr>
                                <td><b>Name</b></td>
                                <td align="center"><b>Select</b></td>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- START BLOCK : no_items -->
                            <tr class="{row_odd}">
                                <td colspan="2">{NO_ITEM}</td>
                            </tr>
                            <!-- END BLOCK : no_items -->
                            <!-- START BLOCK : items -->
                            <tr class="{row_odd}">

                                <td width="200">{OBJECT_NAME}</td>
                                <td width="30" align="center">
                                <input type="radio" border="0px" name="select" onclick="getFile('{OBJECT_ID}')"/>
                                </td>

                            </tr>
                            <!-- START BLOCK : items2 -->
                            <tr class="{row_odd}">

                                <td width="200">{OBJECT_NAME2}</td>
                                <td width="30" align="center">
                                <input type="radio" border="0px" name="select" onclick="getFile('{OBJECT_ID2}')"/>
                                </td>

                            </tr>
                            <!-- START BLOCK : items3 -->
                            <tr class="{row_odd}">

                                <td width="200">{OBJECT_NAME3}</td>
                                <td width="30" align="center">
                                <input type="radio" border="0px" name="select" onclick="getFile('{OBJECT_ID3}')"/>
                                </td>

                            </tr>
                            <!-- END BLOCK : items3 -->
                            <!-- END BLOCK : items2 -->
                            <!-- END BLOCK : items -->

                        </tbody>
                    </table>
                </div></td>
            </tr>
            <tr>
                <td colspan="2" align="right" valign="middle">
                <input type="hidden" name="targetElement" id="targetElement" value="{targetElement}"/>
                Selected Item:
                <input type="text" name="file_selected" id="file_selected" size="15"/>
                <input type="button" value="OK" class="btn-green radius" onclick="setTarget(document.getElementById('targetElement').value)"/>
                <input type="button" value="CANCEL" class="btn-green radius" onclick="window.close()"/>
                </td>
            </tr>
        </tbody>
    </table>
</form>