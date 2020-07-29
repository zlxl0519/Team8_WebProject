<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = dao.getData(num);
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
	
	//로그인 된 아이디와 글 작성자가 같을 때에만 수정할 수 있도록
	String swriter = (String)session.getAttribute("id");
	if(!writer.equals(swriter)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"잘못된 접근입니다!");
		return;
	}
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="content center">
<h3 class="review">소중한 <strong>후기</strong>를 수정 중 입니다. <i class="fas fa-comment-dots"></i></h3>
	<form action="update.jsp" method="post">
	<ul class="review-ul mt30 review-text">
			<li>
				<div class="review-wrap" style="height:635px;">
					<div class="mt20">
					<input type="hidden" name="num" value="<%=dto.getNum() %>" />
					<label for="num">글번호 : <%=dto.getNum() %>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</label>
					<input type="hidden" name="id" value="<%=dto.getWriter() %>" />
					<label for="id">작성자 : <%=dto.getWriter() %></label>
					</div>
					<div class="mt20">
						<label for="title">제목</label>
						<input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/>
					</div>
					<div class="mt20">
						<label for="content">작성하기</label>
						<textarea name="content" id="content" class="mt20" cols="40" rows="20" placeholder="글 내용을 입력해주세요!" onfocus="this.placeholder=''" onblur="this.placeholder='글 내용을 입력해주세요!'"><%=dto.getContent() %></textarea>
					</div>
				</div>
			</li>
		</ul>
		<div class="left">
			<button id="submit" type="submit" class="mt20">등록</button>
		</div>
	</form>
</div><!-- content -->

<script>
	$("#submit").on("click", function(){
	    if($("#title").val() == ""){
	    	alert("내용을 입력해주세요");
	    	$("#title").focus();
		      return false;
	    }else if($("#content").val() == ""){
	    	alert("제목을 입력해주세요");
	    	$("#content").focus();
		      return false;
	    }
	});
</script>

<jsp:include page="../../include/footer.jsp"></jsp:include>