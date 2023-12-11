<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training:Board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/path/to/common.css">

<style>
    body {
        width: 100%;
    }

    .left-align {
        margin: 20px; /* 좌우 여백을 조정합니다. */
    }

    table {
        width: 100%;
        margin-top: 20px; /* 테이블 상단 여백을 추가합니다. */
    }

    th, td {
        text-align: center;
        padding: 10px; /* 셀 내부 패딩을 조정합니다. */
    }

    .buttom_search_wrap {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px; /* 검색 및 글쓰기 부분과의 간격을 조정합니다. */
    }

    .select_box, .select_box select {
        width: auto; /* 선택 상자의 너비를 조정합니다. */
    }

    .pagination {
        text-align: center;
        margin-top: 20px; /* 페이지네이션과 상단 간격을 조정합니다. */
    }
    
    .button-container {
    	display: flex;
    }
</style>
</head>
<body>
<div class="container">
	<jsp:include page="../main/header.jsp"></jsp:include>
	
		<hr>
		<h1 style=text-align:center;>자유게시판</h1>
		<hr>
		
		<div class="btn-group" role="group" aria-label="Basic outlined example">
			<form action="/fBoardList" method="get">
			    <button type="submit" class="btn btn-outline-primary" name="all" value="all">전체</button>
			</form>&nbsp;
			<form action="/fBoardList" method="get">
				<input type="hidden" name="query" value="${query}"/>
				<input type="hidden" name="search_type" value="${search_type}"/>
			    <button type="submit" class="btn btn-outline-primary" name="best" value="best">베스트</button>
			</form>
		</div><br><p></p>
		<form action="/fBoardList" method="get">
	        <select name="count" id="sarray_numbers" onchange="this.form.submit()">
	            <option value="10" ${page.listCount == 10 ? 'selected' : ''}>게시글 10개</option>
	            <option value="20" ${page.listCount == 20 ? 'selected' : ''}>게시글 20개</option>
	            <option value="30" ${page.listCount == 30 ? 'selected' : ''}>게시글 30개</option>
	        </select>
	    </form>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">추천수</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
		    <c:forEach var="post" items="${posts}">
		        <tr>
		            <td scope="row">${post.fId}</td>
		            <td><a href="/fBoardView?search_type=${search_type}&best=${best}&query=${query}&page=${fEach}&fId=${post.fId}">${post.fTitle}&nbsp;[ ${post.commentCount} ]</a></td>
		            <td>${post.mNick}</td>
		            <td><fmt:formatDate value="${post.fDate}" pattern="yyyy. M. d. a h:mm:ss"/></td>
		            <td>${post.fHit}</td>
		            <td>${post.totalLikeCount}</td>
		        </tr>
		    </c:forEach>
		</tbody>
	</table>
	<div>
	
	<div class="button-container">
		<form action="/fBoardList" method="get">
			<select id="search_type" name="search_type">
				<option value="fTitle">제목</option>
				<option value="mNick">작성자</option>
			</select>
			<input type="hidden" name="best" value="${best}"/>
		    <input type="text" name="query" />
		    <input type="submit" class="btn btn-outline-primary" value="검색" />
		</form>&nbsp;
		<a href="/fBoardWrite"><button type="button" style="float:right;" class="btn btn-outline-primary" onclick="">글쓰기</button></a>
	</div>
	
	
	
	<!-- 페이징 처리 -->
	
	<!-- 처음 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage - 1) < 1}"><a class="page-link">&lt; &lt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/fBoardList?best=${best}&search_type=${search_type}&query=${query}&page=1">&lt; &lt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 이전 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage - 1) < 1}"><a class="page-link">&lt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/fBoardList?best=${best}&search_type=${search_type}&query=${query}&page=${page.curPage - 1}">&lt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 개별 페이지 -->
	<c:forEach var="fEach" begin="${page.startPage}" end="${page.endPage}" step="1">
	<li class="page-item">
	    <c:choose>
	        <c:when test="${page.curPage == fEach}"><a class="page-link active">${fEach}</a></c:when>
	        <c:otherwise><a class="page-link" href="/fBoardList?best=${best}&search_type=${search_type}&query=${query}&page=${fEach}">${fEach}</a></c:otherwise>
	    </c:choose>
    </li>
	</c:forEach>
	<!-- 다음 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${(page.curPage + 1) > page.totalPage}"><a class="page-link">&gt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/fBoardList?best=${best}&search_type=${search_type}&query=${query}&page=${page.curPage + 1}">&gt;</a></c:otherwise>
	</c:choose>
	</li>
	<!-- 끝 -->
	<li class="page-item">
	<c:choose>
	    <c:when test="${page.curPage == page.totalPage}"><a class="page-link">&gt;&gt;</a></c:when>
	    <c:otherwise><a class="page-link" href="/fBoardList?best=${best}&search_type=${search_type}&query=${query}&page=${page.totalPage}">&gt;&gt;</a></c:otherwise>
	</c:choose>
	</li>
  </ul>
</nav>
	<br>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>