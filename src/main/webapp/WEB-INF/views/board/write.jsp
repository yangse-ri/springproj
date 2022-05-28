<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 폼</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>



<script type="text/javascript">
	$(function(){
		$("#cancelBtn").click(function(){
			history.back();
		});
	});

</script>

<body>

<div class="container">
<h2>게시판 글쓰기 폼</h2>
<form action="write.do" method="post">
<input type="hidden" value="${param.perPageNum }" name="perPageNum"><!-- 넘어오는거 받기 -->
<div class="form-group">
	<label>제목</label>
	<input name="title" id="title" class="form-control">
</div>

<div class="form-group">
	<label>내용</label>
	<textarea name="content" id="content" class="form-control" rows="12"></textarea>
</div>

<div class="form-group">
	<label>작성자</label>
	<input name="writer" id="title" class="form-control">
</div>

<button>등록</button>
<button type="reset">새로입력</button>
<button type="button" id="cancelBtn">취소</button>
</form>

</div>

</body>
</html>