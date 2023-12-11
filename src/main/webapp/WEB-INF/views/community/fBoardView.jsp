<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training:BoardView</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>


<style>
#commentInsertForm {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.mo {
   border-collapse: separate;
   border-spacing: 10px 10px;
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
    width: 550px;
    height: 400px;
    position: relative;
    top: -30px;
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

.button-container {
    display: flex;
    gap: 10px;
}

tr, td {
	text-align: center;
}
</style>



<script>
// 이미지 있는 페이지 이미지 보이게 처리
$(document).ready(function() {
	var checking = "${post.fFilename}";
	
	console.log(checking);
	if(checking != ""){
		$("#imgshow").show();
	}
});



//페이지 내에서 추천, 비추천 업데이트
function goodBadRefresh(goodOrBad, cancel) {
	var totalLikeCount = document.querySelector('#totalLikeCount');
	var goodCount = document.querySelector('#goodCount');
	var badCount = document.querySelector('#badCount');
	
	if (cancel == "selectCancel"){
		if (goodOrBad == "good"){
			goodCount.innerText = Number(goodCount.innerText) - 1;
			totalLikeCount.innerText = Number(totalLikeCount.innerText) - 1;
		} else if (goodOrBad == "bad"){
			badCount.innerText = Number(badCount.innerText) - 1;
			totalLikeCount.innerText = Number(totalLikeCount.innerText) + 1;
		}
	} else{
		if (goodOrBad == "good"){
			goodCount.innerText = Number(goodCount.innerText) + 1;
			totalLikeCount.innerText = Number(totalLikeCount.innerText) + 1;
			
		} else if (goodOrBad == "bad"){
			badCount.innerText = Number(badCount.innerText) + 1;
			totalLikeCount.innerText = Number(totalLikeCount.innerText) - 1;
		}
	}
}

// 게시물 삭제
function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/deletePost',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
	            window.location.replace("/fBoardList");
			} else {
				alert(result.desc)
			}
		}
	});
}

/* function modify_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/modifyPost',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
	            window.location.replace("/fBoardList");
			} else {
				alert(result.desc)
			}
		}
	});
} */

// 추천, 비추천 비동기 처리
function likePost(goodOrBad) {
	var queryString = $("#likePost_" + goodOrBad).serialize();
	$.ajax({
		url: '/goodBad',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				goodBadRefresh(goodOrBad, result.cancel);
			} else {
				alert(result.desc)
			}
		}
	});
}

