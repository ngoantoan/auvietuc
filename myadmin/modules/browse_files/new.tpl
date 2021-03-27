<script language="javascript">
function getUpload(no){
var table = "<table class='widefat' bgcolor='#ffffff'>"
for(i=1; i<=no; i++){
table += "<tbody>";
if(i%2 == 0){
table += "<tr class='alternate'>";
}else{
table += "<tr>";
}
table += "<td> File " +i;
table += "</td>";
table += "<td>"+"<input type='file' name='file"+i+"' id='file"+i+"' size='50' class='required' onkeyup='disableType(this)' onkeydown='disableType(this)'/>"+"</td>";

table += "</tr>";
table += "</tbody>";

}
table+= "</table>";
document.getElementById('container').innerHTML="";
document.getElementById('container').innerHTML=table;
//document.write(table);
}

function disableType(object){
		object.value='';
		}
</script>


<h2>Upload file</h2>
<p>Trang này cho phép người dùng upload file lên server...</p>

<div>
	<form name="upload_form" id="upload_form" method="post" action="{action}" enctype="multipart/form-data">
<table class="widefat" border="0">
    <tbody id="the-list">
		<tr class="alternate">
			<td>Hãy chọn số file Upload</td>
			<td>
			 <input type="radio" value="1" name="file_number" onclick="getUpload(this.value)" checked="checked" />Một
			 <input type="radio" value="2" name="file_number" onclick="getUpload(this.value)"/>Hai
			 <input type="radio" value="3" name="file_number" onclick="getUpload(this.value)"/>Ba
			 <input type="radio" value="4" name="file_number" onclick="getUpload(this.value)"/>Bốn
			<input type="radio" value="5" name="file_number" onclick="getUpload(this.value)"/>Năm 
			</td>
		</tr>
		<tr class="alternate">
			<td>Hãy chọn loại file Upload</td>
			<td>
				<select name="file_type">
					<option value="Images" selected>Hình ảnh</option>
					<option value="Video">Video</option>
					<option value="Document">Tài liệu</option>
				</select>
			</td>
		</tr>
		<tr class="alternate">
			<td colspan="2" id="container">
			
				<table class="widefat" bgcolor="#ffffff">
				<tr class="alternate">
					<td width="150">File 1</td>
				<td>
					<input type="file" name="file1" size="50" id="file1" value="ddddddd" class="required" onkeyup="alert('You can not type here'); this.value=''" onkeydown="alert('You can not type here'); this.value=''"/> 
				</td>
				</tr>
				</table>
			
			</td>
		</tr>
    </tbody>
</table>
<div id="button" align="right">
  <a name="page_action"></a><input class="button" type="submit" value="Upload" />
</div>
<input type="hidden" name="action" value="upload_new_file" />
</form>
<script language="javascript">
 function formCallback(result, form) {
if (form.id == 'upload_form' && result == true) {
//form.submit();
}
}
var valid = new Validation('upload_form', {immediate : true, onFormValidate : formCallback});
</script>
</div>