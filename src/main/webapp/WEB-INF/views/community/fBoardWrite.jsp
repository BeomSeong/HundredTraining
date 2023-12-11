<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training:BoardWrite</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>

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
    <h1>글작성</h1>
    <form action="/createPost" method="post" enctype="multipart/form-data">
    <table class="table">
      <tr>
         <td><h2>제목</h2></td>
         <td>
               <input type="text" class="form-control" id="fTitle" name="fTitle" placeholder="제목을 입력하세요">
               <input type="hidden" class="form-control" id="mId" name="mId" value="<%=session.getAttribute("mId")%>">
               <input type="hidden" class="form-control" id="mNick" name="mNick" value="<%=session.getAttribute("mNick")%>">
           </td>
        </tr>
        <tr>
           <td><h2>내용</h2></td>
           <td>
              <textarea id="editor" name="fContent" size="10"></textarea>
           </td>
        </tr>
        <tr>
             <td><h2>파일 첨부</h2></td>
             <td>
              <div>사진 : <input type="file" id="files" name="files" accept="image/*"></div>
              <script>
                  ClassicEditor
                      .create( document.querySelector( '#editor' ) )
                      .catch( error => {
                      console.error( error );
                  } );
              </script>
           </td>
        </tr>
        <tr>
           <td colspan="2">
               <input type="submit" style="float:right;" class="btn btn-outline-primary" value="작성">   
            <input type="reset" style="float:left" class="btn btn-outline-primary" value="취소" onclick="javascript:window.location='/fBoardList'">
             </td>
        </tr>
    
    </table>
    </form>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>