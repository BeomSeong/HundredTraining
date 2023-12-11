<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;
  font-family: 'Poppins', sans-serif;
}

.wrapper{
  background: #171c24;
  position: fixed;
  width:65%;
}
.bar{
  background: rgb(34, 150, 243);
  width:100%;
}
.bar nav{
  position: relative;
  display: flex;
  max-width: calc(100% - 100px);
  margin: 0 auto;
  height: 80px;
  align-items: center;
  justify-content: space-between;
}

/* Dropdown Button */
.dropbtn {
  background-color: rgb(34, 150, 243);
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: rgb(34, 150, 243);
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  align-items: center;
}

.logo a{
  display:flex;
  align-items: center;
  color: #fff;
  font-size: 30px;
  font-weight: 600;
}

.shop a{
  display:flex;
  align-items: center;
  color: white;
  font-size: 16px; /* 원하는 크기로 조절 */
  font-weight: 600;
  text-decoration: none; /* 밑줄 제거 */
}

/* Links inside the dropdown */
.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  position: relative;
}
/* 밑줄 스타일 추가 */
.dropdown-content a::after {
  content: '';
  position: absolute;
  width: 100%;
  height: 2px;
  background: white; /* 밑줄 색상 설정 */
  bottom: 0;
  left: 0;
  transform: scaleX(0); /* 초기에는 밑줄이 안 보이도록 설정 */
  transform-origin: bottom right;
  transition: transform 0.3s ease; /* 부드러운 애니메이션을 위한 트랜지션 추가 */
}

/* 마우스 오버 시 밑줄 표시 */
.dropdown-content a:hover::after {
  transform: scaleX(1);
  transform-origin: bottom left;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: rgb(34, 150, 243);}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: rgb(34, 150, 243);}
</style>
<script>
function logout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "/logout";
    }
}
</script>
</head>
<body>

<div class="bar">
		<nav>
			<div class="logo"><a href="/Main"><img src="/logo/브랜드로고.png" width="100" height="70"></a></div>
			<div class="dropdown">
			  <a href="/FirTraining"><button class="dropbtn">운동정보</button></a>
			  <div class="dropdown-content">
			    <a href="/FirTraining">팔굽혀펴기</a>
			    <a href="/SecTraining">윗몸일으키기</a>
			    <a href="/ThiTraining">풀업/친업</a>
			    <a href="/FourTraining">달리기</a>
			  </div>
			</div>
				<div class="dropdown">
			  <a href="/fBoardList"><button class="dropbtn">커뮤니티</button></a>
			  <div class="dropdown-content">
			    <a href="/fBoardList">자유게시판</a>
			    <a href="/mapview">헬스장찾기</a>
			  </div>
			</div>
				<div class="dropdown">
			  <a href="/myRecord?mId=<%= session.getAttribute("mId") %>"><button class="dropbtn">회원정보</button></a>
			  <div class="dropdown-content">
			  	<%if(session.getAttribute("mId") != null) { %>
			    <a href="/myRecord?mId=<%= session.getAttribute("mId") %>">나의기록</a>
   			    <a href="/paging?pageName=myShop">구매내역</a>
				<a href="/paging?pageName=myBoard">작성글</a>
			    <a href="/paging?pageName=myComment">작성댓글</a>
			    <a href="/change">회원정보수정</a>
			    <%} else if (session.getAttribute("mId") == null) {%>
			    <a href="/login">나의기록</a>
			    <a href="/login">구매내역</a>
			    <a href="/login">작성글</a>
			    <a href="/login">작성댓글</a>
			    <a href="/login">회원정보수정</a>
			    <%} %>
			  </div>
			</div>
			<div class="shop"><a href="/shopview">SHOP</a></div>
			<% if(session.getAttribute("mId") == null) { %>
			    <a href="/login"><img src="/images/login.png" width="70" height="70"></a>
			<% } else { %>
			    <a href="javascript:logout()"><img src="/images/logout.png" width="70" height="70"></a>
			<% } %>
		</nav>
	</div>
</body>
</html>