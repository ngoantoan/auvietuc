<div class="container">
    <div class="col-sm-6 col-sm-offset-3">
        <h2>ĐỔI MẬT KHẨU</h2>
        <div>
            <form name="pages_action" id="pages_action" method="post" action="{action}">
                <div class="form-group">
                    <label for="password">Mật khẩu cũ</label>
                    <input class="form-control" type="password" name="password" value=""
                           id="password" required/>
                </div>
                <div class="form-group">
                    <label for="newpassword">Mật khẩu mới</label>
                    <input class="form-control" type="password" name="newpassword" value=""
                           id="newpassword" required/>
                </div>
                <div class="form-group">
                    <label for="renewpassword">Nhập lại mật khẩu</label>
                    <input class="form-control" type="password" name="renewpassword" value=""
                           id="renewpassword" required/>
                </div>
                <div id="button" align="center">
                    {msg}
                    <input class="btn btn-primary" type="submit" value="Lưu"/>
                </div>
                <input type="hidden" name="oper" value="{oper}"/>
                <input type="hidden" name="id" value="{id}"/>
            </form>
        </div>
    </div>
</div>