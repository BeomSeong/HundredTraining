<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="http://code.jquery.com/jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<style>
    form {
        text-align: center;
    }
    .form-group {
        display: flex;
        align-items: center;
        width: 600px; /* 폼 그룹의 고정 너비 지정 */
        margin-top: 200px;
        margin-bottom: 100px; /* 간격 늘리기 (원하는 간격으로 조절 가능) */
        margin-left: 450px;
    }
    input {
        width: 380px; /* 입력란의 너비를 조절 */
        padding: 30px; /* 패딩값을 조절 */
    }
    button {
    	font-size: 20px;
        width: 300px; /* 버튼의 너비를 조절하세요 */
        padding: 30px; /* 패딩값을 조절하세요 */
    }
</style>
<script>
function form_check() {
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
		url: '/memberCheck',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/myInformModify");
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
        <div class="form-group">
            <form id="reg_frm" method="post">
	            <input type="text" id="memId" name="memId" placeholder="아이디를 입력하세요."><p>
	            <input type="password" id="mPwd" name="mPwd" placeholder="비밀번호를 입력하세요."><p>
            	<button type="button" id="t2" onclick="form_check()">확인</button>
            </form>
        </div>
        
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>
