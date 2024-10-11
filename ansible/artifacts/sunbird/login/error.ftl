<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>iGot</title>
  <meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1" />
  <style>
    body {
        height: 100%;
        background: #f4e7d7;
    }
    .maintenance-block {
        width: 98vw;
        height: 100vh;
        height: 100%;
    }
    .maintenance-block .extra-padding {
        padding: 0 26%;
   }
    .maintenance-block .links {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 25px;
   }
    .maintenance-block .thumbnails {
        width: 160px;
        height: 125px;
        cursor: pointer;
        position: relative;
   }
    .maintenance-block .margin-bottom-xs {
        margin-bottom: 6px;
   }
    .maintenance-block .font-bold {
        font-weight: 600 !important;
   }
    .maintenance-block .top-strip {
        background: #ffdfbd;
        height: 35px;
   }
    .maintenance-block .logo-section {
        background: #f4e7d7;
   }
    .maintenance-block .myloag {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 175px;
   }
    .maintenance-block .logo-img {
        width: 237px;
   }
    .maintenance-block .content-section {
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f4e7d7;
   }
    .maintenance-block .details-section {
        width: 100%;
   }
    .maintenance-block .details {
        text-align: center;
        /* margin-top: 25px; */
   }
    .maintenance-block .message {
        padding: 0 22%;
   }
    .maintenance-block .contact-section {
        background-image: url('https://igotkarmayogi.gov.in/assets/maintenance/Group 476.svg');
   }
    .maintenance-block .gradianet {
        position: absolute;
        display: grid;
   }
    .maintenance-block .g1 {
        border-bottom: 1px solid #fff;
        height: 16px;
   }
    .maintenance-block .middle-strip {
        background: #f4e7d7;
        display: flex;
        flex-flow: row;
   }
    .maintenance-block .bottom-strip .contact-us-wrapper {
        background: linear-gradient(106.94deg, #3a70cf 3.96%, #1146a2 39.76%);
   }
    .maintenance-block .orange-text {
        color: #f3962f;
        font-size: 100px;
        font-weight: 900;
        margin: 0;
   }
    .maintenance-block h1 {
        font-size: 56px;
        font-weight: 600;
        color: #1f3c86 !important;
   }
    .maintenance-block .mat-body {
        font-size: 16px;
        font-weight: 400;
        color: #000;
        line-height: 24px;
        font-family: 'Lato';
   }
    .maintenance-block .logoimg {
        width: 237px;
        margin: 2em auto 5em auto;
   }
    .maintenance-block ::ng-deep.video-conference {
        padding: 20px 0px 0px 0px !important;
   }
    .maintenance-block ::ng-deep.video-conference .mb-3 {
        margin-bottom: 0.7rem !Important;
   }
    .maintenance-block ::ng-deep.video-conference img {
        height: 40px;
        width: 40px;
   }
    .maintenance-block .shadow-web {
        position: absolute;
        display: block;
        left: 6%;
        bottom: 0%;
   }
    .maintenance-block .shadow-mob {
        display: none;
   }
    .maintenance-block .karmaimage {
        position: absolute;
        left: 8%;
        bottom: 17%;
        height: 550px;
        width: 180px;
   }
    .maintenance-block .relative {
        position: relative;
   }
    .maintenance-block .lampleft {
        position: absolute;
        left: 0;
        height: 80%;
   }
    .maintenance-block .lampright {
        position: absolute;
        right: 0;
        height: 80%;
   }
    .maintenance-block .innerbox {
        width: 46%;
        margin: 0 auto;
   }
    .maintenance-block .margin-bottom-l {
        margin-bottom: 16px;
   }
    .maintenance-block .margin-bottom-xl {
        margin-bottom: 15px;
   }
    .maintenance-block .margin-bottom-xxl {
        margin-bottom: 32px;
   }
    ::ng-deep.userway_buttons_wrapper {
        display: none !important;
   }
    ::ng-deep.chatbot-icon-container {
        display: none !important;
   }
    @media screen and (max-width: 767px) {
        .extra-padding {
            padding: 0 0% !important;
       }
        .myloag {
            height: 70px !important;
       }
        .logo-img {
            width: 170px !important;
       }
        .lampright {
            height: 320px !important;
       }
        .lampleft {
            position: absolute;
            left: 0px !important;
            height: 300px !important;
       }
        .orange-text {
            margin-top: 75px;
            font-size: 16px !important;
            margin-bottom: 2px !important;
       }
        .sub-2 {
            font-size: 18px !important;
            
       }
        .details-section {
            width: 79% !important;
            float: right !important;
       }
        .content-container {
            padding-right: 0 !important;
       }
        .message {
            padding: 0 3em !important;
       }
        .karmaimage {
            left: -3% !important;
            bottom: 75% !important;
            height: 400px !important;
            width: 150px !important;
       }
        .shadow-mob {
            display: block !important;
            left: 2% !important;
            bottom: 63% !important;
            position: absolute;
       }
        .shadow-web {
            display: none !important;
       }
        .m1 {
            font-size: 10px !important;
            line-height: 13px !important;
            margin-bottom: 16px !important;
       }
        .m2 {
            font-size: 10px !important;
            line-height: 12px !important;
            padding: 0 4em !important;
       }
        ::ng-deep.social-icons li {
            margin-right: 10px !important;
       }
        .links {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 55px !important;
            gap: 15px !important;
       }
        ::ng-deep.video-conference {
            padding: 25px 15px 0px 0px !important;
       }
        ::ng-deep.video-conference .text-support {
            margin-bottom: 0.5em !important;
       }
        .thumbnails {
            width: 105.12px !important;
            height: 82.64px !important;
            cursor: pointer;
            z-index: 9999;
            position: relative;
       }
        .margin-bottom-xs {
            margin-bottom: 10px !important;
       }
   }
    @media screen and (min-width: 769px) and (max-width: 1280px) {
        .karmaimage {
            left: 2% !important;
            bottom: 16% !important;
            height: 600px !important;
            width: 135px !important;
       }
        .lampleft {
            left: -3% !important;
       }
        ::ng-deep.social-icons {
            text-align: center;
       }
   }
    @media screen and (min-width: 768px) and (max-width: 819px) {
        .extra-padding {
            padding: 0 18% !important;
       }
        .karmaimage {
            left: -1% !important;
            bottom: 16% !important;
            height: 600px !important;
            width: 135px !important;
       }
        .lampleft {
            left: -50px !important;
       }
        ::ng-deep.social-icons {
            text-align: center !important;
       }
        .shadow-web {
            left: -8% !important;
            bottom: 18% !important;
       }
   }
    @media screen and (min-width: 820px) and (max-width: 1024px) {
        .extra-padding {
            padding: 0 2% !important;
       }
        .karmaimage {
            left: 2% !important;
            bottom: 16% !important;
            height: 600px !important;
            width: 135px !important;
       }
        .lampleft {
            left: 0 !important;
            height: 68% !important;
       }
        .lampright {
            height: 72% !important;
       }
        .details-section {
            width: 79% !important;
            float: right !important;
       }
        .shadow-web {
            left: -6% !important;
            bottom: 18% !important;
       }
   }
    
  </style>
</head>

<body >

    
    <div class="maintenance-block">
        <div class="top-strip"></div>
        <img class="lampleft" src="https://igotkarmayogi.gov.in/assets/maintenance/lamp2.svg" alt="">
        <img class="lampright" src="https://igotkarmayogi.gov.in/assets/maintenance/lamp1.svg" alt="">
        <div class="logo-section">
            <div class="container">
                <div class="myloag">
                    <img class="logo-img" src="https://igotkarmayogi.gov.in/assets/img/karmayogiLogo.svg" alt="karmayogiLogo">
                </div>
            </div>
        </div>
        <div class="content-section">
            <div class="container content-container">
                <div class="details-section">
                    <div class="details">
                        ${message.summary}
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>