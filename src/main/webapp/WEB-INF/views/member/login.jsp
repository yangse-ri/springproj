<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="container">
	<h2>로그인</h2>
	<form action="login.do" method="post">
	<div class="form-group">
	<label for="id">아이디</label>
    <input name="id" id="id" class="form-control">
  	</div>
  	<div class="form-group">
	<label for="pw">비밀번호</label>
    <input name="pw" id="pw" type="password" class="form-control">
  	</div>

  	<button class="btn btn-default">로그인</button>
  	<button type="button" class="btn btn-default" onclick="history.back()">취소</button>

 
	</form>
</div>

</body>
</html>