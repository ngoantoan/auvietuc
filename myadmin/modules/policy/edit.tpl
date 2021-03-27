<h2 class="ic-tagblue">POLICY</h2>
<span style="color: red;">{msg}</span>
<div class="pad-lr">
    <form id="news_item" method="post" action="{action}">
        <input type="hidden" name="oper" value="{oper}" />
        <input type="hidden" name="id" value="{id}" />
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" required class="form-control" name="code" value="{code}" id="code" placeholder="">
        </div>

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" required class="form-control" name="title" value="{title}" id="title" placeholder="">
        </div>
        <div class="form-group">
            <label for="detail">Detail</label>
            {ck_detail}
        </div>
        <div class="form-group">
            <label for="status">Active:</label>
            <label class="checkbox-inline">
                <input type="radio" id="status" name="status" value="1" {sactive}> Active
            </label>
            <label class="checkbox-inline">
                <input type="radio" id="status" name="status" value="0" {sunactive}> Deactive
            </label>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
            <button class="btn btn-danger" id="btnSubmit" type="submit">Submit</button>
        </div>
    </form>
</div>

