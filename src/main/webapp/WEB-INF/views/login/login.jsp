<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreatePage</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<style>
	
	.b0 {
		width: 500px;
		height: 466px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	.b1 {
		width: 410px;
		height: 45px;
		border: 1px solid #fff;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	.b2 {
		width: 400px;
		height: 45px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	.snsbox1{
		width: 273px;
		height: 70px;
		border: 1px solid #fff;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	.snsbox2{
		width: 70px;
		height: 70px;
		border: 1px solid #fff;
		margin: 0 10px 0 10px;
		box-sizing: border-box;
		text-align: center;
		float:left;
	}
	
	
	#memId, #mPwd{
		text-align: center;
		width:80%;
		height:40px;
		font-size:20px;
	}

	#t2{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
	}
	
	 form {
        text-align: center;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-top: 200px;
        margin-bottom: 100px; /* 간격 늘리기 (원하는 간격으로 조절 가능) */
        margin-left: 450px;
    }
    .t1 {
        width: 380px; /* 입력란의 너비를 조절 */
        padding: 30px; /* 패딩값을 조절 */
    }
    
    .c1{
       float: right;
    }



   #modal.modal-overlay, #modalPw.modal-overlayPw {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window, #modalPw .modal-windowPw {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title, #modalPw .titlePw {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2, #modalPw .titlePw h2 {
            display: inline;
        }
        #modal .close-area, #modalPw .close-areaPw {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content, #modalPw .contentPw {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
	
</style>
<script>
function form_check() {
	if($('#memId').val().length == 0) {
		alert("아이디는 필수사항입니다.");
		$('#memId').focus();
		return;
	}
	if($('#memId').val().length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		$('#memId').focus();
		return;
	}
	if($('#mPwd').val().length == 0) {
		alert("비밀번호는 필수사항입니다.");
		$('#mPwd').focus();
		return;
	}
	if($('#mPwd').val().length < 4) {
		alert("비밀번호는 4자리 이상이어야 합니다.");
		$('#mPwd').focus();
		return;
	}
	submit_ajax();	
}

function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/loginConfirm',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/Main");
			} else {
				alert(result.desc);
			}
		}
	});
}

function submit_ajax_sns() {
	var queryString = $("#reg_frm_sns").serialize();
	$.ajax({
		url: '/snsLoginConfirm',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/Main");
			} else {
				alert(result.desc);
			}
		}
	});
}

function submit_ajax_findId() {
	var queryString = $("#findId_frm").serialize();
	$.ajax({
		url: '/findId',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				$("#userIdDiv").text("회원님의 아이디는 " + result.memId + " 입니다");
	            $("#userIdDiv").show();
			} else {
				alert(result.desc);
			}
		}
	});
}
function submit_ajax_findPw() {
	var queryString = $("#findPw_frm").serialize();
	$.ajax({
		url: '/findPw',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
	            $("#userPwDiv").show();
				$("#findPw_frm").hide();
			} else {
				alert(result.desc);
			}
		}
	});
}
</script>


</head>

<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
<br><br><br>
	<div class = "b0"><p>
		<h1>로 그 인</h1><p>
		<form id="reg_frm" method="post"><p>
			<input type="text" id="memId" name="memId" placeholder="아 이 디"><p>
			<input type="password" id="mPwd" name="mPwd" placeholder="비 밀 번 호"><p>
			<input type="button" class="btn btn-outline-primary" id="t2" value="로그인" onclick="form_check()">
		</form>
		<div class = "b1">
