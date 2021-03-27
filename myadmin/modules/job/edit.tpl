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

                </section>
                <h3>Chi tiết</h3>
                <section>
                    <div class="form-group">
                        <label for="detail">Chi tiết: </label>
                        <br/>
                        {ck_content}
                    </div>
                </section>
            </div>
            <input type="hidden" name="oper" value="{oper}"/>
            <input type="hidden" name="id" value="{id}"/>
            <span style="color: red;border:none;" id="message">{msg}</span>
        </form>
        <div class="action-close">
            <button type="button" class="btn btn-default btn-action" data-dismiss="modal">Đóng</button>
            <button type="button" class="btn btn-primary btn-action btn-action-save">Lưu & đóng </button>
            <span class="note-required">(*) Bắt buộc</span>
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
        getCK_source("detail");
    });
    $(document).ready(function () {
        save_();
    });
    function save_(){
        $(".btn-action-save").on("click", function () {
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
        });
    }
</script>

