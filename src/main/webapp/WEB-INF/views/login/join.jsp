<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hundred Training</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<style>

	.b0 {
		width: 500px;
		height: 570px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	.b1 {
		width: 400px;
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
	#id, #nick, #pw, #pw_check, #email{
		text-align: center;
		width:80%;
		height:40px;
		font-size:20px;
	}
	#phoneNumber, #confirmCode{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
		float:left;
	}
	#t2{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
	}
	#phoneNumberButton, #confrimCodeButton{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
		float:right;
	}
</style>

<script>
function form_check() {
	if($('#id').val().length == 0) {
		alert("아이디는 필수사항입니다.");
		$('#id').focus();
		return;
	}
	if($('#id').val().length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		$('#id').focus();
		return;
	}
	if($('#nick').val().length == 0) {
		alert("닉네임은 필수사항입니다.");
		$('#nick').focus();
		return;
	}
	if($('#pw').val().length == 0) {
		alert("비밀번호는 필수사항입니다.");
		$('#pw').focus();
		return;
	}
	if($('#pw').val().length < 4) {
		alert("비밀번호는 4자리 이상이어야 합니다.");
		$('#pw').focus();
		return;
	}
	if($('#pw').val() != $('#pw_check').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw').focus();
		return;
	}
	
	if($('#email').val().length == 0) {
		alert("메일은 필수사항입니다.");
		$('#email').focus();
		return;
	}
	submit_ajax();	
}

function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/joinConfirm',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/login");
			} else {
				alert(result.desc);
			}
		}
	});
}






</script>




</head>

<body>


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
				 document.reg_frm.submitPhone.value=submitPhoneNumber;
       	    	 document.getElementById("t2").disabled = false;
       		  } else {
				 alert("인증번호가 맞지 않습니다.");
       	    	 document.getElementById("t2").disabled = true;
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

<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
<br><br><br>
	<div class = "b0"><p>
		<h1>회원가입</h1><p>
			<form id="reg_frm" name="reg_frm" method="post"><p>
				<input type="text" id="id" name="memId" placeholder="아 이 디" ><p>
				<input type="text" id="nick" name="mNick" placeholder="닉 네 임" ><p>
				<input type="password" id="pw" name="mPwd" placeholder="비 밀 번 호" ><p>
				<input type="password" id="pw_check" name="mPwdChk" placeholder="비 밀 번 호 확 인" ><p>
				<input type="text" id="email" name="mEmail" placeholder="e - m a i l"><p>
				<input type="hidden" id="submitPhone" name="submitPhone" value="" >
			<div class = "b1">
	
      			<input id="phoneNumber" name="phoneNumber" placeholder="휴대폰번호"/>
      			<button id="phoneNumberButton" class="btn btn-outline-primary">핸드폰 번호 전송</button>
	
			</div><p>
			<div class = "b1">
				<input id="confirmCode" placeholder="인증번호 입력"/>
	      		<button id="confrimCodeButton" class="btn btn-outline-primary">인증 확인</button>
	
			</div><br><p>
				<input type="button" id="t2" class="btn btn-outline-primary" value="가입하기" onclick="form_check()" disabled>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>