<div id="container">
              <button class="btn btn-outline-primary" id="btn-modal-id">아이디찾기</button>
              <button class="btn btn-outline-primary" id="btn-modal-pw">비밀번호 찾기</button>
          </div>
          <div id="modal" class="modal-overlay">
              <div class="modal-window">
                  <div class="title">
                      <h2>아이디찾기</h2>
                  </div>
                  <div class="close-area">X</div>
                  <div class="content">
                       <table width="370" height="200" cellpadding="0" cellspacing="0" border="0">
                          <tr>
                            <td>
                               	<input type="text" id="phoneNumber" placeholder="휴대폰번호">
								<input type="button" id="phoneNumberButton" value="인증번호받기">
                            </td>
                         </tr>
                          <tr>
                          	<td>
                            	<input type="text" id="confirmCode" placeholder="인증번호 입력">
								<input type="button" id="confrimCodeButton" value="인증 확인">
                            </td>
                         </tr>
                          <tr>
                            <td>
                            	<form id="findId_frm" name="findId_frm" method="post">
									<input type="hidden" id="submitPhone" name="submitPhone" value="" >	<!--실제 사용해야할..  -->
									<!--<input type="text" id="submitPhone" name="submitPhone" placeholder="테스트용휴대폰번호">  테스트용  -->
									<input type="button" id="f2" value="확인" onclick="submit_ajax_findId()" disabled>     <!--실제 사용할때 disabled 적용하자  -->
								</form>
								<br>
								<div id="userIdDiv" style="display: none;"></div>
                            </td>
                         </tr>
                      </table>
                  </div>
              </div>
          </div>
          
          <div id="modalPw" class="modal-overlayPw">
              <div class="modal-windowPw">
                  <div class="titlePw">
                      <h2>비밀번호찾기</h2>
                  </div>
                  <div class="close-areaPw">X</div>
                  <div class="contentPw">
                  <form id="findPw_frm" name="findPw_frm" method="post">
                       <table width="370" height="200" cellpadding="0" cellspacing="0" border="0">
                       	 <tr>
                            <td>
                               	<input type="text" id="pwFindId" name="pwFindId" placeholder="아이디">
                            </td>
                         </tr>
                          <tr>
                            <td>
                               	<input type="text" id="phoneNumber" placeholder="휴대폰번호">
								<input type="button" id="phoneNumberButton" value="인증번호받기">
                            </td>
                         </tr>
                          <tr>
                          	<td>
                            	<input type="text" id="confirmCode" placeholder="인증번호 입력">
								<input type="button" id="confrimCodeButton" value="인증 확인">
                            </td>
                         </tr>
                          <tr>
                            <td>
								<input type="hidden" id="submitPhone" name="submitPhone" value="" >	<!--실제 사용해야할..  -->
								<!--<input type="text" id="submitPhone" name="submitPhone" placeholder="테스트용휴대폰번호">  테스트용  -->
								<input type="button" id="f2" value="확인" onclick="submit_ajax_findPw()">     <!--실제 사용할때 disabled 적용하자  -->
								<br>
                            </td>
                         </tr>
                      </table>
                      </form> 
                      <div id="userPwDiv" style="display: none;">
									<input type="text" placeholder="새 비밀번호" >
									<input type="text" placeholder="새 비밀번호 확인" >
					  </div>               
                  </div>
              </div>
          </div>
          

		</div><p>
		<input type="button" class="btn btn-outline-primary" id="t2" value="회원가입" onclick='window.location.replace("/join")'>
		<br>
		<div class = "snsbox1">
			<div class = "snsbox2">
		        <div id="loginKa">
		            <a id="custom-login-btn" href="javascript:loginWithKakao()">
		                <img src="/snsLogo/kakao.png" width="70" />
		            </a>
		        </div>
			</div>
		  	<div class = "snsbox2">
		        <a id="gnbLogin" href="#">
		            <img src="/snsLogo/naver.png" width="70" /></a>
		        <div id="naverIdLogin"></div>
		    </div>
		    <div class = "snsbox2">
		        <a id="loginFB" href="#" onclick="fbLogin()">
		            <img src="/snsLogo/facebook.png" width="70" />
		        </a>
		    </div>
		</div>
	</div><p><br><p><br><p><br>
<jsp:include page="../main/footer.jsp"></jsp:include>

<!-- sns 폼 -->
	<form id="reg_frm_sns" name="sns_login">
		<input type="hidden" id="mPwd" name="mPwd" value="" >
		<input type="hidden" id="eMail" name="eMail" value="">
	</form>

