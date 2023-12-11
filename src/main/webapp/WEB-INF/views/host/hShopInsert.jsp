<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
<style>
body {
    width: 100%;
    height: 100%;
}
tr, td {
    text-align: center;
}
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: inline-block;
        width: 70px;
    }
    .form-group input[type="text"] {
        margin-bottom: 5px;
    }
    .form-container {
        border: 1px solid #000;
        padding: 10px;
        margin-bottom: 10px;
    }
    .form-footer {
        display: flex;
        justify-content: space-between;
    }
    .form-wrapper {
        display: flex;
    }
</style>
</head>
<body>
<div class="container">
<jsp:include page="../main/hostHeader.jsp"></jsp:include>

	<hr>
	<h1 align="center">상품 등록</h1>
	<hr>
	
	<form action = "/hShopProductInsert" method="post" enctype="multipart/form-data">
		<div class="form-wrapper">
			<div class="form-container">
				<input type="file" id="files" name="files" accept="image/*">
			</div>
			<div class="form-container">
				<select id="sCategory" name="sCategory">
					<option value="pushup">팔굽혀펴기</option>
					<option value="pullup">턱걸이</option>
					<option value="situp">윗몸일으키기</option>
					<option value="running">달리기</option>
				</select>
				<div>
					<label for="title">상 품 명:</label>
					<input type="text" id="sTitle" name="sTitle">
				</div>
				<div>
					<label for="author">상품가격:</label>
					<input type="text" id="sMoney" name="sMoney">
				</div>
			</div>
		</div>
		<div class="form-container">
			<textarea id="sContent" name="sContent" size="30"></textarea>
		</div>
		<input type="submit" class="btn btn-outline-primary" value="등록">
	</form>
<jsp:include page="../main/footer.jsp"></jsp:include>

    
<script>
	ClassicEditor
	    .create( document.querySelector( '#sContent' ) )
	    .catch( error => {
	    console.error( error );
	} );
</script>
</div>
</body>
</html>
