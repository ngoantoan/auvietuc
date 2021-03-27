<script language="javascript">
function get_view_file(folder, perpage, pagenumber){
c.view_file(folder, perpage, pagenumber,  {target: 'page_content', preloader: 'preload', preloader_style: 'display'});
}

function delete_file(file_name, folder, view_folder){
c.delete_file(file_name, folder, view_folder,  {target: 'page_content', preloader: 'preload', preloader_style: 'display'});
}
function getFile(file){
document.getElementById('file_selected').value=file;
}
function setTarget(targetId){
opener.document.getElementById(targetId).value = document.getElementById('file_selected').value;
window.close();
}
</script>
<form>
<table class="widefat" border="0">
    <tbody id="the-list">
		<tr class="alternate">
			<td>Hãy chọn thư mục</td>
			<td>
				<select id="folder" name="folder" onchange="get_view_file(this.value, '', '')">
					<option value="all" selected>all</option>
					<option value="images" {selected_attribute_images}>images</option>
					<option value="video" {selected_attribute_video}>video</option>
					<option value="document" {selected_attribute_document}>document</option>
				</select>
			</td>
		</tr>
		
		<tr class="alternate">
			<td colspan="2" id="container">
			<div style="width:400px; height:250px; overflow:auto">
				<table class="widefat" bgcolor="#ffffff" width="100%">
				<thead>
					<tr>
					
					<td><b>Tên file</b></td>
					<td align="center"><b>Chọn</b></td>
					</tr>
				</thead>
				<tbody>
				<!-- START BLOCK : file -->
				<tr class="{row_odd}">
					
					<td width="200">{file_name}</td>
					<td width="30" align="center"><input type="radio" name="select" onclick="getFile('{file_name_and_folder}')"/></td>
					
				</tr>
				<!-- END BLOCK : file -->
				</tbody>
				</table>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right" valign="middle">
			<input type="hidden" name="targetElement" id="targetElement" value="{targetElement}"/>
			File: <input type="text" name="file_selected" id="file_selected" size="25"/> 
			<input type="button" value="OK" class="btn-green radius" onclick="setTarget(document.getElementById('targetElement').value)"/>
			<input type="button" value="CANCEL" class="btn-green radius" onclick="window.close()"/></td>
		</tr>
    </tbody>
</table>
</form>