<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	int mId = (int)session.getAttribute("mId");
%>
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
		width: 1000px;
		height: 850px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box;
	}
	.b1 {
		width: 800px;
		height: 750px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box;
	}
	.b2 {
		width: 800px;
		height: 100px;
		border: 1px solid #000;
		margin: auto;
		box-sizing: border-box; 
	}
	.b3 {
		width: 700px;
		height: 50px;
		border: 0;
		margin: auto;
		box-sizing: border-box; 
		text-align: center;
	}
	.t0 {
		width: 1000px;
		height: 80px;
		border: 1px solid #fff;
		margin: auto;
		box-sizing: border-box;
		text-align: center;
	}
	
	.pointer1 {
		width: 100px;
		height: 100px;
		position: relative;
		top: 60px;
		left: 30px;
		background: skyblue;
	}
	
	h3 {
		border: 0;
		font-size: 20px;
	}

</style>

<script>
	function enableButton() {
	  var checkbox = document.getElementById('agreementCheckbox');
	  var button = document.getElementById('withdrawButton');
	  button.disabled = !checkbox.checked;
	}
</script>

<script>
function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/deleteDao',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/logout");
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
<br><br>
<div class = "t0">
	<h1>회원 탈퇴 동의서</h1>
</div>

<div class = "b0">
	<div class = "b1">
		<h3>탈퇴 안내<br>
		
회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>

사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br><br>

탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.<br>
회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br><br>

메일	메일 계정 및 보관 중인 메일 삭제<br>
포스트	포스트 계정 및 게시물 삭제<br>
VIBE	'좋아요'한 컨텐츠, 유저 이용 기록 삭제<br>
modoo!(모두)	등록된 홈페이지 및 게시물 삭제<br><br>

탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br>
삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br><br>

네이버 아이디로 로그인을 통해 연동된 사이트 확인<br>
탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다.<br>
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br></h3>


	</div>
		<div class="b2">
			<div class="click" onclick="alert('동의 하였습니다.');">
			     <input type="checkbox" id="agreementCheckbox" onclick="enableButton()" />&nbsp;안내 사항을 모두 확인하였으며, 이에 동의합니다.<p>
			</div>
	<form id="reg_frm">
		<div class="b3">
		   <input type="hidden" name="mId" value="<%= mId %>">	
	  	   <button class="btn btn-outline-primary" id="withdrawButton" name="mId" onclick="submit_ajax()"disabled>탈퇴하기</button>
		</div>		
	</form>
	</div>
</div>

<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>