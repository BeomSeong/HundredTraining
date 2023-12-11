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
body {
    width: 100%;
    height: 100%;
}
tr, td {
    text-align: center;
}
</style>

<script>
// 이미지 있는 페이지 이미지 보이게 처리
$(document).ready(function() {
	var checking = "${post.sFilename}";
	
	console.log(checking);
	if(checking != ""){
		$("#imgshow").show();
	}
});
</script>


</head>

<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>

	<hr>
	<h1 align="center">상품 내용 수정</h1>
	<hr>
	
<form action="/modifyShopBoard" method="post" enctype="multipart/form-data">
    <table class="table table-striped table-hover">
	<tr>
        <td>카테고리</td>
        <td>
        	<select id="sCategory" name="sCategory" >
				<option value="pushup" ${post.sCategory == 'pushup' ? 'selected' : ''}>팔굽혀펴기</option>
				<option value="pullup" ${post.sCategory == 'pullup' ? 'selected' : ''}>턱걸이</option>
				<option value="situp" ${post.sCategory == 'situp' ? 'selected' : ''}>윗몸일으키기</option>
				<option value="running" ${post.sCategory == 'running' ? 'selected' : ''}>달리기</option>
			</select>
		</td>
    </tr>
    <tr>
        <td>제목</td>
        <td><input type="text" id="sTitle" name="sTitle" value="${post.sTitle}"></td>
    </tr>
    <tr>
        <td>내용</td>
        <td><input type="text" id="sContent" name="sContent" value="${post.sContent}"></td>
    </tr>
    <tr>
    	<td>
    		<img id="imgshow" src="/images/${post.sCategory}/${post.sFilename}" style="display: none;">
  			<input type="file" class="btn btn-outline-primary" id="files" name="files" accept="image/*" >
    	</td>
    </tr>
    <tr>
        <td>
        	<input type="hidden" name="sId" value="${post.sId}">
            <input type="submit" class="btn btn-outline-primary" value="수정완료" >&nbsp;&nbsp;&nbsp;
            <input type="reset" class="btn btn-outline-primary" value="취소" onclick="javascript:window.location='/paging?pageName=hShopView'">
        </td>
    </tr>
</table>
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