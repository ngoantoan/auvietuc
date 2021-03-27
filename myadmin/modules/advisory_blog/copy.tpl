<div id="long" style="">
    <div class="pad-lr">
        <form name="news_item" id="news_item" method="post" action="{action}">

            <div>
                <h3>Danh mục</h3>
                <section>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="language">Danh mục: </label>
                                <select class="form-control" id="category_step1_modal" name="category_step1_modal">
                                    <option value="">--Chọn--</option>
                                    {category_step1}
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4" id="div_category_2_modal" {css_display}>
                            <div class="form-group">
                                <label for="language">&nbsp; </label>
                                <select class="form-control" id="category_step2_modal" name="category_step2_modal">
                                    <option value="">--Chọn--</option>
                                    {category_step2}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label for="title">Tiêu đề <i class="text_red"> *</i>:</label>
                        <input type="text" required class="form-control" name="title" id="title" value="{title}"
                               placeholder="Enter title">
                    </div>
                    <div class="col-sm-3">
                        <div class="row">
                            <div class="form-group">
                                <label for="price">Giá <i class="text_red"> *</i>:</label>
                                <input type="number" required class="form-control" name="price" id="price" value="{price}"
                                       placeholder="Ví dụ: 100000">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                </section>
                <h3>Hình ảnh / link video</h3>
                <section>
                    <div class="form-group">
                        <h2><strong>Hình ảnh đại diện</strong></h2>
                    </div>
                    <div class="form-group">
                        <label for="image"> Hình ảnh: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Click browse to choose image path"
                                   name="image" value="{image_path}" id="image" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <h2><strong>Hình ảnh slider</strong></h2>
                    </div>

                    {update_image}
                    <!-- START BLOCK :  IMAGE-LIST -->
                    <div class="form-group">
                        <label for="image"> Hình ảnh {index}: </label>
                        <div class="input-group">
                            <input class="form-control" type="text"
                                   placeholder="Click browse to choose image {index} path"
                                   name="image_{index}" value="{image_path}" id="image_{index}" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image_{index}');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                    <!-- END BLOCK :  IMAGE-LIST -->
                    <!-- START BLOCK :  IMAGE-DEFAULT -->
                    <div class="form-group">
                        <label for="image"> Hình ảnh 1: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Click Duyệt thư mục để chọn hình ảnh"
                                   name="image_1" value="{image_path_1}" id="image_1" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image_1');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image"> Hình ảnh 2: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Click Duyệt thư mục để chọn hình ảnh"
                                   name="image_2" value="{image_path_2}" id="image_2" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image_2');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image"> Hình ảnh 3: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Click Duyệt thư mục để chọn hình ảnh"
                                   name="image_3" value="{image_path_3}" id="image_3" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image_3');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image"> Hình ảnh 4: </label>
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Click Duyệt thư mục để chọn hình ảnh"
                                   name="image_4" value="{image_path_4}" id="image_4" size="46"/>
                            <span class="input-group-btn">
                        <button type="button" onclick="BrowseImageFromServer('images:/','image_4');"
                                class="btn btn-primary">
                            Duyệt thư mục
                        </button> </span>
                        </div>
                    </div>
                    <!-- END BLOCK :  IMAGE-DEFAULT -->
                    <input type="hidden" value="{current_index}" id="current_index" name="current_index">
                    <div class="form-group">
                        <a href="#" id="add_more" class="btn btn-primary btn-lg"> <i
                                    class="glyphicon glyphicon-plus"></i> Thêm 1 hình mới</a>
                    </div>
                </section>
                <h3>Mô tả chi tiết</h3>
                <section>
                    <div class="form-group">
                        <label for="description">Mô tả *: </label>
                        <br/>
                        <textarea class="form-control" required id="description"
                                  name="description">{description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="detail">Chi tiết: </label>
                        <br/>
                        {ck_content}
                    </div>
                </section>

                <h3>Trạng thái / sắp xếp</h3>
                <section>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label for="status">Xác nhận:</label>
                        <label class="checkbox-inline">
                            <input type="radio" id="status" name="status" value="1" {sactive}> Hiển thị
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" id="status" name="status" value="0" {sunactive}> Không
                        </label>
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

                                    //location.reload();
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
        $('#category_step1_modal').change(function () {
            var value = this.value;
            $('#category_step2_modal').empty();
            $.ajax({
                url: "index_ajax.php?q=product&r=get_category_step2&category_id=" + value + "&lang=" + $("#lang").val(),
                success: function (res) {
                    if (res !== "") {
                        $("#div_category_2_modal").css("display", "block");
                        $('#category_step2_modal').append(res);
                    } else {
                        $("#div_category_2_modal").css("display", "none");
                    }
                }
            });
        });
    });
</script>


<script>
    $(document).ready(function () {
        // load category after change langue
        $("#Sellang").change(function () {
            var c = $(this).val();
//            $('#category_step2').empty();
            $.post("index_ajax.php?q=service_resort&r=getCategoryWithLang&lang=" + c, "", function (res) {
                $("#selCate").html(res);
            });
        });
//        $("#selCate").change(function () {
//            var c = $(this).val();
//            $('#category_step2').empty();
//            $.post("index_ajax.php?q=service_resort&r=get_category_step2&category=" + c, "", function (res) {
//                $("#category_step2").html(res);
//            });
//        });
        // upload nhieu hinh anh
        $('#add_more').click(function () {
            var nid = $("#current_index").val();
            nid = parseInt(nid) + 1;
            console.log(nid);
            $("#current_index").attr("value", nid);
            $(this).before($("<div/>", {id: 'filediv'}).fadeIn('slow').append(
                $(
                    " <div class=\"form-group\">\n" +
                    "                        <label for=\"image\"> Hình ảnh " + nid + ": </label>\n" +
                    "                        <div class=\"input-group\">\n" +
                    "                            <input class=\"form-control\" type=\"text\" placeholder=\"Click Duyệt thư mục để chọn hình ảnh\"\n" +
                    "                                   name=\"image_" + nid + "\" value='' id='image_" + nid + "' size=\"46\" required/>\n" +
                    "                            <span class=\"input-group-btn\">\n" +
                    "                        <button type=\"button\" onclick=\"BrowseImageFromServer('images:/','image_" + nid + "');\"\n" +
                    "                                class=\"btn btn-primary\">\n" +
                    "                            Duyệt thư mục\n" +
                    "                        </button> </span>\n" +
                    "                        </div>\n" +
                    "                    </div>" +
                    "")
            ));
        });
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

                                //location.reload();
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
        });
    }
</script>