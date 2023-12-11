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
  font-size: 30px;
  font-weight: 600;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

#t {
	text:15px;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: rgb(34, 150, 243);}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: rgb(34, 150, 243);}
</style>
</head>
<body>

<div class="bar">
	<nav>
		<a href="/paging?pageName=admin/hMember"><button class="dropbtn">회원관리</button></a>
		<div class="dropdown">
			<a href="/paging?pageName=admin/hBoardView"><button class="dropbtn">게시글관리</button></a>
			<div class="dropdown-content">
				<a href="/paging?pageName=admin/hBoardView">작성글관리</a>
				<a href="/paging?pageName=admin/hComment">작성댓글 관리</a>
			</div>
		</div>
		<div class="dropdown">
			<a href="/paging?pageName=admin/hShopView"><button class="dropbtn">상품관리</button></a>
			<div class="dropdown-content">
			    <a href="/paging?pageName=admin/hShopView">상품리스트</a>
			    <a href="/hShopInsert">상품등록</a>
			</div>
		</div>
		<a href="/paging?pageName=admin/hReport"><button class="dropbtn">신고관리</button></a>
		<a href="/Main"><button class="dropbtn">나가기</button></a>
	</nav>
</div>

</body>
</html>