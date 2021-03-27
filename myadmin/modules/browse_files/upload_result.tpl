<script language="javascript">
function redirect(url){
window.location=url;
}

</script>

<h2>Upload result...</h2>
<p>Trang này hiển thị kết quả upload file lên server...</p>

<div>
	
<table class="widefat" border="0">
    <tbody id="the-list">
		
		<tr class="alternate">
			<td><b>Trạng thái của các file bạn đã upload...<b></td>
		</tr>
		<tr class="alternate">
			<td colspan="2" id="container">
			
				<table class="widefat" bgcolor="#ffffff">
				<thead>
					<th>STT</th>
					<th>Tên file</th>
					<th>Thư mục</th>
					<th>Trạng thái</th>
					<th>Thông tin mô tả trạng thái</th>
				</thead>
				<tbody>
				<!-- START BLOCK : file -->
				<tr class="{row_odd}">
					<td>{stt}</td>
					<td width="200px">{file_name}</td>
					<td width="200px">{folder}</td>
					<td width="100px"><font color="{status_color}">{status}</font></td>
					<td>{message}</td>
				</tr>
				<!-- END BLOCK : file -->
				</tbody>
				</table>
			
			</td>
		</tr>
		<tr class="alternate">
			<td align="center">
				
				<input class="button" type="button" value="Upload file mới" onclick="redirect('{upload_new_url}')"/>
			</td>
		</tr>
    </tbody>
</table>