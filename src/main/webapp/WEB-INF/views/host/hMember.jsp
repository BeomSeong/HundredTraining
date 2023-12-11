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
<style>
body {
    width: 100%;
    height: 100%;
}
tr, td {
    text-align: center;
}

label {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
}

[type="checkbox"] {
  appearance: none;
  position: relative;
  border: max(2px, 0.1em) solid gray;
  border-radius: 1.25em;
  width: 2.25em;
  height: 1.25em;
}

[type="checkbox"]::before {
  content: "";
  position: absolute;
  left: 0;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  transform: scale(0.8);
  background-color: gray;
  transition: left 250ms linear;
}

[type="checkbox"]:checked {
  background-color: tomato;
  border-color: tomato;
}

[type="checkbox"]:checked::before {
  background-color: white;
  left: 1em;
}

[type="checkbox"]:disabled {
  border-color: lightgray;
  opacity: 0.7;
  cursor: not-allowed;
}

[type="checkbox"]:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) solid tomato;
}

[type="checkbox"]:enabled:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
}

[type="checkbox"]:checked::before {
  background-color: white;
  left: 1em;
}

[type="checkbox"]:checked {
  background-color: tomato;
  border-color: tomato;
}

.holdButton {
	display: flex;
}


</style>

<script>
function ban_ajax(mId) {
	var queryString = $("#memberBanInsert_" + mId).serialize();
	console.log("맨위")
	$.ajax({
		url: '/memberBanInsert',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			console.log("아래")
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${fEach}");
			} else {
				alert(result.desc);
			}
		}
	});
}

function noBan_ajax(mId) {
    var queryString = $("#memberBanDelete_" + mId).serialize();
    $.ajax({
        url: '/memberBanDelete',
        type: 'POST',
        data: queryString,
        dataType: 'text',
        success: function (json) {
            var result = JSON.parse(json);
            if (result.code == "success") {
                alert(result.desc)
                window.location.replace("/paging?pageName=${pageName}&search_type=${search_type}&query=${query}&page=${fEach}");
            } else {
                alert(result.desc);
            }
        }
    });
}

function admin_ajax(mId) {
	var queryString = $("#memberAdminInsert_" + mId).serialize();
	$.ajax({
		url: '/memberAdminInsert',
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

function noAdmin_ajax(mId) {
    var queryString = $("#memberAdminDelete_" + mId).serialize();
    $.ajax({
        url: '/memberAdminDelete',
        type: 'POST',
        data: queryString,
        dataType: 'text',
        success: function (json) {
            var result = JSON.parse(json);
            if (result.code == "success") {
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
	<h1 align="center">회원 관리</h1>
	<hr>
	
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">회원번호</th>
                <th scope="col">닉네임</th>
                <th scope="col">이메일</th>
                <th scope="col">회원정지</th>
                <th scope="col">관리자지정</th>
            </tr>
        </thead>
        
        <tbody class="table-group-divider">
            <c:forEach items="${posts}" var="dto" varStatus="loop">
				<tr>
                    <td scpoer="row">${dto.mId}</td>
                    <td>${dto.mNick}</td>
                    <td>${dto.mEmail}</td>
			        <td>
			            <fieldset>
			                <label>
			                    <form id="memberBanDelete_${dto.mId}" method="post">
			                        <input type="hidden" name="mId" value="${dto.mId}">
			                        <input type="hidden" name="mBan" value="${dto.mBan}">
			                        
			                        <c:if test="${dto.mBan eq 'Ban'}">
			                            <input role="switch" type="checkbox" 
			                                   checked
			                                   value="${dto.mBan}"
			                                   onclick="noBan_ajax('${dto.mId}');" 
			                            >
			                            <span>정지</span>
			                        </c:if>
			                    </form>
				                <form id="memberBanInsert_${dto.mId}" method="post">   
  			                        <input type="hidden" name="mId" value="${dto.mId}">
			                        <input type="hidden" name="mBan" value="${dto.mBan}"> 

			                        <c:if test="${dto.mBan ne 'Ban'}">
			                            <input role="switch" type="checkbox" 
			                                   value="${dto.mBan}"
			                                   onclick="ban_ajax('${dto.mId}');" 
			                            >
			                            <span>정상</span>
			                        </c:if>
			                    </form>
			                </label>
			            </fieldset>
			        </td>
			        <td>
			            <fieldset>
			                <label>
			                    <form id="memberAdminDelete_${dto.mId}" method="post">
			                        <input type="hidden" name="mId" value="${dto.mId}">
			                        <input type="hidden" name="mAdmin" value="${dto.mAdmin}">
			                        
			                        <c:if test="${dto.mAdmin eq 'admin'}">
			                            <input role="switch" type="checkbox" 
			                                   checked
			                                   value="${dto.mAdmin}"
			                                   onclick="noAdmin_ajax('${dto.mId}');" 
			                            >
		                            	<span>관리자</span>
			                        </c:if>
			                    </form>
				                <form id="memberAdminInsert_${dto.mId}" method="post">   
  			                        <input type="hidden" name="mId" value="${dto.mId}">
			                        <input type="hidden" name="mAdmin" value="${dto.mAdmin}"> 

			                        <c:if test="${dto.mAdmin ne 'admin'}">
			                            <input role="switch" type="checkbox" 
			                                   value="${dto.mAdmin}"
			                                   onclick="admin_ajax('${dto.mId}');" 
			                            >
			                            <span>회원</span>
			                        </c:if>
			                    </form>
			                </label>
			            </fieldset>
			        </td>      
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="holdButton">
    <form action="/paging" method="get">
		<select id="search_type" name="search_type">
			<option value="mNick">닉네임</option>
			<option value="mEmail">이메일</option>
			<option value="mBan">회원정지</option>
			<option value="mAdmin">관리자</option>
		</select>
		<input type="hidden" name="pageName" value="${pageName}">
	    <input type="text" name="query" />
	    <input type="submit" class="btn btn-outline-primary"  value="검색" />
	</form>&nbsp;
	<form action="/paging" method="get">
		<input type="hidden" name="pageName" value="${pageName}">
	    <input type="submit" class="btn btn-outline-primary"  value="전체" />
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