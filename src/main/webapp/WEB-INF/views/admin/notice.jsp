<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  body { font-family: 굴림체; }
  div.container { width: 600px; margin: 20px auto; }
  form div { margin-bottom: 10px; }
  input { width: 200px; padding: 4px; }
  button { padding: 0.4em 3em; margin-top: 10px; }
</style>
</head>
<body>
  <div class="container">
    <form method="post">
      <h1>공지사항</h1>

      <div>
        <label>제목</label> 
        <input type="text" name="title" value="" placeholder="제목" />
      </div>

      <div>
        <label>내용</label> 
        <textarea name="body" value="" placeholder="내용을 입력해주세요." style="width:100%; height:30em;"></textarea>
      </div>
      
      <button type="submit">확인</button>
      <button type="reset">취소</button>
    </form>
  </div>
</body>
</html>

