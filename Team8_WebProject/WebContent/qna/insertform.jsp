<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

	
	<div class="content">
	<br/>
	<h1>QnA 작성하기</h1>
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" /><br/>
			<label for="content">작성하기</label>
			<textarea name="content" id="content" cols="40" rows="20"></textarea><br/>
			<label for="image">사진 첨부</label>
			<input type="file" name="image" id="image" />
			<input type="submit" value="등록" />
			<input type="reset" value="취소" />
		</form>
	</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>