<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hundred Training:BoardModify</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<!-- CKEditor 스크립트를 로드합니다. -->
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>

<!-- 스크립트를 로드한 후에 ClassicEditor.create를 호출합니다. -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    ClassicEditor
        .create(document.querySelector('#fContent'))
        .then(editor => {
            editor.setData('${post.fContent}');

            // CKEditor가 준비되면 textarea를 찾아서 이벤트를 연결합니다.
            editor.editing.view.document.on('change', () => {
                $('#fContent').val(editor.getData());
            });
        })
        .catch(error => {
            console.error(error);
        });
});
</script>

<script>
/*
function form_check() {
   if($('#fTitle').val().length == 0) {
      alert("제목을 입력하세요.");
      $('#fTitle').focus();
      return;
   }
   if($('#fContent').val().length == 0) {
      alert("내용을 입력하세요.");
      $('#fContent').focus();
      return;
   }
   submit_ajax();   
}

function submit_ajax() {
   var queryString = $("#modify").serialize();
   $.ajax({
      url: '/modifyBoard',
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
*/
</script>
<style>

table tr td {
    border: 1px solid #dddddd;
}

h2 {
   text-align: center;
}
</style>
</head>

<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
<form action="/modifyBoard" method="post" enctype="multipart/form-data">
<table class="table">
   
   
       <tr>
          <input type="hidden" name="fId" value="${post.fId}">
           <td><h2>제목</h2></td>
           <td><input type="text" id="fTitle" name="fTitle" value="${post.fTitle}"></td>
       </tr>
       <tr>
           <td><h2>내용</h2></td>
           <td><textarea id="fContent" name="fContent" value="${post.fContent}"></textarea></td>
       </tr>
       <tr>
          <td><h2>파일 첨부</h2></td>
          <td>
              <div>사진 : <input type="file" id="files" name="files" accept="image/*"></div>
          </td>
       </tr>
   
   <tr>
      <td colspan="2">
         <input type="reset" style="float:left;" class="btn btn-outline-primary" value="취소" onclick="javascript:window.location='/fBoardList'">
         <input type="submit" style="float:right;" class="btn btn-outline-primary" value="수정완료" >
      </td>   

   </tr>
</table>
</form>

<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>