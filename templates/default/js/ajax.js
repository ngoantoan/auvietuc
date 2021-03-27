// đăng ký tư vấn
function ajaxRegisterContact() {
    var name = $("#name").val();
    var birthday = $("#birthday").val();
    var email = $("#email").val();
    var address = $("#address").val();
    var phone = $("#phone").val();
    var education_program = $('#education_program').find(":selected").text();
    var body = $("#body").val();
    if (name !== "" && phone !== "") {
        var url = site_folder + '/index_ajax.php?module_name=form_register&action=ajaxRegisterContact';
        $.get(url, { name: name, birthday: birthday, email: email, address: address, phone: phone, education_program: education_program, body: body }, function(data) {
            if (data == 1) {
                Swal.fire("Đăng ký thành công!", "", "success").
                then((result) => {
                    location.reload();
                });
                $("#name").val('');
                $("#birthday").val('');
                $("#email").val('');
                $("#address").val('');
                $("#phone").val('');
                $("#education_program").val('');
                $("#body").val('');
            } else if (data == 2) {
                Swal.fire("Bạn đã đăng ký nội dung  này trước đó", "", "error");
            } else {
                Swal.fire("Đăng ký thất bại", "", "error");
            }
        });
    } else {
        Swal.fire("Xin vui lòng nhập đầy đủ thông tin!");
    }
}

// form footer
function ajaxRegisterContactFooter() {
    var name = $("#name_footer").val();
    var birthday = $("#birthday_footer").val();
    var email = $("#email_footer").val();
    var address = $("#address_footer").val();
    var phone = $("#phone_footer").val();
    var education_program = $('#education_program_footer').find(":selected").text();
    var body = $("#body_footer").val();
    if (name !== "" && phone !== "") {
        var url = site_folder + '/index_ajax.php?module_name=form_register&action=ajaxRegisterContact';
        $.get(url, { name: name, birthday: birthday, email: email, address: address, phone: phone, education_program: education_program, body: body }, function(data) {
            if (data == 1) {
                Swal.fire("Đăng ký thành công!", "", "success").
                then((result) => {
                    location.reload();
                });
                $("#name_footer").val('');
                $("#birthday_footer").val('');
                $("#email_footer").val('');
                $("#address_footer").val('');
                $("#phone_footer").val('');
                $("#education_program_footer").val('');
                $("#body_footer").val('');
            } else if (data == 2) {
                Swal.fire("Bạn đã đăng ký nội dung  này trước đó", "", "error");
            } else {
                Swal.fire("Đăng ký thất bại", "", "error");
            }
        });
    } else {
        Swal.fire("Xin vui lòng nhập đầy đủ thông tin!");
    }
}

// comment trang chi tiết khóa học
function comment_education(id) {
    var content = $('#content').val();
    if (content == '') {
        Swal.fire({ title: "Đánh giá", text: "Vui lòng điền nội dung đánh giá", type: "error" });
    } else {
        var url = site_folder + '/index_ajax.php?module_name=comment&action=comment_education';
        $.get(url, { id: id, content: content }, function(data) {
            if (data == -1) {
                Swal.fire({ title: "Đánh giá", text: "Vui lòng đăng nhập trước khi đánh giá", type: "error" });
                $('.btn-check-login').removeClass('hidden');
            } else if (data == 0) {
                Swal.fire({ title: "Đánh giá", text: "Đánh giá thất bại!", type: "error" });
            } else {
                document.getElementById('list-comment').innerHTML = data + document.getElementById('list-comment').innerHTML;
                document.getElementById("content").value = "";
            }
        });
    }
}

// login member
$('#btn-login').on('click', function() {
    var email = $("#email_login").val();
    var password = $("#password_login").val();
    if (email == "") {
        $('.error-email-login').html('Vui lòng nhập email!');
    } else if (password == "") {
        $('.error-password-login').html('Vui lòng nhập password!');
        $('.error-email-login').html('');
    } else {
        var url = site_folder + '/index_ajax.php?module_name=member&action=login';
        $.get(url, { email: email, password: password }, function(data) {
            if (data == 1) {
                Swal.fire("Đăng nhập thành công!", "", "success").
                then((result) => {
                    location.reload();
                });
                $('.btn-check-login').addClass('hidden');
                $('.error-email-login').html('');
                $('.error-password-login').html('');
            } else if (data == 2) {
                Swal.fire({ title: "Đăng nhập", text: "Tài khoản của bạn chưa được kích hoạt, vui lòng đợi admin kích hoạt để đăng nhập!", type: "error" });
            } else {
                $('.error-login').html('Tài khoản hoặc mật khẩu không chính xác!');
            }
        });
    }
});

