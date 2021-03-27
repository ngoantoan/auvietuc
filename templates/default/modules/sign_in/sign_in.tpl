<div class="wrapper fadeInDown">
    <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
        <h2>Sign in</h2>
        <!-- START BLOCK : msg -->
            <div class="col-md-12 text-center" style="color:red; text-align:center; padding: 15px;" >{msg}</div>
        <!-- END BLOCK : msg -->
    </div>

    <!-- Login Form -->
    <form action="{login_url}" method="post" id="login_form">
        <input type="email" id="email" class="fadeIn second flogin" name="email" placeholder="email">
        <input type="password" id="password" class="fadeIn third flogin" name="password" placeholder="password">
        <input type="submit" form="login_form" class="fadeIn fourth btn-submit" value="Đăng nhập">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
        <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

    </div>
</div>