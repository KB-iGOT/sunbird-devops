<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
    ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
    <#elseif section = "form">
    <#if realm.password>
    <div class="custom-wrapper">
        <div class="custom-grid">
            <div class="ui raised shadow container segment fullpage-background-image left-box">
                <div class="ui column left-panel" style="padding:0">
                <div>
                <img src='${url.resourcesPath}/img/iGOT_Karmayogi_logo_with_karmayogi_bharat.svg' class="kb-logo-3"/>
                </div>
                     <div class="hero-content margin-top-60">

                <span class="badge">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="lucide lucide-sparkles h-3.5 w-3.5 badge-icon">
                        <path
                            d="M9.937 15.5A2 2 0 0 0 8.5 14.063l-6.135-1.582a.5.5 0 0 1 0-.962L8.5 9.936A2 2 0 0 0 9.937 8.5l1.582-6.135a.5.5 0 0 1 .963 0L14.063 8.5A2 2 0 0 0 15.5 9.937l6.135 1.581a.5.5 0 0 1 0 .964L15.5 14.063a2 2 0 0 0-1.437 1.437l-1.582 6.135a.5.5 0 0 1-.963 0z">
                        </path>
                        <path d="M20 3v4"></path>
                        <path d="M22 5h-4"></path>
                        <path d="M4 17v2"></path>
                        <path d="M5 18H3"></path>
                    </svg>
                    <span class="ml-10">AI-DRIVEN Assessment Platform</span></span>
                <div>
                <h1 class="heading-wrapper">
                    Create Intelligent <br>
                    <span class="text-warning text-transparent bg-clip-text bg-gradient-to-r from-[#f0951e] to-[#e94e12]">Assessments</span><br>
                    in Minutes
                </h1>
                </div>  
                <div>

                <p class="sub-heading-text mt-2 mb-2 line-heigh-1-5">
                    Transform your teaching with iGOT AI's powerful assessment <br>
                    generation. Create curriculum-aligned questions that adapt to<br>
                    your learning objectives.
                </p>
                </div>

                <div class="feature-wrapper">

                <div class="feature-card">
                    <div
                        class="flex-shrink-0 w-10 h-10 rounded-lg bg-white/15 flex items-center justify-center feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-brain h-5 w-5">
                            <path d="M12 5a3 3 0 1 0-5.997.125 4 4 0 0 0-2.526 5.77 4 4 0 0 0 .556 6.588A4 4 0 1 0 12 18Z">
                            </path>
                            <path d="M12 5a3 3 0 1 1 5.997.125 4 4 0 0 1 2.526 5.77 4 4 0 0 1-.556 6.588A4 4 0 1 1 12 18Z">
                            </path>
                            <path d="M15 13a4.5 4.5 0 0 1-3-4 4.5 4.5 0 0 1-3 4"></path>
                            <path d="M17.599 6.5a3 3 0 0 0 .399-1.375"></path>
                            <path d="M6.003 5.125A3 3 0 0 0 6.401 6.5"></path>
                            <path d="M3.477 10.896a4 4 0 0 1 .585-.396"></path>
                            <path d="M19.938 10.5a4 4 0 0 1 .585.396"></path>
                            <path d="M6 18a4 4 0 0 1-1.967-.516"></path>
                            <path d="M19.967 17.484A4 4 0 0 1 18 18"></path>
                        </svg>
                    </div>
                    <div class="feature-card-text">
                        <span class="feature-title">AI-Powered Generation</span><br/>
                        <span class="sub-text">Create assessments in seconds using advanced AI technology</span>
                    </div>
                </div>

                <div class="feature-card">
                    <div
                        class="flex-shrink-0 w-10 h-10 rounded-lg bg-white/15 flex items-center justify-center feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-target h-5 w-5">
                            <circle cx="12" cy="12" r="10"></circle>
                            <circle cx="12" cy="12" r="6"></circle>
                            <circle cx="12" cy="12" r="2"></circle>
                        </svg>
                    </div>
                    <div class="feature-card-text">
                        <span class="feature-title">Bloom's Taxonomy Aligned</span><br/>
                        <span class="sub-text">Ensure cognitive level coverage with configurable distributions</span>
                    </div>
                </div>

                <div class="feature-card">
                    <div
                        class="flex-shrink-0 w-10 h-10 rounded-lg bg-white/15 flex items-center justify-center feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-chart-column h-5 w-5">
                            <path d="M3 3v16a2 2 0 0 0 2 2h16"></path>
                            <path d="M18 17V9"></path>
                            <path d="M13 17V5"></path>
                            <path d="M8 17v-3"></path>
                        </svg>
                    </div>
                    <div class="feature-card-text">
                        <span class="feature-title">Smart Analytics</span><br/>
                        <span class="sub-text">Track assessment performance and learning outcomes</span>
                    </div>
                </div>
                </div>

            </div>
            <div class="powered-text">
                Powered by iGOT AI • Karmayogi Bharat
            </div>
                </div>
            </div>
            <div class="ui raised shadow container segment fullpage-background-image login-section">
               

                  
                <div class="ui one column grid stackable">
                    <#--  <div class="ui column tablet only computer only"></div>  -->
                    
                    <div class="ui column height-fix">
                        <div class="max-container">
                            <div class="ui header mb-40 centered">
                                <img onerror="" alt="Error">
                                <#--  <div class="signInHead mt-27">${msg("doSignIn")}</div>  -->
                            </div>

                            <div class="formMsg  textCenter">
                                <#if message?has_content>
                                <div class="ui text mb-30 ${message.type}">
                                    ${message.summary}
                                </div>
                                </#if>
                                <div id="success-msg" class="ui text success hide">suceess</div>
                                <div id="error-msg" class="ui text error hide">error</div>
                            </div>

                            <div class="welcome-section">
                                <div class="welcome-section-heading">Welcome Back</div>
                                <div class="welcome-section-sub-heading">Sign in to continue to iGOT AI</div>
                            </div>

                            <div class="field ${properties.kcFormGroupClass!} type-container mw-100">
                                <div>
                                    <input type="radio" onclick="javascript:passwordOrOtp();" name="usePasswordOrOTP" id="usePasswordRB" checked=true>&nbsp;
                                    <label id="usePasswordLabel" for="usePasswordRB" class="">
                                        Login with password
                                    </label>
                                </div>
                                <div>
                                    <input type="radio" onclick="javascript:passwordOrOtp();" name="usePasswordOrOTP" id="useOTPRB" class="">&nbsp;
                                    <label id="useOTPLabel" for="useOTPRB" class="">
                                        Login with OTP
                                    </label>
                                </div>
                            </div>                            
                          
                        </div>
                          <div id="usePasswordDiv" class="mw-100" >
                                <form id="kc-form-login" onsubmit="return encryptPassword(); login.disabled = true; return true;" class="ui form login-form-container" method="POST" action="${url.loginAction}">
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
                                        <input class="mt-8" placeholder="Enter Your Email Address" id="username" name="username" type="text" disabled />
                                        <#else>
                                        <input class="mt-8" id="username" placeholder="Enter Your Email Address" name="username" onkeyup="validateEmailChar()" onfocusin="inputBoxFocusIn(this)" onfocusout="inputBoxFocusOut(this)" type="text" autofocus autocomplete="off" maxLength=95 />
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
                                        <input placeholder="Enter Your Password"  class=" mt-8" id="password" onfocusin="inputBoxFocusIn(this)" onfocusout="inputBoxFocusOut(this)" name="password" type="password" autocomplete="off" maxLength=100 />
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
                                    <div class="captcha" id="captchaBlock">
                                        <div id="captcha"></div>
                                        
                                    </div>
                                    <div class="field">
                                        <button id="login" class="ui fluid button blue-button">
                                        <span class="vertical-middle"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-log-in w-4 h-4 mr-2"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path><polyline points="10 17 15 12 10 7"></polyline><line x1="15" x2="3" y1="12" y2="12"></line></svg></span>
                                        <span>${msg("doSignIn")}<span></button>
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
                                            <img class="signInWithGoogle" src="${url.resourcesPath}/img/google.png">
                                            ${msg("doLogIn")} ${msg("doSignWithGoogle")}
                                            </button>
                                        </div>
                                        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                           
                                        </#if>
                                    </div>
                                </form>
                            </div>
                            <div id="useOTPDiv" class="mw-100" style="display:none">
                                <form id="kc-form-login" class="${properties.kcFormClass!} ui form login-form-container" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
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
                                       
                                        <div id="kc-registration" class="field">
                                          
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
                                                <img class="signInWithGoogle" src="${url.resourcesPath}/img/google.png">
                                                ${msg("doLogIn")} ${msg("doSignWithGoogle")}
                                                </button>
                                            </div>
                                            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                               
                                            </#if>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="seperator"></div>
                            <div class="features">

                        <p class="text-center blue-link mt-10">What you'll get with iGOT AI</p>

                        <ul class="mt-10 list">
                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-circle-check h-3.5 w-3.5 text-success flex-shrink-0">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <path d="m9 12 2 2 4-4"></path>
                                </svg><span class="ml-10">Generate MCQs, True/False & more</span></li>
                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-circle-check h-3.5 w-3.5 text-success flex-shrink-0">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <path d="m9 12 2 2 4-4"></path>
                                </svg><span class="ml-10">Customize difficulty levels</span></li>
                            <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-circle-check h-3.5 w-3.5 text-success flex-shrink-0">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <path d="m9 12 2 2 4-4"></path>
                                </svg><span class="ml-10">Export in multiple formats</span></li>
                        </ul>

                    </div>

                    <div class="footer-text text-center">
                        iGOT AI • AI-Driven Assessment Generation Tool
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
                var secretKey = CryptoJS.enc.Utf8.parse("testingSecretKey");
                var passwordField = document.getElementById("password");
                var iv = CryptoJS.lib.WordArray.random(16);
                var encrypted = CryptoJS.AES.encrypt(passwordField.value, secretKey, {
                        iv: iv,
                        padding: CryptoJS.pad.Pkcs7,
                        mode: CryptoJS.mode.CBC
                }).toString();
                document.getElementById('ivField').value = CryptoJS.enc.Base64.stringify(iv);

                passwordField.value = encrypted;
                return validateRecaptcha();
        }
    </script>
    <script type="text/javascript">
    
   
       

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
     <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>
    </#if>
</#if>
</@layout.registrationLayout>