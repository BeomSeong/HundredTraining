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

.holdButton {
	display: flex;
}

body {
  font-family: Arial, sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.left-align {
  align-self: flex-start;
}
h2 {
  color: #333;
}
table {
  width: 100%;
  border-collapse: collapse;
}
table, th, td {
  border: 1px solid #ddd;
  padding: 8px;
}
th {
  background-color: #f2f2f2;
  color: black;
}


#modal.modal-overlay {
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
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 1);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    z-index: 1050;
}
#modal .modal-window {
    background: rgba( 69, 139, 197, 0.70 );
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 700px;
    height: 500px;
    position: relative;
    top: -30px;
    padding: 10px;
}
#modal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
    
}
#modal .title h2 {
    display: inline;
}
#modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

.dp {
	display:flex;
}


</style>

<script>
function check_ajax(rId) {
	var queryString = $("#reportCheck_" + rId).serialize();
	console.log("맨위")
	$.ajax({
		url: '/reportCheck',
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

function noCheck_ajax(rId) {
    var queryString = $("#reportNoCheck_" + rId).serialize();
    $.ajax({
        url: '/reportNoCheck',
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
	<h1 align="center">신고 관리</h1>
	<hr>
	
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col" >번호</th>
                <th scope="col" >신고자</th>
                <th scope="col" >카테고리</th>
                <th scope="col" >제목</th>
                <th scope="col" >내용</th>
                <th scope="col" >신고일자</th>
                <th scope="col" >처리 상태</th>
            </tr>
        </thead>
        <tbody class="table-group-divider">
   		    <c:forEach items="${posts}" var="dto" >
		        <tr>
		            <td scope="row">${dto.rId}</td>
		            <td>${dto.mId}</td>
		            <td>${dto.rCategory}</td>
		            <td>
			            <div class="dp" id="container">
			            ${dto.rTitle}
			            <a id="btn-modal" style="color:blue; cursor:pointer;">
				        	(상세보기)
		        		</a>
					    </div>
					    <div id="modal" class="modal-overlay">
					        <div class="modal-window">
					            <div class="title">
					                <h2>신고내용</h2>
					            </div>
					            <div class="close-area">X</div>
					            <div class="content">	             
					           		<table width="370" height="200" cellpadding="0" cellspacing="0" border="0">
					           			<tr>
					           				<td> 카테고리 : </td>
						                	<td>			                		
						                		<input type="text" value="${dto.rCategory}" disabled>
						                	</td>
						                </tr>
					           			<tr>
					           				<td> 제목 : </td>
						                	<td>
						               			 <input type="text" value="${dto.rTitle}" disabled>
					   	                	</td>
						                </tr>
					           			<tr>
						                	<td> 내용 : </td>
						                	<td>
						                		<textarea rows="10" cols="60" style="font-size:16px;"
						               			 		   placeholder="${dto.rContent}" disabled></textarea>
					   	                	</td>
						                </tr>			          
					                </table>                
					            </div>
					        </div>
					    </div>				    
				    </td>
		            <td>${dto.rContent}</td>
		            <td><fmt:formatDate value="${dto.rDate}" pattern="yyyy. M. d. a h:mm:ss"/></td>
       				<td>
     					<fieldset>
			                    <form id="reportNoCheck_${dto.rId}" method="post">
			                        <input type="hidden" name="rId" value="${dto.rId}">
			                        <input type="hidden" name="rStatus" value="${dto.rStatus}">
			                        
			                        <c:if test="${dto.rStatus eq 'Check'}">
			                            <input type="checkbox" 
			                                   checked
			                                   value="${dto.rStatus}"
			                                   onclick="noCheck_ajax('${dto.rId}');" 
			                            >
			                            <span>확인</span>
			                        </c:if>
			                    </form>
				                <form id="reportCheck_${dto.rId}" method="post">   
  			                        <input type="hidden" name="rId" value="${dto.rId}">
			                        <input type="hidden" name="rStatus" value="${dto.rStatus}"> 

			                        <c:if test="${dto.rStatus ne 'Check'}">
			                            <input role="switch" type="checkbox" 
			                                   value="${dto.rStatus}"
			                                   onclick="check_ajax('${dto.rId}');" 
			                            >
			                            <span>미확인</span>
			                        </c:if>
			                    </form> 
			            </fieldset>
       				</td>
		        </tr>
		    </c:forEach>

        </tbody>
    </table>
    <div class="holdButton">
    <form action="/paging" method="get">
		<select id="search_type" name="search_type">
			<option value="mId">신고자</option>
			<option value="rCategory">카테고리</option>
			<option value="rTitle">제목</option>
			<option value="rContent">내용</option>
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
		    <script>
			    function modalOn(rId) {
			        const modal = document.getElementById("modal_" + rId);
			        modal.style.display = "flex";
			    }
			
			    // 나머지 스크립트 부분은 그대로 유지합니다.
			</script>
<script>
    const modal = document.getElementById("modal")
    function modalOn() {
        modal.style.display = "flex"
    }
    function isModalOn() {
        return modal.style.display === "flex"
    }
    function modalOff() {
        modal.style.display = "none"
    }
    const btnModal = document.getElementById("btn-modal")
    btnModal.addEventListener("click", e => {
        modalOn()
    })
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modalOff()
    })
    modal.addEventListener("click", e => {
        const evTarget = e.target
        if(evTarget.classList.contains("modal-overlay")) {
            modalOff()
        }
    })
    window.addEventListener("keyup", e => {
        if(isModalOn() && e.key === "Escape") {
            modalOff()
        }
    })
</script>
</body>
</html>
