<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training</title>
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

.holdButton {
	display: flex;
}

</style>
<script>
/* function shop_check() {
	if($('#sTitle').val().length == 0) {
		alert("카테고리는 필수사항 입니다.");
		$('#sTitle').focus();
		return;
	}
	if($('#sContent').val().length < 2) {
		alert("상품명을 2글자 이상 입력하세요.");
		$('#sContent').focus();
		return;
	}
	if($('#sMoney').val().length < 4) {
		alert("1000원 이상부터 등록이 가능합니다.");
		$('#sMoney').focus();
		return;
	}
	shop_ajax();	
} */


function submitDelShop_ajax(sId) {
	var queryString = $("#shopDeleteForm_" + sId).serialize();
	$.ajax({
		url: '/submitDelshop',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${fEach}");
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
<jsp:include page="../main/hostHeader.jsp"></jsp:include>
    
	<hr>
	<h1 align="center">상품관리</h1>
	<hr>
	
        <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">카테고리</th>
                <th scope="col">상품명</th>
                <th scope="col">상품 가격</th>
                <th scope="col">수정</th>
                <th scope="col">삭제</th>
            </tr>
        </thead>
        <tbody class="table-group-divider">
   		    <c:forEach items="${posts}" var="dto">
		        <tr>
		            <td scope="row">${dto.sId}</td>
		            <td>${dto.sCategory}</td>
		            <td><a href="/itemView?sId=${dto.sId}">${dto.sTitle}</a></td>
		            <td>${dto.sMoney}</td>
		            <td>
						<form action="/shopModify" id="shopModifyForm_${dto.sId}">
					        <input type='hidden' id="sId" name="sId" value="${dto.sId}">
			            	<button type="submit" class="btn btn-outline-primary" name="shopModifyBtn" id="shopModifyBtn" >수정</button>
						</form>
		            </td>
		            <td style="width: 15%;">
    				 	<form id="shopDeleteForm_${dto.sId}">
			            	<input type='hidden' id="sId" name="sId" value="${dto.sId}">
			            	<button type="button" class="btn btn-outline-primary" name="shopDeleteBtn" id="shopDeleteBtn" onclick="submitDelShop_ajax('${dto.sId}');">삭제</button>
	            		</form>
            		</td>
		        </tr>
		    </c:forEach>
		</tbody>
    </table>
    <div class="holdButton">
    <form action="/paging" method="get">
		<select id="search_type" name="search_type">
			<option value="sCategory">카테고리</option>
			<option value="sTitle">상품명</option>
		</select>
		<input type="hidden" name="pageName" value="${pageName}">
	    <input type="text" name="query" />
	    <input type="submit" class="btn btn-outline-primary" value="검색" />
	</form>&nbsp;
	<form action="/paging" method="get">
		<input type="hidden" name="pageName" value="${pageName}">
	    <input type="submit" class="btn btn-outline-primary" value="전체" />
	</form>
    </div>
	<!-- 페이징 처리 -->
	
	<!-- 처음 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage - 1) < 1}"><a class="page-link">&lt; &lt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=1">&lt; &lt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 이전 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage - 1) < 1}"><a class="page-link">&lt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${page.curPage - 1}">&lt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 개별 페이지 -->
	<c:forEach var="fEach" begin="${page.startPage}" end="${page.endPage}" step="1">
	<li class="page-item">
	    <c:choose>
	        <c:when test="${page.curPage == fEach}"><a class="page-link active">${fEach}</a></c:when>
	        <c:otherwise><a class="page-link" href="/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${fEach}">${fEach}</a></c:otherwise>
	    </c:choose>
    </li>
	</c:forEach>
	<!-- 다음 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage + 1) > page.totalPage}"><a class="page-link">&gt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${page.curPage + 1}">&gt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 끝 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${page.curPage == page.totalPage}"><a class="page-link">&gt;&gt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${page.totalPage}">&gt;&gt;</a></c:otherwise>
	</c:choose>
	</li>
  </ul>
</nav>
<jsp:include page="../main/footer.jsp"></jsp:include>

</div>
</body>
</html>