// 댓글 작성
function submitComment_ajax() {
	var queryString = $("#commentInsertForm").serialize();
	$.ajax({
		url: '/submitComment',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/fBoardView?fId=${post.fId}");
			} else {
				alert(result.desc);
			}
		}
	});
}
//댓글 삭제
function submitDelComment_ajax(cId) {
	var queryString = $("#commentDeleteForm_" + cId).serialize();
	$.ajax({
		url: '/submitDelComment',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/fBoardView?fId=${post.fId}");
			} else {
				alert(result.desc);
			}
		}
	});
}
function submitReport_ajax() {
	var queryString = $("#report_frm").serialize();
	$.ajax({
		url: '/submitReport',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("/fBoardView?fId=${post.fId}");
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
	
	<h3 align="right">
        <label>조회수: ${post.fHit}</label>
        추천수: <label id="totalLikeCount">${post.totalLikeCount}</label>
        댓글수: <label id="commentCount">${post.commentCount}</label>
        신고수: <label id="reportCount">${post.reportCount}</label>
	</h3>
	
    <h2>제목: ${post.fTitle}</h2>
	
	<hr>
	
	<h2>
       	<label>작성자: ${post.mNick}</label>
    </h2>
       
    <hr>
       
    <h2>
   		<label>작성일: <fmt:formatDate value="${post.fDate}" pattern="yyyy. M. d. a h:mm:ss"/></label>
	</h2>
	
	<hr>     

    <h2>
   		<img id="imgshow" src="/images/boardImg/${post.fFilename}" style="display: none;"><br>
     	내용 : ${post.fContent}
    </h2>

	<hr>
	
    <%if (session.getAttribute("mId") != null) {%>
	<div id="container" align="right">
			    <!-- <button><a href="/fBoardModify">수정</a></button> -->
	   	<c:choose>
			<c:when test="${post.mId == sessionId}">
	            <form id="reg_frm" method="post">
	            	<input type='hidden' name="fId" value="${post.fId}">
	            	<a href="/fBoardModify?fId=${post.fId}"><input type="button" class="btn btn-outline-primary" value="수정"></a>
	            	<input type='button' class="btn btn-outline-primary" value="삭제" onclick="submit_ajax()">
	            </form>
			</c:when>
		</c:choose>
		<br>
        <button id="btn-modal" class="btn btn-outline-primary">신고</button>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>신고</h2>
            </div>
            <div class="close-area">X</div>
            <form id="report_frm" method="post">
            <input type="hidden" name="mId" value="<%= session.getAttribute("mId") %>">
            <input type="hidden" name="fId" value="${post.fId}">
            <div class="content">	             
           		<table class="mo" width="370" height="200" cellpadding="0" cellspacing="0" border="0">
           			<tr>
	                	<td>			                		
	              			<select id="rCategory" name="rCategory">
							  <option value="카테고리1" selected>카테고리1</option>
							  <option value="카테고리2">카테고리2</option>
							  <option value="카테고리3">카테고리3</option>
							  <option value="카테고리4">카테고리4</option>
							  <option value="카테고리5">카테고리5</option>
							</select>
	                	</td>
	                </tr>
           			<tr>
        				<td>
	               			 <textarea rows="1" cols="60" id="rTitle"  style="font-size:16px;" name="rTitle" placeholder="10자 이내로 입력하세요." maxlength = "10"></textarea>
   	                	</td>
 	                </tr>
	                <tr>
	                	<td>
	               			 <textarea rows="5" cols="60" id="rContent"  style="font-size:16px;" name="rContent" placeholder="50자 이내로 입력하세요." maxlength = "50"></textarea>
   	                	</td>
	                </tr>
           			<tr>
	                	<td>
	                		<input type="button" value="신고하기" class="b1" onclick="submitReport_ajax()">
   	                	</td>
	                </tr>			          
                </table>                
            </div>
            </form>
        </div>
    </div>

    <%} %>
	<div class="button-container" style="display: flex; justify-content: center;">
  			<form id="likePost_good" method="post">
     				<input type="hidden" name="fId" value="${post.fId}">
     				<input type="hidden" name="mId" value="<%= session.getAttribute("mId") %>">
     				<input type="hidden" name="goodBad" value="good">
     		<button onclick="likePost('good')"><img src="/images/추천.png" width="100px" height="100px"></button>
     		
	    </form>
	    
	    <form id="likePost_bad">
	    	<input type="hidden" name="fId" value="${post.fId}">
   				<input type="hidden" name="mId" value="<%= session.getAttribute("mId") %>">
   				<input type="hidden" name="goodBad" value="bad">
	    	<button onclick="likePost('bad')"><img src="/images/비추천.png" width="100px" height="100px"></button>
	    	
	    </form>	
	    
	</div>
	<div class="button-container" style="display: flex; justify-content: center; gap: 100px;">
		<label id="goodCount">${post.goodCount}</label>
		<label id="badCount">${post.badCount}</label>
	</div>
	<div align="right">
		<a href="/fBoardList?search_type=${search_type}&best=${best}&query=${query}&page=${fEach}"><button class="btn btn-outline-primary">목록보기</button></a>
   	</div>
   	
   	<hr>
   	<h1 align="center">댓 글</h1>
   	
   	<div>
       	<input type="hidden" value="<%= session.getAttribute("mNick") %>">
    </div>

	<table class="table table-striped table-hover">
		<colgroup> 
			<col style="width: 10%">
			<col style="width: 15%">
			<col style="width: 40%">
			<col style="width: 25%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<th scope="col">번호</th>
			<th scope="col">작성자</th>
			<th scope="col">내용</th>
			<th scope="col">작성일</th>
			<th scope="col">처리</th>
		</thead>
		<tbody class="table-group-divider">
			<c:forEach items="${comments}" var="dto">
				<tr>
					<td scope="row">${dto.cId}</td>
					<td>${dto.mNick}
						<c:choose>
							<c:when test="${dto.mId == post.mId && dto.cContent != '삭제된 댓글입니다.'}">
								(작성자)
							</c:when>
						</c:choose>
					</td>
					<td>${dto.cContent}</td>
					<td>${dto.cDate}</td>
					<td>
						<c:choose>
							<c:when test="${dto.mId == sessionId && dto.cContent != '삭제된 댓글입니다.'}">
								<form id="commentDeleteForm_${dto.cId}">
									<input type="hidden" id="cId" name="cId" value="${dto.cId}">
									<button type="button" class="btn btn-outline-primary" name="commentDeleteBtn" id="commentDeleteBtn" 
									onclick="submitDelComment_ajax('${dto.cId}');">삭제</button>
								</form>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
    <div class="commentInsertForm">
        <form id="commentInsertForm">
        	<input type="hidden" id="mId" name="mId" value="<%= session.getAttribute("mId") %>"><br>
          	<input type="hidden" id="fId" name="fId" value="${post.fId}">
        	<div class="button-container">
	        	<textarea id="cContent" name="cContent" maxlength = "100" placeholder="50자 이내로 댓글을 작성하세요." style="height:60px; width:800px;"></textarea>
	          	<button type="button" class="btn btn-outline-primary" name="commentInsertBtn" id="commentInsertBtn"
	          	 onclick="submitComment_ajax();">등록</button>
      		</div>
      	</form>
    </div>

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
  
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>