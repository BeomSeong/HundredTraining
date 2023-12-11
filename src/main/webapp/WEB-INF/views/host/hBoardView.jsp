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

.holdButton {
	display: flex;
}

</style>

<script>
function submitDelBoard_ajax(fId) {
	var queryString = $("#boardDeleteForm_" + fId).serialize();
	$.ajax({
		url: '/submitDelBoard',
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
	<h1 align="center">게시글 관리</h1>
	<hr>
	
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">작성자(닉네임)</th>
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
                <th scope="col">추천수</th>
                <th scope="col">삭제</th>
            </tr>
        </thead>
        <tbody class="table-group-divider">
   		    <c:forEach var="post" items="${posts}">
		        <tr>
		            <td scope="row">${post.fId}</td>
		            <td>${post.mNick}</td>
		            <td><a href="/fBoardView?fId=${post.fId}">${post.fTitle}&nbsp;[ ${post.commentCount} ]</a></td>
		            <td><fmt:formatDate value="${post.fDate}" pattern="yyyy. M. d. a h:mm:ss"/></td>
		            <td>${post.fHit}</td>
		            <td>${post.totalLikeCount}</td>
    				<td>
    				 	<form id="boardDeleteForm_${post.fId}">
			            	<input type='hidden' id="fId" name="fId" value="${post.fId}">
			            	<button type="button" name="boardDeleteBtn" id="boardDeleteBtn" class="btn btn-outline-primary" onclick="submitDelBoard_ajax('${post.fId}');">삭제</button>
	            		</form>
		            </td>
		        </tr>
		    </c:forEach>
        </tbody>
    </table>
    <div class="holdButton">
    <form action="/paging" method="get">
		<select id="search_type" name="search_type">
			<option value="mNick">닉네임</option>
			<option value="fTitle">제목</option>
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
	<br>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>
