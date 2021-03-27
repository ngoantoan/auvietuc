<h2 class="ic-tagblue">COMMENTS</h2>
<span style="color: red;">{msg}</span>
<div class="pad-lr">
    <form id="news_item" method="post" action="{action}">
        <input type="hidden" name="oper" value="{oper}" />
        <input type="hidden" name="id" value="{id}" />
        <div class="form-group">
            <label for="fullname">Fullname</label>
            <input type="text" required class="form-control" name="fullname" value="{fullname}" id="fullname" placeholder="">
        </div>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" required class="form-control" name="title" value="{title}" id="title" placeholder="">
        </div>
        <div class="form-group">
            <label for="contents">Contents :</label>
            <textarea name="contents" id="contents" class="form-control" cols="60" rows="5">{contents}</textarea>
        </div>
        <div class="form-group">
            <label for="rate">Rate:</label>
                <input type="text" class="form-control" id="rate" name="rate" value="{rate}">
        </div>
        <div class="form-group">
            <label for="created_date">Created date:</label>
            <input value="{created_date}" type="date" class="form-control" id="created_date" name="created_date" >
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
            <button class="btn btn-danger" id="btnSubmit" type="submit">Submit</button>
        </div>
    </form>
</div>


