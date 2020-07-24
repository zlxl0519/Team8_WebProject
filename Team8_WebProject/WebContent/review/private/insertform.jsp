<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>

	
	<div class="content">
		<div class="form-wrap">
			<br/>
			<h1>리뷰 작성하기</h1>
			<form action="insert.jsp" method="post">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" /><br/>
				<label for="content">작성하기</label>
				<textarea name="content" id="content" cols="40" rows="20"></textarea><br/>
				<br/>
				<button type="submit">등록</button>
			</form>
		</div>

	</div>
	
<jsp:include page="../../include/footer.jsp"></jsp:include>


</body>
</html>