<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreatePage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<style>
	
	.b0 {
		width: 500px;
		height: 600px;
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
	
	
	#memId, #mPwd, #mAdmin{
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
	if($('#mAdmin').val().length != 5) {
		alert("코드가 일치하지 않습니다.");
		$('#mAdmin').focus();
		return;
	}
	submit_ajax();	
}

function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/hostLoginConfirm',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/paging?pageName=admin/hMember");
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

<br><br><br><br><br>
	<div class = "b0">
		<h1>로 그 인</h1><p><br>
		<form id="reg_frm" method="post">
			<input type="text" id="memId" name="memId" placeholder="아 이 디"><p>
			<input type="password" id="mPwd" name="mPwd" placeholder="비 밀 번 호"><p>
			<br>
			<input type="password" id="mAdmin" name="mAdmin" placeholder="지정 코드"><p>
			<input type="button" class="btn btn-outline-primary" id="t2" value="로그인" onclick="form_check()">
		</form>
	</div>

</div>
</body>
</html>