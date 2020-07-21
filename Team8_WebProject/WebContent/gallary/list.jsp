<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
<div class="table-wrap">
	<h2>호텔 일상</h2>
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
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>