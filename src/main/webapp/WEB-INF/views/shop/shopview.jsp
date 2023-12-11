<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hundred Training</title>
    <script src="http://code.jquery.com/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            overflow-y: scroll;
        }

        .form-container {
            border: 1px solid #000;
            margin: 10px;
            box-sizing: border-box;
            text-align: center;
            width: calc(25% - 20px);
            position: relative;
        }
        
        .form-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .product-image {
            width: 100%;
            height: auto;
            max-width: 100%;
            object-fit: cover;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            height: 50px;
        }

        .shop-container {
            display: flex;
            align-items: center;
            padding: 20px;
            justify-content: space-between;
        }
        
        .shop-container h1 {
            font-size: 2em;
            margin-right: 20px;
        }

        .shop-buttons {
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .shop-buttons button {
            margin-left: 10px;
            font-size: 2em;
        }

        .form-container:hover {
		    transform: scale(1.05);
		    transition: transform 0.3s ease-out;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
		}

        .product-info {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 10px;
            box-sizing: border-box;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .form-container:hover .product-info {
            opacity: 1;
        }

        .product-info h3 {
            font-size: 1.3em;
            margin-bottom: 5px;
            color: #333;
        }

        .product-info p {
            margin: 0;
            font-size: 1em;
            color: #555;
        }
    </style>
    <script>
        function redirectToDetailPage(sId) {
            var itemViewPageUrl = "/itemView?sId=" + sId;
            window.location.href = itemViewPageUrl;
        }

        $(document).ready(function () {
            // 페이지 로딩 시 전체 이미지를 표시합니다.
            $('.form-container').show();

            // 카테고리 버튼 클릭 이벤트 처리
            $('.shop-buttons button').on('click', function () {
                var category = $(this).data('category');

                // 모든 이미지를 숨깁니다.
                $('.form-container').hide();

                // 선택한 카테고리의 이미지만 표시합니다.
                if (category === 'all') {
                    $('.form-container').show();
                } else {
                    $('.' + category).show();
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="../main/header.jsp"></jsp:include>
        <hr>
	    <h1 align="center">SHOP</h1>
	    <hr>
	    <div class="shop-container" style="padding-top: 0px;">
	        <div class="shop-buttons">
			    <button class="btn btn-outline-primary" data-category="all">전체</button>
			    <button class="btn btn-outline-primary" data-category="pushup">푸쉬업</button>
			    <button class="btn btn-outline-primary" data-category="situp">윗몸일으키기</button>
			    <button class="btn btn-outline-primary" data-category="pullup">풀업/친업</button>
			    <button class="btn btn-outline-primary" data-category="running">달리기</button>
			</div>
    </div>
    <div class="form-wrapper">
        <c:forEach var="product" items="${products}">
	        <div class="form-container ${product.sCategory}" onclick="redirectToDetailPage(${product.sId})" style="cursor:pointer;">
			    <div style="position: relative;">
			        <img src="${pageContext.request.contextPath}${product.sFilepath}" alt="상품 이미지" class="product-image">
			        <div class="product-info">
			            <h3>${product.sTitle}</h3>
			            <p>\ ${product.sMoney}원</p>
			        </div>
			    </div>
		    </div>
		</c:forEach>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>
