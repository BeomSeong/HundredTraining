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
            overflow-y: scroll;
        }


        .header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .form-container {
            border: 1px solid #000;
            margin: 20px;
            box-sizing: border-box;
            display: flex;
            height: 400px;
        }

        .form-container img {
            width: 50%;
            height: 100%;
            object-fit: cover;
        }

        .product-info {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-description {
            flex: 1;
            margin-top: 20px;
            padding: 20px;
        }

        .buy-button {
            align-self: flex-end;
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            border-radius: 5px;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .delivery-info {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #000;
        }

        .delivery-info input {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
    <script>
        // JavaScript로 바로 구매 정보 전달
        $(document).ready(function () {
            $('#buyForm').submit(function (e) {
                e.preventDefault();
                var form = $(this);
                var sId = form.find('#sId').val();
                var sTitle = form.find('#sTitle').val();
                var sMoney = form.find('#sMoney').val();
                var quantity = form.find('#quantity').val();
                var totalPrice = Number(sMoney*quantity);
                var sFilepath = form.find('#sFilepath').val();
                window.location.href = "/itemBuy?sId=" + sId + "&sTitle=" + sTitle + "&totalPrice=" + totalPrice + "&sFilepath=" + sFilepath + "&quantity=" + quantity;
            });
        });

        // 수량 조절 및 가격 업데이트
        function updatePrice() {
            var quantity = document.getElementById('quantity').value;
            var unitPrice = ${product.sMoney}; // 상품의 단가
            var totalPrice = quantity * unitPrice;

            // 가격 업데이트
            document.getElementById('totalPriceDisplay').innerHTML = '<h2 style="text-align: center;">총 가격: ' + totalPrice + ' 원</h2>';
        }
    </script>
</head>
<body>
    <div class="container">
    <jsp:include page="../main/header.jsp"></jsp:include>

        <div class="form-container">
            <img id="productImage" src="${pageContext.request.contextPath}${product.sFilepath}" alt="상품 이미지">
            <div class="product-info">
                <div>
                    <h2 style="text-align: left;">상품명: ${product.sTitle}</h2>
                </div>
                <form id="buyForm" action="/itemBuy" method="post">
	                <input type="hidden" id="sId" name="sId" value="${product.sId}">
	                <input type="hidden" id="sTitle" name="sTitle" value="${product.sTitle}">
	                <input type="hidden" id="sMoney" name="sMoney" value="${product.sMoney}">
	                <input type="hidden" id="sFilepath" name="sFilepath" value="${product.sFilepath}">
	
	                <label for="quantity">수량:</label>
	                <input type="number" id="quantity" name="quantity" value="1" min="1" max="99" onchange="updatePrice()">
	
	                <div id="totalPriceDisplay">
	                    <h2 style="text-align: center;">총 가격: ${product.sMoney} 원</h2>
	                </div>
	
	                <input type="submit" class="buy-button" value="바로 구매">
	            </form>
            </div>
        </div>
        <div class="product-description">
            <h2>상세 설명</h2>
            <p>${product.sContent}</p>
        </div>

    <jsp:include page="../main/footer.jsp"></jsp:include>
    </div>
</body>
</html>
