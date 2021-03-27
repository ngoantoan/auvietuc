<div class="col-sm-12">
                        <div class="col-sm-5 no-pad">
                            <div class="col-sm-12 no-pad">
                                <div id="login__header">
                                    <div class="login__title">
                                        <h3>Sign up</h3>
                                    </div>
                                    <!-- START BLOCK : msg -->
                                    <div  id="login__notification">{msg}</div>
                                    <!-- END BLOCK : msg -->
                                    <div class="login__intro-text">
                                        <p>
                                            Sign up to Vietnamvaction for quicker checkout, access to your tickets, and to add activities to your wishlist!
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 no-pad">
                                <div id="login__form">
                                    <div style="display: none;" class="login__register-by-mail">
                                        <a class="login-action" href="#registration_form">Sign up using your email address</a>
                                    </div>
                                    <div style="display: block;" class="login__signup-form">
                                        <form class="login-action" action="#register" method="post">
                                            <div class="login__field login__form-text mb10">
                                                <input style="width: 100%" type="text" placeholder="First name" name="first_name" id="login__first-name" class="form-control" size="30" required>
                                            </div>
                                            <div class="login__field login__form-text mb10">
                                                <input style="width: 100%" type="text" placeholder="Last name" name="last_name" id="login__last-name" class="form-control" size="30" required>
                                            </div>
                                            <div class="login__field login__form-text mb10">
                                                <input style="width: 100%" type="email" placeholder="Email address" name="email" id="login__email" class="form-control" size="30" required>
                                            </div>
                                            <div class="login__field login__form-text mb10">
                                                <input type="password" placeholder="Password" name="password" id="login__password" class="form-control" size="30" value="" required>
                                            </div>
                                            <div class="login__field login__form-checkbox login__get-newsletter">
                                                <label>
                                                    <input type="checkbox" value="1" name="get_newsletter">
                                                    Send me Vietnamvaction's latest promotions and travel tips. </label>
                                            </div>
                                            <div class="login__button">
                                            	<input type="hidden" name=action value="dangky">
                                                <button class="btn btn--blue btn--medium" type="submit" name="submit" value="register">
                                                    Create Account
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 no-pad">
                                <div id="login__footer">
                                    <div class="login__already-member">
                                        <a class="login-action" href="{sign-in}">Already a Vietnamvaction member?</a>
                                    </div>
                                    <div class="overlay__divider">
                                        <hr>
                                    </div>
                                    <div class="login__terms-policies">
                                        <p class="login__terms">
                                            We care about your privacy and won't share your email address with anyone. By proceeding, you confirm that you accept our <a href="" target="_blank">Terms of Service</a> and <a href="" target="_blank">Privacy Statement</a>.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>