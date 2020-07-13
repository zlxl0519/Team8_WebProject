<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>새로운 글 작성</h1>
	<form action="insert.jsp" method="post">
		<label for="title">제목</label>
		<input type="text" name="title" id="title" /><br />
		<label for="img">삽입 할 이미지</label>
		<input type="file" name="img" id="img" /><br />
		<label for="content"></label>
		<textarea name="content" id="content" cols="30" rows="10"></textarea><br />
		<button type="submit">확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>