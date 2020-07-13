<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>운영현황 게시판 리스트</h1>
		<table>
		<%--for문으로 돌려서 세개씩 이미지 나오게 하기 --%>
			<tr>
				<td>
					<div><a href=""><img src="${pageContext.request.contextPath }/images/0.png"/></a></div>
					<div>
						<p>제목</p>
						<p>내용</p>
					</div>				
				</td>
			</tr>
		</table>
		<a href="insertform.jsp"><button>글쓰기</button></a>
	</div>
</body>
</html>