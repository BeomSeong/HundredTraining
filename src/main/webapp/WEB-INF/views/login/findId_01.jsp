<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreatePage</title>
<script src="http://code.jquery.com/jquery.js"></script>
<style>
	
	.b0 {
		width: 500px;
		height: 280px;
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
	#phoneNumberButton, #confirmCodeButton{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
		float:right;
	}

</style>

<script>
function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/findId_02',
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




<jsp:include page="../main/header.jsp"></jsp:include>
<br><br><br><br><br>

	<div class = "b0">
		<h1>아 이 디 찾 기</h1>
		
		<div class = "b1">
			<!-- <input type="text" id="phoneNumber" placeholder="휴대폰번호"> -->
			<input type="button" id="phoneNumberButton" value="인증번호받기">
		</div><p>
		<div class = "b1">
			<input type="text" id="confirmCode" placeholder="인증번호 입력">
			<input type="button" id="confrimCodeButton" value="인증 확인">
		</div><p>
		<form id="reg_frm" name="reg_frm" method="post">
			<!-- <input type="hidden" id="submitPhone" name="submitPhone" value="" > -->
			<input type="text" id="submitPhone" name="submitPhone" placeholder="휴대폰번호">  <!--테스트용  -->
			<input type="button" id="t2" value="확인" onclick="submit_ajax()">
		</form>
		<br>
		<div id="userIdDiv" style="display: none;"></div>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>