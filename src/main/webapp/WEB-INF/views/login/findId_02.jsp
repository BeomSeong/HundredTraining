<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreatePage</title>
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
	#t1{
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
	#t3{
		text-align: center;
		width:48%;
		height:40px;
		font-size:20px;
		float:right;
	}

</style>


</head>

<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<br><br><br><br><br>
	<div class = "b0">
		<h1>아 이 디 찾 기</h1>
		<div class = "b1">
			<h1>회원 아이디 : 회원 아이디</h1>
		</div><p><br><p><br>

			<input type="button" id="t2" value="확인">
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>