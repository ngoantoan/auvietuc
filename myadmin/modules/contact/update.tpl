<h2 class="ic-tagblue"> Contact</h2>
<span style="color: red;">{msg}</span>
<div class="pad-lr">
    <form id="news_item" method="post" action="{action}">
        <input type="hidden" name="oper" value="{oper}" />
        <input type="hidden" name="id" value="{id}" />
        <div class="row">
            <div class="col-sm-4">
                <label for="username">Name:</label>
                <input type="text" required class="form-control" name="username" value="{username}" id="username" placeholder="">
            </div>
            <div class="col-sm-4">
                <label for="company">Company:</label>
                <input type="text" required class="form-control" name="company" value="{company}" id="rate" placeholder="">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <label for="email">Email: </label>
                <input type="email" required class="form-control" name="email" value="{email}" id="email" placeholder="">
            </div>
            <div class="col-sm-4">
                <label for="phone">Phone:</label>
                <input type="text" required class="form-control" name="phone" value="{phone}" id="phone" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label for="description">Content:</label>
            {ck_contents}
        </div>
            <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
        </div>
    </form>
</div>