<!-- 카카오 조인 시작-->

	<script type='text/javascript'>
		Kakao.init('ba8602f0fcdfdd78a94a9a13be2d9e5e');
		
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success : function(authObj) {
					//alert(JSON.stringify(authObj));
					signIn(authObj);
				},
				fail : function(err) {
					//alert(JSON.stringify(err));
				}
			});
		};

		function signIn(authObj) {
			console.log(authObj);
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					//console.log(res);
					//console.log(res.id);
					//console.log(res.kakao_account.email);
					
					document.sns_login.mPwd.value=res.id;
					document.sns_login.eMail.value=res.kakao_account.email;
					
					submit_ajax_sns();
					
				}
			})
		}

	</script>
<!-- 카카오 조인 끝 -->



<!-- 네이버 조인 시작-->

	<!-- /container -->

	<!-- (2) LoginWithNaverId Javscript SDK -->
	<script src="/snsLogin/naveridlogin_js_sdk_2.0.2.js"></script>

	<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "DNbTpm3bmc0Rx0i44wz2",
			callbackUrl : "http://ec2-54-180-109-103.ap-northeast-2.compute.amazonaws.com:8081/login",
			isPopup : false,
		//loginButton: {color: "green", type: 3, height: 60}
		});
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status) {
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고
					   사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고
		   사용자 정보를 출력합니다. */
		function setLoginStatus() {
			console.log(naverLogin.user);
			var uid = naverLogin.user.getId();
			var profileImage = naverLogin.user.getProfileImage();
			var uName = naverLogin.user.getName();
			var nickName = naverLogin.user.getNickName();
			var eMail = naverLogin.user.getEmail();
			
			//console.log("uid : " + uid);
			//console.log("uName : " + uName);
			//console.log("nickName : " + nickName);
			//console.log("eMail : " + eMail);
			
			//var identify = "okNaver";
			
			document.sns_login.mPwd.value=uid;
			document.sns_login.eMail.value=eMail;
			/* document.sns_login.address.value=identify; */

			$("#gnbLogin").attr("href", "#");
			$("#gnbLogin").click(function() {
				
				submit_ajax_sns();
			});
		}
	</script>
<!-- 네이버 조인 끝 -->	

<!-- 페이스북 조인 시작 -->
<script>
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '322746313508772',
	      cookie     : true,
	      xfbml      : true,
	      version    : 'v17.0'
    	});

	    FB.getLoginStatus(function(response) {
	   		console.log(response);
	    	statusChangeCallback(response);
    	});
	};

  // Load the SDK asynchronously
	(function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

	function statusChangeCallback(response) {
	    if (response.status === 'connected') {
	        getINFO();
		}
	}
	  
    function fbLogin () {
	    FB.login(function(response){
	      statusChangeCallback(response);
	    }, {scope: 'public_profile, email'});
  	}

	function fbLogout () {
	    FB.logout(function(response) {
	    statusChangeCallback(response);
		});
	}

  	function getINFO() {
	    FB.api('/me?fields=id,name,picture.width(100).height(100).as(picture_small)',
		function(response) {
	
	    	console.log(response);
	    	console.log(response.id);
	    	console.log(response.name);

			//var identify = "okFacebook";
			document.sns_login.mPwd.value=response.id;
			//document.sns_login.eMail.value=response.name;
			//document.sns_login.address.value=identify;
			
			submit_ajax_sns();
		});
    }
</script>
<script>
    const modal = document.getElementById("modal")
    function modalOn() {
        modal.style.display = "flex"
    }
    function isModalOn() {
        return modal.style.display === "flex"
    }
    function modalOff() {
        modal.style.display = "none"
    }
    const btnModal = document.getElementById("btn-modal-id")
    btnModal.addEventListener("click", e => {
        modalOn()
    })
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modalOff()
    })
    modal.addEventListener("click", e => {
        const evTarget = e.target
        if(evTarget.classList.contains("modal-overlay")) {
            modalOff()
        }
    })
    window.addEventListener("keyup", e => {
        if(isModalOn() && e.key === "Escape") {
            modalOff()
        }
    })
    
    const modalPw = document.getElementById("modalPw")
    function modalOnPw() {
        modalPw.style.display = "flex"
    }
    function isModalOnPw() {
        return modalPw.style.display === "flex"
    }
    function modalOffPw() {
        modalPw.style.display = "none"
    }
    const btnModalPw = document.getElementById("btn-modal-pw")
    btnModalPw.addEventListener("click", e => {
        modalOnPw()
    })
    const closeBtnPw = modalPw.querySelector(".close-areaPw")
    closeBtnPw.addEventListener("click", e => {
        modalOffPw()
    })
    modalPw.addEventListener("click", e => {
        const evTargetPw = e.target
        if(evTargetPw.classList.contains("modal-overlayPw")) {
            modalOffPw()
        }
    })
    window.addEventListener("keyup", e => {
        if(isModalOnPw() && e.key === "Escape") {
            modalOffPw()
        }
    })
