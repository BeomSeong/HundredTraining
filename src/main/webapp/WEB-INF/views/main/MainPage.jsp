<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/darkpan-1.0.0/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/darkpan-1.0.0/js/bootstrap.min.js"></script>
-->
<style>
	body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        margin: 0 auto;
        max-width: none; /* max-width를 무시하도록 이 줄을 추가하세요 */
    }
    .carousel-item img {
        width: 100%;
        height: 400px; /* 이미지 높이 조절 */
        object-fit: cover;
    }

    .product-container, .best-post {
        text-align: center;
        margin-top: 20px;
        transition: transform 0.3s ease-in-out;
    }

    .product-container:hover, .best-post:hover {
        transform: scale(1.05);
        z-index: 1;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }

    .product-image {
        width: 100%;
        height: 200px; /* 이미지 높이 조절 */
        object-fit: cover;
        border-radius: 5px;
    }

    .product-info {
        margin-top: 10px;
    }
    
    .recommendation-title {
        text-align: center;
        font-size: 40px;
        color: #333;
        margin-bottom: 30px;
        font-weight: bold;
    }

    /* 수정된 스타일 */
    .recommendation-heading {
        font-size: 28px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }
    .product-title {
        font-size: 20px; /* 상품명 사이즈 조절 */
        margin-bottom: 5px;
    }
    
    .best-posts-container {
        border: 2px solid #000;
        padding: 20px;
        border-radius: 10px;
        margin-top: 20px;
    }

    .best-post {
        border: 2px solid #ddd;
        margin-bottom: 20px;
        padding: 10px;
        border-radius: 10px;
        cursor: pointer;
        transition: transform 0.3s ease-in-out;
    }
    .best-post:hover {
        transform: scale(1.05);
        z-index: 1;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }
    
    .best-post-image {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
</style>
<script>
	function viewProduct(productId) {
	    window.location.href = "/itemView?sId=" + productId;
	}
</script>
<script>
    function viewBestPost(postId) {
        window.location.href = "/fBoardView?fId=" + postId;
    }
</script>

</head>
<body>
<div class="container">
<jsp:include page="header.jsp"></jsp:include>

<br>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/main/image1.jpg" class="d-block w-100" alt="첫 번째 이미지">
    </div>
    <div class="carousel-item">
      <img src="/main/image2.jpg" class="d-block w-100" alt="두 번째 이미지">
    </div>
    <div class="carousel-item">
      <img src="/main/image3.jpg" class="d-block w-100" alt="세 번째 이미지">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<br>

<div class="row">
            <div class="col-md-6" style="border: 2px solid #000; padding: 20px; border-radius: 10px;">
			    <h1 class="recommendation-title">BEST 게시물</h1>
			    <c:forEach var="topPost" items="${topRecommendedPosts}">
			        <div class="best-post row" onclick="viewBestPost(${topPost.fId})">
					    <div class="col-md-6">
					        <h3 class="product-info product-title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${topPost.fTitle}</h3>
					    </div>
					    <div class="col-md-3 text-center">
					        <p class="product-info">작성자: ${topPost.mNick}</p>
					    </div>
					    <div class="col-md-3 text-right">
					        <p class="product-info">추천수: ${topPost.totalLikeCount}</p>
					    </div>
					</div>
			    </c:forEach>
            </div>
            <div class="col-md-6" style="border: 2px solid #000; padding: 20px; border-radius: 10px;">
			    <h1 class="recommendation-title">추천 상품</h1>
			    <h2 class="recommendation-heading">이 상품들을 놓치지 마세요!</h2>
			    <div class="row">
			        <c:forEach var="product" items="${randomProducts}">
			            <div class="col-md-6 product-container" onclick="viewProduct(${product.sId})" style="border: 2px solid #ddd; margin-bottom: 20px; padding: 10px; border-radius: 10px; cursor: pointer;">
			                <img src="${pageContext.request.contextPath}${product.sFilepath}" alt="상품 이미지" class="product-image" style="width: 100%; height: 150px; object-fit: cover; border-radius: 5px;">
			                <h3 class="product-info product-title" style="margin-top: 10px; font-size: 18px; font-weight: bold;">${product.sTitle}</h3>
			                <p class="product-info" style="font-size: 16px; margin-bottom: 5px;">가격: ${product.sMoney}</p>
			            </div>
			        </c:forEach>
			    </div>
			</div>
        </div>

<br><br>

<jsp:include page="footer.jsp"></jsp:include>

</div>
</body>
</html>