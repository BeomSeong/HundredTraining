<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column; /* 수직 정렬을 위한 설정 */
        }
        form {
            text-align: center;
        }
        h1 {
            font-size: 72px; /* 1.5배 크기로 조정 (원하는 크기로 조절 가능) */
            margin-bottom: 60px; /* 1.5배 크기로 조정 (원하는 마진으로 조절 가능) */
            margin-top: 0; /* 맨 위에 배치 */
        }
        .form-group {
            display: flex;
            align-items: center;
            justify-content: space-between; /* 좌우 정렬 설정 */
            width: 600px; /* 폼 그룹의 고정 너비 지정 */
            margin-bottom: 45px; /* 간격 늘리기 (원하는 간격으로 조절 가능) */
        }
        .label-box {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            width: 200px; /* 레이블 박스의 너비 지정 */
            padding: 25px;
        }
        label {
            font-size: 20px; /* 1.5배 크기로 조정 (원하는 크기로 조절 가능) */
        }
        input {
            width: 300px; /* 입력란의 너비를 조절 */
            padding: 30px; /* 패딩값을 조절 */
        }
        button {
        	font-size: 20px;
            width: 300px; /* 버튼의 너비를 조절하세요 */
            padding: 25px; /* 패딩값을 조절하세요 */
        }
        .confirm-button {
            display: flex;
            justify-content: center; /* 가운데 정렬 설정 */
            align-items: center;
            width: 100%; /* 버튼을 폼 그룹 너비와 일치시킵니다 */
        }
    </style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
    <h1>비밀번호 찾기</h1>
    <form>
        <div class="form-group">
            <div class="label-box">
                <label for="memId">아이디</label>
            </div>
            <input type="text" id="memId" name="memId">
        </div>
        <div class="form-group">
            <div class="label-box">
                <label for="mPhone">핸드폰 번호</label>
            </div>
            <input type="text" id="mPhone" name="mPhone">
            <button id="sendVerificationCode" onclick="sendVerificationCode(); return false;">인증번호 받기</button>
        </div>
        <div class="form-group">
            <label for="verificationCode"></label>
            <input type="text" id="verificationCode" name="verificationCode">
            <button id="verifyCode" onclick="verifyCode(); return false;">인증 확인</button>
        </div>
        <div class="form-group">
            <button type="button" id="confirmButton" class="confirm-button" onclick="confirmAction();">확인</button>
        </div>
    </form>

    <script>
        function sendVerificationCode() {
            // 여기에서 인증번호를 전송하는 JavaScript 함수를 호출하세요.
        }
        
        function verifyCode() {
            // 여기에서 입력한 인증번호를 서버로 전송하고 확인하는 JavaScript 함수를 호출하세요.
        }

        function confirmAction() {
            // 여기에서 확인 작업을 처리하는 JavaScript 함수를 구현하세요.
        }
    </script>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
