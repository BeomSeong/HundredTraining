<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<title>CreatePage</title>
<style>
body {
    width: 100%;
    height: 100%;
    overflow-y: scroll;
}
tr, td, h1{
    text-align: center;
}

</style>


</head>

<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>

		<br>
		<hr>
		<h1>내 작성글</h1>
		<hr>
		
	<table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">작성자</th>
                    <th scope="col">제목</th>
                    <th scope="col">날짜</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>

            <tbody class="table-group-divider">
            <c:forEach items="${posts}" var="dto">
				<tr>
                    <td scope="row">${dto.fId}</td>
                    <td>${dto.mNick}</td>
                    <td><c:forEach begin="1" end="${dto.fId}"></c:forEach>
   					<a href="fBoardView?fId=${dto.fId}">${dto.fTitle}</a></td>
                    <td>${dto.fDate}</td>
                    <td>${dto.fHit}</td>
                </tr>
            </c:forEach>
            </tbody>
            
	</table>
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