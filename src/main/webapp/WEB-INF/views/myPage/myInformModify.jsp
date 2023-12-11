<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   int mId = (int)session.getAttribute("mId");
   String memId = (String)session.getAttribute("memId");
   String mNick = (String)session.getAttribute("mNick");
   String mEmail = (String)session.getAttribute("mEmail");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreatePage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>

<style>
    form {
        text-align: center;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-top: 200px;
        margin-bottom: 100px; /* 간격 늘리기 (원하는 간격으로 조절 가능) */
        margin-left: 450px;
    }
    .t1 {
        width: 380px; /* 입력란의 너비를 조절 */
        padding: 30px; /* 패딩값을 조절 */
    }
    
    .reset {
       float: right;
       margin-left: 20px;
    }
    
    .b1{
       float: right;
    }

   table tr td {
    border: 1px solid #dddddd;
   }
   
   h2 {
      text-align: center;
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
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 500px;
            height: 600px;
            position: relative;
            top: -100px;
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

</style>

<script>
function form_check() {
   if($('#memId').val().length < 4) {
      alert("아이디는 4글자 이상이어야 합니다.");
      $('#memId').focus();
      return;
   }
   if($('#mNick').val().length == 0) {
      alert("닉네임은 필수사항입니다.");
      $('#mNick').focus();
      return;
   }
   if($('#mEmail').val().length == 0) {
      alert("메일은 필수사항입니다.");
      $('#mEmail').focus();
      return;
   }
   submit_ajax();   
}

function submit_ajax() {
   var queryString = $("#update").serialize();
   $.ajax({
      url: '/updateMem',
      type: 'POST',
      data: queryString,
      dataType : 'text',
      success: function(json) {
         //console.log(json);
         var result = JSON.parse(json);
         if (result.code=="success") {
            alert(result.desc)
            window.location.replace("/Main");
         } else {
            alert(result.desc);
         }
      }
   });
}

function pwf_check() {
   if($('#mPwd').val().length == 0) {
      alert("비밀번호는 필수사항입니다.");
      $('#mPwd').focus();
      return;
   }
   if($('#mPwd').val().length < 4) {
      alert("비밀번호는 4자리 이상이어야 합니다.");
      $('#mPwd').focus();
      return;
   }
   if($('#mPwd').val() != $('#pw_check').val()) {
      alert("비밀번호가 일치하지 않습니다.");
      $('#pw_check').focus();
      return;
   }
   pw_ajax();   
}

function pw_ajax() {
   var queryString = $("#pw_frm").serialize();
   $.ajax({
      url: '/pwModify',
      type: 'POST',
      data: queryString,
      dataType : 'text',
      success: function(json) {
         //console.log(json);
         var result = JSON.parse(json);
         if (result.code=="success") {
            alert(result.desc)
            window.location.replace("/Main");
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

<table class="table">
   
   <form id="update" method="post">
       <tr>
           <td><h2>아이디</h2></td>
           <td><input type="text" id="memId" name="memId" value="<%= memId %>"></td>
       </tr>
       <tr>
           <td><h2>닉네임</h2></td>
           <td><input type="text" id="mNick" name="mNick" value="<%= mNick %>"></td>
       </tr>
       <tr>
           <td><h2>이메일</h2></td>
           <td>
              <input type="hidden" name="mId" value="<%= mId %>">
              <input type="text" id="mEmail" name="mEmail" value="<%= mEmail %>">
              <input type="button" style="float:right;" class="btn btn-outline-primary" value="수정완료" onclick="form_check()">
           </td>
       </tr>
   </form>
   
   <tr>
      <td>비밀번호</td>
      <td><div id="container">
              <button id="btn-modal"  class="btn btn-outline-primary">비밀번호변경</button>
          </div>
          <div id="modal" class="modal-overlay">
              <div class="modal-window">
                  <div class="title">
                      <h2>비밀번호변경</h2>
                  </div>
                  <div class="close-area">X</div>
                  <form id="pw_frm" method="post">
                  <input type="hidden" name="mId" value="<%= mId %>">
                  <div class="content">                
                       <table width="370" height="200" cellpadding="0" cellspacing="0" border="0">
                          <tr>
                            <td>                               
                               <input type="password" id="mPwd" name="mPwd" placeholder="비밀번호">
                            </td>
                         </tr>
                          <tr>
                            <td>
                                  <input type="password" id="pw_check" name="pw_check" placeholder="비밀번호확인">
                               </td>
                         </tr>
                          <tr>
                            <td>
                               <input type="button" value="변경" class="b1" onclick="pwf_check()">
                               </td>
                         </tr>                   
                      </table>                
                  </div>
                  </form>
              </div>
          </div>
          
       </td>
   </tr>

   <td colspan="2">
      <input type="reset"  class="btn btn-outline-primary" value="취소" onclick="javascript:window.location='/Main'">
      <input type="button" style="float:right;" value="회원탈퇴" class="btn btn-outline-primary" onclick="javascript:window.location='/memQuit'">
   </td>
</table>

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