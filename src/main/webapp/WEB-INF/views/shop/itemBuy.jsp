<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hundred Training</title>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="https://js.tosspayments.com/v1"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    
    <style>
	    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow-y: scroll;
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

        .product-description {
            margin-top: 20px;
            padding: 20px;
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
    function form_check() {
    	   if($('#pname').val().length == 0) {
    	      alert("이름을 입력하세요.");
    	      $('#pname').focus();
    	      return;
    	   }
    	   if($('#paddress').val().length == 0) {
    	      alert("주소를 입력하세요.");
    	      $('#paddress').focus();
    	      return;
    	   }
    	   if($('#pphone').val().length == 0) {
     	      alert("전화번호를 입력하세요.");
     	      $('#pphone').focus();
     	      return;
     	   }
   	   generateOrderId();   
   	}
    
        function submit_ajax(orderId) {
            var queryString = $("#buyForm1").serialize();
            queryString += "&orderId=" + orderId;
            $.ajax({
                url: '/itemBuy',
                type: 'POST',
                data: queryString,
                dataType: 'text',
                success: function (json) {
                    var result = JSON.parse(json);
                    if (result.code == "success") {
                        showTossPayments(orderId);
                        
                    } else {
                        alert(result.desc);
                    }
                }
            });
        }

        function generateOrderId() {
            var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var orderId = '';
            for (var i = 0; i < 10; i++) {
                orderId += characters.charAt(Math.floor(Math.random() * characters.length));
            }
            return submit_ajax(orderId);
        }

        function showTossPayments(orderId) {
            var clientKey = 'test_ck_DpexMgkW36RYEqQPmZMd3GbR5ozO';
            var tossPayments = TossPayments(clientKey);

            var title = document.getElementById("sTitle").value;
            var totalPrice = document.getElementById("totalPrice").value;

            tossPayments.requestPayment('카드', {
                amount: totalPrice,
                orderId: orderId,
                orderName: title,
                successUrl: 'http://ec2-54-180-109-103.ap-northeast-2.compute.amazonaws.com:8081/paging?pageName=myShop"',
                failUrl: 'https://docs.tosspayments.com/guides/payment/test-fail',
            })
            .catch(function (error) {
                if (error.code === 'USER_CANCEL') {
                    // 결제 고객이 결제창을 닫았을 때 에러 처리
                } else if (error.code === 'INVALID_CARD_COMPANY') {
                    // 유효하지 않은 카드 코드에 대한 에러 처리
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function () {
            // 페이지 로드 시 필요한 초기화 코드를 추가할 수 있습니다.
        });
    </script>
</head>

<body>
    <div class="container">
    <jsp:include page="../main/header.jsp"></jsp:include>
        <div class="form-container">
            <img id="productImage" src="${param.sFilepath}" alt="상품 이미지">
            <div class="product-info">
                <h2 style="text-align: left;">상품명: ${param.sTitle}</h2>
                <form id="buyForm" action="/itemBuy" method="post">
                    <input type="hidden" id="totalPrice" name="totalPrice" value="${param.totalPrice}">
                    <!-- 여기서 수량 조절 부분을 삭제 -->
                    <div id="totalPriceDisplay">
                        <h2 style="text-align: center;">총 가격: ${param.totalPrice} 원</h2>
                    </div>
                </form>
            </div>
        </div>

        <div class="product-description">
            <h2>상세 설명</h2>
            <p>${param.sContent}</p>
        </div>

        <div class="delivery-info">
            <h2>배송 정보</h2>
            <form id="buyForm1" method="post">
                <input type="hidden" id="sId" name="sId" value="${param.sId}">
                <input type="hidden" id="mId" name="mId" value="<%=session.getAttribute("mId")%>">
                <input type="hidden" id="sTitle" name="sTitle" value="${param.sTitle}">
                <input type="hidden" id="sMoney" name="sMoney" value="${param.sMoney}">
                <input type="hidden" id="sFilepath" name="sFilepath" value="${param.sFilepath}">
                <input type="hidden" id="quantity" name="quantity" value="${param.quantity}">
                <input type="hidden" id="totalPrice" name="totalPrice" value="${param.totalPrice}">

                <label for="pname">이름</label>
                <input type="text" id="pname" name="pName" pattern="[a-zA-Z가-힣]+" title="한글 또는 영문자만 입력 가능" required>
                
                <label for="paddress">주소</label>
                <input type="text" id="paddress" name="pAddress" pattern="[가-힣0-9\s]+[^0-9]$" title="한글과 숫자만 입력 가능하며, 숫자로만 이루어진 주소는 허용되지 않습니다." required>
                
                <label for="pphone">번호</label>
                <input type="text" id="pphone" name="pPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="전화번호 형식만 입력 가능 (예: 010-1234-5678)" required>

                <button type="button" class="buy-button" value="결제" style="font-size: 20px; font-weight: bold;" onclick="form_check()">결제하기</button>
            </form>
        </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
    </div>
</body>

</html>
