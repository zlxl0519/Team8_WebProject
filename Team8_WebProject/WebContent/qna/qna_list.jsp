<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QnaDao dao = QnaDao.getInstance();
	List<QnaDto> list = dao.getList();
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amung's QnA";
</script>
<%--qna/qna_list.jsp--%>
<div class="content">
	<h2>QnA</h2>
	<div class="left mb20">
		<h3>문의사항이 있다면 글을 남겨주세요<br/>
		자주 묻는 질문은
		<a href="${pageContext.request.contextPath }/faq/faq_main.jsp">
			<strong class="f_blue f16"> FaQ</strong>
		</a>
		에서 확인해주요.
		
		</h3>
	</div>
	<div class="table-wrap">
		<table>
		<colgroup>
        	<col width="100px"/>
        	<col width="50%"/>
        	<col width=""/>
       		<col width="200px"/>
        	<col width="100px"/>
   		</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (QnaDto tmp : list) {
				%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td class="board_title"><a href="content.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
					<td><%=tmp.getId()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td><%=tmp.getHit()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
	</div><!-- table-wrap -->
	<div class="left mt20">
		<a href="insertform.jsp" ><button>작성하기</button></a>
	</div>
	
</div>
<!-- content -->

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>