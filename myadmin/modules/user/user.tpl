<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<h3>QUẢN LÝ TÀI KHOẢN</h3>
		<span style="color: red;">{msg}</span>
		<form name="pages_action" id="pages_action" method="post" action="{action}" >
			<div class="from-group">
				<label for="username">Tài khoản:</label>
				<input type="text" required class="form-control" name="username" value="{login_name}" id="username" placeholder="">
			</div>

			<div class="form-group">
				<label for="password">Mật khẩu</label>
				<input class="form-control" type="password" name="password" value="{user_password_value}" id="password" />
						
			</div>
			
				<div class="form-group">
					<label for="user_email">Email:</label>
					<input type="email" class="form-control" name="email" value="{email}" id="email" />
			</div>
				<div class="form-group">
					<label for="fullname">Tên thật:</label>
					<input type="fullname" class="form-control" name="fullname" value="{fullname}" id="fullname" />
				</div>
				<div class="form-group">
					<label for="phone">Số điện thoại:</label>
					<input type="phone" class="form-control" name="phone" value="{phone}" id="phone" />
				</div>

			<div class="form-group">
				<label for="is_active">Trạng thái</label>
				<label><input type="checkbox" id="is_active" name="is_active" {sactive}/> Active</label>
			</div>
			<!--div class="form-group">
				<label for="is_active">Quyền: </label>
				<select class="form-control"  id="role" name="role[]" multiple="multiple">
					{roles}
				</select>
			</div-->

			<div id="button" align="right">
				<span id="message" style="color: red;">{msg}</span></br></br>
				<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
				<input class="btn btn-primary" type="submit" value="SUBMIT"/>
			</div>
			<input type="hidden" name="oper" value="{oper}" />
			<input type="hidden" name="id" value="{id}" />
		</form>

		<script language="javascript">

			$(document).ready(function() {
				$('#role').multiselect();
				$('#role').multiselect('select', [{roles_selected}]);
			});

			//function closemodal() {
			//	self.parent.tb_remove();
			//	self.parent.jQuery("#list").trigger("reloadGrid");
			//};
			//callback handler for form submit
			//	$("#pages_action").submit(function(e)
			//	{
			//		var postData = $(this).serializeArray();
			//		var formURL = $(this).attr("action");
			//		$.ajax(
			//		{
			//			url : formURL,
			//			type: "POST",
			//			data : postData,
			//			success:function(data, textStatus, jqXHR)
			//			{
			//				data = data.replace(/^\s+|\s+$/g,"");
			//				if(data == "1") {
			//					$('#message').html("Update user successfully.");
			//				} else {
			//					$('#message').html("Update user fail.");
			//				}
			//				return;
			//			}
			//		});
			//		e.preventDefault(); //STOP default action
			//		return false;
			//	});
		</script>
	</div>
</div>