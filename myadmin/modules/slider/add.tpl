<div id="long" style="">
    <div class="pad-lr">
        <form name="news_item" id="news_item" method="post" action="{action}">
            <div>
                <h3>Danh mục</h3>
                <section>
                    <div class="col-sm-3">
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label for="title">Tiêu đề:</label>
                        <input type="text" required class="form-control" name="title" id="title" value="{title}"
                               placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label for="link">Link:</label>
                        <input type="text" class="form-control" name="link" id="link" value="{link}"
                               placeholder="Enter link">
                    </div>
                </section>
                <h3>Hình ảnh / link video</h3>
                <section>
                    <div class="form-group">
                        <label for="image"> Hình ảnh: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" required placeholder="Click browse to choose image path"
                                   name="image" value="{image_path}" id="image" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image');"
                                class="btn btn-default">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                </section>
                <h3>Mô tả</h3>
                <section>
                     <div class="form-group">
                        <label for="description">Mô tả *: </label>
                        <br/>
                        <textarea class="form-control" required id="description" rows="5"
                                  name="description">{description}</textarea>
                    </div>
                </section>

                <h3>Trạng thái</h3>
                <section>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="sort">Sắp xếp:</label>
                                <input type="text" style="width: 200px;" class="form-control" name="sort" id="sort"
                                        value="{sort}"
                                        placeholder="Nhập số">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="status">Xác nhận:</label>
                                <label class="checkbox-inline">
                                    <input type="radio" id="status" name="status" value="1" {sactive}> Hiển thị
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" id="status" name="status" value="0" {sunactive}> Không
                                </label>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <input type="hidden" name="oper" value="{oper}"/>
            <input type="hidden" name="id" value="{id}"/>
            <span style="color: red;border:none;" id="message">{msg}</span>
        </form>
        <div class="action-close">
            <button type="button" class="btn btn-default btn-action" data-dismiss="modal" >Đóng</button>
            <span  class="note-required">(*) Bắt buộc</span>
        </div>
    </div>
</div>
<script>

    $(function () {
        var form = $("#news_item");
        form.validate({
            errorPlacement: function errorPlacement(error, element) {
                element.before(error);
            },
            rules: {
                confirm: {
                    equalTo: "#password"
                }
            }
        });

        form.children("div").steps({
            headerTag: "h3",
            bodyTag: "section",
            labels: {
                cancel: "Đóng",
                current: "Bước hiện tại:",
                pagination: "Phân trang",
                finish: "Hoàn thành",
                next: "Tiếp theo",
                previous: "Quay lại",
                loading: "Đang tải ..."
            },
            transitionEffect: "slideLeft",
            onStepChanging: function (event, currentIndex, newIndex) {
                form.validate().settings.ignore = ":disabled,:hidden";
                return form.valid();
            },
            onFinishing: function (event, currentIndex) {

                form.validate().settings.ignore = ":disabled";
                return form.valid();
            },
            onFinished: function (event, currentIndex) {
                CKupdate();
                var postData = $("#news_item").serialize();
                var formURL = $("#news_item").attr("action");
                $.ajax({
                    url: formURL,
                    type: "POST",
                    data: postData,
                    success: function (data) {
                        data = data.replace(/(\r\n|\n|\r)/gm, "");
                        if (data == "0") {
                            $('#message').html("Update news fail.");
                        } else {
                            swal({
                                title: 'Thành công!',
                                text: 'Bạn đã cập nhật bài viết thành công !',
                                type: 'success',
                                timer: 1500

                            }).then(function () {
                                    $('#myModal').modal('hide');
                                    self.parent.jQuery("#list").trigger("reloadGrid");
                                },
                                function (dismiss) {
                                    if (dismiss === 'timer') {
                                        $('#myModal').modal('hide');
                                        self.parent.jQuery("#list").trigger("reloadGrid");
                                    }
                                }
                            )

                        }
                        return;
                    }
                });
                return false;
            }
        });
    });

</script>

