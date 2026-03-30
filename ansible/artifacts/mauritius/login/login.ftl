<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
    ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
    <#elseif section = "form">
    <#if realm.password>
    <div class="custom-wrapper">
        <!-- Logo positioned in top right corner -->
        <div class="logo-top-right">
            <img src="${url.resourcesPath}/img/mauritius-KB-logo-new.svg" alt="Mauritius Knowledge Base Logo" />
        </div>
        <div class="page mauritius">
            <div class="ui raised shadow container hero">
                <div class="hero__bg"></div>
                <!-- <svg class="hero__wave" viewBox="0 0 130 900" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M130,0 C80,150 160,300 80,450 C0,600 100,750 130,900 L130,900 L130,0 Z" fill="#fff"></path>
                </svg> -->
                <div class="hero__wave">
                    <img src="${url.resourcesPath}/img/Curve1.svg" class="" alt="Background Wave" />
                </div>
                <div class="ui column hero__content">
                    <div class="hero-text-container">
                        <h1 class="hero-title large-screen">Empowering Mauritian <br>Civil Servants</h1>
                        <h1 class="hero-title responsive-screen">Empowering Mauritian <br>Civil Servants</h1>
                        <p class="hero-subtitle">Access world-class governance training through the iGOT-Karmayogi platform &mdash; a collaboration to train 500 civil servants with role-based competency frameworks.</p>
                    </div>
                </div>
                <!-- <svg class="hero__arcs" viewBox="0 0 280 280" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="0" cy="280" r="100" stroke="rgba(255,255,255,0.18)" stroke-width="1.5" fill="none"></circle>
                    <circle cx="0" cy="280" r="150" stroke="rgba(255,255,255,0.12)" stroke-width="1.5" fill="none"></circle>
                    <circle cx="0" cy="280" r="200" stroke="rgba(255,255,255,0.07)" stroke-width="1.5" fill="none"></circle>
                </svg> -->
                <img src="${url.resourcesPath}/img/White-circle.svg" class="hero__arcs" alt="White Circles" />
            </div>
            
                <div class="ui one column grid stackable panel">
                    <#--  <div class="ui column tablet only computer only"></div>  -->
                    <div class="ui column height-fix">
                        <div class="max-container">
                            <h2 class="login-form-heading">Log In</h2>

                            <div class="formMsg  textCenter">
                                <#if message?has_content>
                                <div class="ui text mb-30 ${message.type}">
                                    ${message.summary}
                                </div>
                                </#if>
                                <div id="success-msg" class="ui text success hide">suceess</div>
                                <div id="error-msg" class="ui text error hide">error</div>
                            </div>                         
                            <div id="usePasswordDiv" class="mw-100" >
                            
                                <form id="kc-form-login" onsubmit="return encryptPassword(); login.disabled = true; return true;" class="ui form" method="POST" action="${url.loginAction}">
                                    <input type="hidden" id="ivField" name="iv" />
				                    <input type="hidden" name="page_type" value="login_with_pass" />
                                    <div class="field">
                                        <label id="usernameLabel" for="username" class="">
                                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                                            <#elseif !realm.registrationEmailAsUsername>${msg("emailOrPhone")}
                                            <#else>${msg("email")}
                                            </#if>
                                        </label>
                                        <label id="usernameLabelPlaceholder" for="username" class="activeLabelColor hide">
                                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                                            <#elseif !realm.registrationEmailAsUsername>${msg("placeholderForEmailOrPhone")}
                                            <#else>${msg("email")}
                                            </#if>
                                        </label>
                                        <#if usernameEditDisabled??>
                                        <#-- TODO: need to find alternative for prepopulating username -->
                                        <input class="mt-8" id="username" name="username" type="text" disabled />
                                        <#else>
                                        <input class="mt-8" id="username" name="username" onkeyup="validateEmailChar()" onfocusin="inputBoxFocusIn(this)" onfocusout="inputBoxFocusOut(this)" type="text" autofocus autocomplete="off" maxLength=95 />
                                        <span id="emailLengthErr" class="ui text error" style="font-size:11px!important;"></span>
                                        </#if>
                                    </div>
                                    <div class="field">
                                        <div>
                                            <label id="passwordLabel" for="password" class="">
                                                ${msg("password")}
                                            </label>
                                            <#if realm.resetPasswordAllowed>
                                                <a id="fgtKeycloakFlow" class="ui right floated forgetPasswordLink hide" tabindex="1" onclick="javascript:storeLocation(); javascript:makeDivUnclickable()" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                                                <div id="fgtPortalFlow" class="ui right floated forgetPasswordLink hide" tabindex="1" onclick="javascript:forgetPassword('/recover/identify/account');javascript:makeDivUnclickable()">${msg("doForgotPassword")}</div>
                                            </#if>
                                            <label id="passwordLabelPlaceholder" for="password" class="activeLabelColor hide">
                                                ${msg("placeholderForPassword")}
                                            </label>
                                        </div>
                                        <input placeholder="${msg('passwordPlaceholder')}" class=" mt-8" id="password" onfocusin="inputBoxFocusIn(this)" onfocusout="inputBoxFocusOut(this)" name="password" type="password" autocomplete="off" maxLength=100 />
                                        <span class="ui text error hide" id="inCorrectPasswordError">${msg("inCorrectPasswordError")}</span>
                                    </div>
                                    <div class="field">
                                    <#if recaptchaRequired??>
                                        <div class="form-group">
                                            <div class="${properties.kcInputWrapperClass!}">
                                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                                            </div>
                                        </div>
                                    </#if>
                                    </div>
                                    <#--  <div class="captcha" id="captchaBlock">
                                    <div id="captcha"></div>
                                    </div> -->
                                    <div class="field">
                                        <button id="login" class="ui fluid button">${msg("doLogIn")}</button>
                                    </div>
                                </form>
                            </div>
                            <div id="useOTPDiv" class="mw-100" style="display:none">
                                <form id="kc-form-login" class="${properties.kcFormClass!} ui form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <input type="hidden" name="page_type" value="login_page" />
                                    <#--  <div class="${properties.kcFormGroupClass!}">
                                        <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                                            <i class="material-icons mdc-text-field__icon" role="button">phone</i>
                                            <input tabindex="0" required id="user.attributes.mobile_number" class="mdc-text-field__input ${properties.kcInputClass!}" name="user.attributes.mobile_number" type="text" autofocus autocomplete="off">
                                            <div class="mdc-line-ripple"></div>
                                            <label for="user.attributes.mobile_number" class="mdc-floating-label ${properties.kcLabelClass!}">
                                                Phone Number
                                            </label>
                                        </div>
                                    </div>  -->

                                    <div class="field">
                                        <div>
                                            <label id="phoneNumberLabel" for="emailOrPhone" class="">
                                                Email/Phone number
                                            </label>
                                            <label id="phoneNumberLabelPlaceholder" for="emailOrPhone" class="activeLabelColor hide">
                                                Email/Phone number
                                            </label>
                                        </div>
                                        <input tabindex="0" required id="emailOrPhone" placeholder="Email/Phone number (10 digit number)"
                                        class="mdc-text-field__input ${properties.kcInputClass!} mt-8" 
                                        name="emailOrPhone" type="text" autofocus autocomplete="off" onfocusin="inputBoxFocusIn(this)" onfocusout="inputBoxFocusOut(this)" maxlength=95>
                                    </div>
                                    
                                    <div class="mdc-card__actions">
                                        <#--  <a href="${url.registrationUrl}" class="mdc-button mdc-card__action mdc-card__action--button">
                                            <i class="material-icons mdc-button__icon">arrow_back</i>Sign Up
                                        </a>  -->
                                        
                                        <div class="field">
                                            <button tabindex="0" name="login" id="kc-login" type="submit" class="ui fluid button">
                                                    Request OTP
                                            </button>
                                        </div>
                                        <div class="field or-container">
                                            <div class="or-holder">
                                                <span class="or-divider"></span>
                                                <span class="or-text">or</span>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label id="loginWithProviderPlaceholder" for="loginWithProvider" class="">
                                            Login with Providers
                                        </label>
                                        <select class="ui fluid" onchange="if (this.value) window.location.href = this.value;" id="externalLogin" style="text-align-last: center; background-color: rgb(0,116,182); color: white;">
                                            <option value="" style="background-color: rgb(0,116,182); color: white;" selected>Select Provider</option>
                                            <option value="/apis/public/v8/parichay/auth" style="background-color: rgb(0,116,182); color: white;">Parichay</option>
                                            <option value="/apis/public/v8/oil/auth" style="background-color: rgb(0,116,182); color: white;">OIL India</option>
                                            <option value="/apis/public/v8/ntpc/auth" style="background-color: rgb(0,116,182); color: white;">NTPC</option>
                                        </select> 
                                        </div>
                                        <div id="kc-registration" class="field">
                                            <div class="ui content mt-40 signUpMsg">
                                                <span>${msg("noAccount")} <a class="signUpLink" href="${client.baseUrl}public/signup">${msg("registerHere")}</a></span>
                                            </div>
                                        </div>
                                        <div id="selfSingUp" class="hide">
                                            <p class="or my-16 textCenter">OR</p>
                                            <div class="field">
                                                <#if realm.password && social.providers??>
                                                    <!--div id="kc-social-providers">
                                                        <#list social.providers as p>
                                                        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId} ui fluid blue basic button textCenter">
                                                        <i class="icon signInWithGoogle"></i>${msg("doSignIn")} ${msg("doSignWithGoogle")}
                                                        </a>
                                                        </#list>
                                                    </div-->
                                                </#if>
                                                <button type="button" id="stateButton" class="sb-btn sb-btn-normal sb-btn-success width-100 mb-16" onclick="navigate('state')">
                                                    ${msg("doSignWithState")}
                                                </button>
                                                <button type="button" class="sb-btn sb-btn-normal sb-btn-outline-primary width-100 d-flex flex-ai-center flex-jc-center" onclick="navigate('google')">
                                                
                                                ${msg("doLogIn")} ${msg("doSignWithGoogle")}
                                                </button>
                                            </div>
                                            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                                <div id="kc-registration" class="field">
                                                    <div class="ui content mt-40 signUpMsg">
                                                        ${msg("noAccount")} <span id="signup" tabindex="0" class="registerLink" onclick=navigate('self')>${msg("registerHere")}</span>
                                                        <span>${msg("noAccount")} <a class="signUpLink" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                                                    </div>
                                                </div>
                                            </#if>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <#--  <div class="ui column tablet only computer only"></div>  -->
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
    <script type="text/javascript">
        function encryptPassword() {
                var secretKey = CryptoJS.enc.Utf8.parse("${secretKey}");
                var passwordField = document.getElementById("password");
                var iv = CryptoJS.lib.WordArray.random(16);
                var encrypted = CryptoJS.AES.encrypt(passwordField.value, secretKey, {
                        iv: iv,
                        padding: CryptoJS.pad.Pkcs7,
                        mode: CryptoJS.mode.CBC
                }).toString();
                document.getElementById('ivField').value = CryptoJS.enc.Base64.stringify(iv);

                passwordField.value = encrypted;
           //     return validateRecaptcha();
                return true;
        }
    </script>
    <script type="text/javascript">
    
    callZohoForm()

        var slideIndex = 0;
        showSlides();

        function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";  
		}
		slideIndex++;
		if (slideIndex > slides.length) {slideIndex = 1}    
		for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";  
		dots[slideIndex-1].className += " active";
		setTimeout(showSlides, 5000); // Change image every 5 seconds
        }

	function passwordOrOtp() {
                if (document.getElementById('usePasswordRB').checked) {
                    document.getElementById('usePasswordDiv').style.display = 'block';
                    document.getElementById('useOTPDiv').style.display = 'none';
                } else {
                    document.getElementById('usePasswordDiv').style.display = 'none';
                    document.getElementById('useOTPDiv').style.display = 'block';
                }
            }

    
            function validateEmailChar() {                
		const validRegex = "/^[a-z0-9_-]+(?:\.[a-z0-9_-]+)*@((?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?){2,}\.){1,3}(?:\w){2,}$/"
                let userEmail = document.getElementById("username").value.trim()
                if (userEmail && userEmail.length > 0) {
		if(userEmail.length > 5 && !userEmail.match(validRegex)) {
                        document.getElementById("emailLengthErr").innerHTML = "email is not valid"
                        if(grecaptcha && grecaptcha.getResponse().length > 0) {
                                document.getElementById("login").disabled = false
                        } else {
                            document.getElementById("login").disabled = true
                        }
                    }
                    const email = userEmail.split('@')
                    if (email && email.length === 2) {
                        if((email[0] && email[0].length > 64 ) || (email[1] && email[1].length >255)) {
                            document.getElementById("emailLengthErr").innerHTML = "Max 64 characters before @ & 255 characters after @ are valid."
                            if(grecaptcha && grecaptcha.getResponse().length > 0) {
                                document.getElementById("login").disabled = false
                            } else {
                                document.getElementById("login").disabled = true
                            }
                            
                        } else {
                            document.getElementById("emailLengthErr").innerHTML = ""
                                if(grecaptcha && grecaptcha.getResponse().length > 0) {
                                    document.getElementById("login").disabled = false
                                } else {
                                    document.getElementById("login").disabled = true
                                }
                            }
                        }
                    }
			else if (userEmail.replace(/\s+/g, '').length == 0 || userEmail === "") {
                        	document.getElementById("emailLengthErr").innerHTML = "email field can not be blank"
                        	if(grecaptcha && grecaptcha.getResponse().length > 0) {
                                document.getElementById("login").disabled = false
                            } else {
                                document.getElementById("login").disabled = true
                            }
                    }
                } 

    
    </script>
    <script type="text/javascript">    
        function recaptchaCheckedCallback() {
            if(grecaptcha && grecaptcha.getResponse().length > 0) {
                document.getElementById("login").disabled = false
            } else {
                document.getElementById("login").disabled = true
            }
        }  
        function recaptchaExpiredCallback() {
            grecaptcha.reset();
        }  
        var onloadCallback = function() {
            grecaptcha.render('captcha', {
            'sitekey' : '6Lcl-CQqAAAAAMEPv0kxyrtYhBVZBXtXygyHNoyX',
            'badge' : 'bottomright',
            'callback': recaptchaCheckedCallback,
            'expired-callback': recaptchaExpiredCallback
            });
        };
        var validateRecaptcha = function() {
            var v = grecaptcha.getResponse();
            console.log("Resp" + v);
            if (v == '') {
                validateRecaptchaFlag = false
                document.getElementById("login").disabled = true
                document.getElementById('captcha').innerHTML = "Invalid Captcha";
                return false;
            }
            else {
                validateRecaptchaFlag = true
                document.getElementById("login").disabled = false
                return true;
            }
        }
    </script>
<#-- <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
</script> -->
    </#if>
</#if>
</@layout.registrationLayout>