</script>

<!-- firebase 전화인증 -->
<script type="module">
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
	import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-analytics.js";
	import {
		getAuth,
        signInWithPopup,
        GoogleAuthProvider,
        signInWithPhoneNumber,
        RecaptchaVerifier,
      } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-auth.js";
	

	

	const firebaseConfig = {
		apiKey: "AIzaSyC_ReVqcedtjZ1AoR4AZnM8TlWAZetzWpA",
		authDomain: "trainingproject-29de0.firebaseapp.com",
		projectId: "trainingproject-29de0",
		storageBucket: "trainingproject-29de0.appspot.com",
		messagingSenderId: "1068995307943",
		appId: "1:1068995307943:web:6f2cb84127145f3862ee82",
	    measurementId: "G-DPXNN5B43E"
	};

	// Initialize Firebase
	const app = initializeApp(firebaseConfig);
	const analytics = getAnalytics(app);

	const provider = new GoogleAuthProvider();
    const auth = getAuth();
    auth.languageCode = "ko";

	window.recaptchaVerifier = new RecaptchaVerifier
	(auth, 'phoneNumberButton', {
 	 'size': 'invisible',
 	 'callback': (response) => {
    // reCAPTCHA solved, allow signInWithPhoneNumber.
    onSignInSubmit();
  }
});

 document
        .getElementById("phoneNumberButton")
        .addEventListener("click", (event) => {
          event.preventDefault();

const phoneNumber = document.getElementById("phoneNumber").value;
const appVerifier = window.recaptchaVerifier;

signInWithPhoneNumber(auth, "+82" + phoneNumber, appVerifier)
    .then((confirmationResult) => {
      // SMS sent. Prompt user to type the code from the message, then sign the
      // user in with confirmationResult.confirm(code).
      window.confirmationResult = confirmationResult;
	console.log(confirmationResult)
      // ...
    }).catch((error) => {
	console.log(error)
      // Error; SMS not sent
      // ...
    });
});

 document
        .getElementById("confrimCodeButton")
        .addEventListener("click", (event) => {
          event.preventDefault();
          const code = document.getElementById("confirmCode").value;
          confirmationResult
            .confirm(code)
            .then((result) => {
              // User signed in successfully.
              const user = result.user;
              console.log(result);
			  console.log(user.phoneNumber);
			  
			  let formPhoneNumber = document.getElementById("phoneNumber").value;
             	 // Remove the leading '0' from the form phone number
        	  if (formPhoneNumber.startsWith('0')) {
         		 formPhoneNumber = formPhoneNumber.substring(1);
      		  }
       		     formPhoneNumber = "+82" + formPhoneNumber;

        	  if (user.phoneNumber === formPhoneNumber) {
				 alert("인증되었습니다.");
				 var submitPhoneNumber = "0" + formPhoneNumber.substring(3);
				 document.findId_frm.submitPhone.value=submitPhoneNumber;
       	    	 document.getElementById("f2").disabled = false;
       		  } else {
				 alert("인증번호가 맞지 않습니다.");
       	    	 document.getElementById("f2").disabled = true;
       		   }
              // ...
            })
            .catch((error) => {
              console.log(error);
              // User couldn't sign in (bad verification code?)
              // ...
            });
        });


	
</script>






</div>
</body>
</html>