// register member
$('#btn-register').on('click', function() {
    var name = $("#name_register").val();
    var email = $("#email_register").val();
    var password = $("#password_register").val();
    var address = $("#address_register").val();
    var phone = $("#phone_register").val();
    if (name == "") {
        $('.error-name-register').html('Vui lòng nhập họ tên!');
    } else if (email == "") {
        $('.error-email-register').html('Vui lòng nhập email!');
        $('.error-name-register').html('');
        $('.error-password-register').html('');
    } else if (password == "") {
        $('.error-password-register').html('Vui lòng nhập password!');
        $('.error-email-register').html('');
        $('.error-name-register').html('');
    } else {
        var url = site_folder + '/index_ajax.php?module_name=member&action=register';
        $.get(url, { name: name, email: email, password: password, address: address, phone: phone }, function(data) {
            if (data == -1) {
                $('.error-email-register').html('Email này đã được đăng ký!');
            } else if (data == 0) {
                $('.error-register').html('Đăng ký không thành công!');
            } else {
                Swal.fire("Đăng ký thành công, vui lòng đợi admin kích hoạt tài khoản để đăng nhập!", "", "success").
                then((result) => {
                    location.reload();
                });
                $('.btn-check-login').addClass('hidden');
            }
        });
    }
});

// cho hiển thị thêm binh luận trang khóa học
$('#load-comment-education').on('click', function() {
    var id = $("#idComment").html();
    if (id > 0) {
        var url = site_folder + '/index_ajax.php?module_name=comment&action=load_comment_education';
        $.get(url, { id: id }, function(data) {
            if (data == 0) {
                $('#load-comment-education').addClass('hidden');
            } else {
                var array = JSON.parse(data);
                var html = '';
                $.each(array, function(k, v) {
                    html += '<div class="item-comment">';
                    html += '<h4><span>' + v['name'] + '</span> - <small>' + v['phone'] + '</small></h4>';
                    html += '<p class="txt-comment">' + v['contents'] + '</p>';
                    html += '</div>';
                });
                document.getElementById("idComment").innerHTML = array[array.length - 1]['id_comment'];
                document.getElementById('list-comment').innerHTML = document.getElementById('list-comment').innerHTML + html;
            }
        });
    }
});

// comment trang chi tiết blog
function comment_blog(id) {
    var content = $('#content').val();
    if (content == '') {
        Swal.fire({ title: "Đánh giá", text: "Vui lòng điền nội dung đánh giá", type: "error" });
    } else {
        var url = site_folder + '/index_ajax.php?module_name=comment&action=comment_blog';
        $.get(url, { id: id, content: content }, function(data) {
            if (data == -1) {
                Swal.fire({ title: "Đánh giá", text: "Vui lòng đăng nhập trước khi đánh giá", type: "error" });
                $('.btn-check-login').removeClass('hidden');
            } else if (data == 0) {
                Swal.fire({ title: "Đánh giá", text: "Đánh giá thất bại!", type: "error" });
            } else {
                document.getElementById('list-comment').innerHTML = data + document.getElementById('list-comment').innerHTML;
                document.getElementById("content").value = "";
            }
        });
    }
}

// cho hiển thị thêm binh luận trang chi tiết blog
$('#load-comment-blog').on('click', function() {
    var id = $("#idComment").html();
    if (id > 0) {
        var url = site_folder + '/index_ajax.php?module_name=comment&action=load_comment_blog';
        $.get(url, { id: id }, function(data) {
            if (data == 0) {
                $('#load-comment-blog').addClass('hidden');
            } else {
                var array = JSON.parse(data);
                var html = '';
                $.each(array, function(k, v) {
                    html += '<div class="item-comment">';
                    html += '<h4><span>' + v['name'] + '</span> - <small>' + v['phone'] + '</small></h4>';
                    html += '<p class="txt-comment">' + v['contents'] + '</p>';
                    html += '</div>';
                });
                document.getElementById("idComment").innerHTML = array[array.length - 1]['id_comment'];
                document.getElementById('list-comment').innerHTML = document.getElementById('list-comment').innerHTML + html;
            }
        });
    }
});

// cho hiển thị thêm binh luận trang chi tiết blog
$('#logout').on('click', function() {

    Swal.fire({
        title: 'Đăng xuất?',
        text: "Bạn có chắt muốn đăng xuất khỏi website!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Đăng xuất',
        cancelButtonText: 'Hủy'
    }).then((result) => {
        var url = site_folder + '/index_ajax.php?module_name=member&action=signout';
        $.get(url, {}, function(data) {
            location.reload();
        });
    })
});

$(window).on('load', function() {
    var url = site_folder + '/index_ajax.php?module_name=communicate_confidently&action=check_login';
    $.get(url, {}, function(data) {
        if (data == 1) {
            $(".check-login-video").attr("data-toggle", "modal");
        } else {
            $(".check-login-video .title-video").html('Cần đăng nhập để xem');
        }
    });
})