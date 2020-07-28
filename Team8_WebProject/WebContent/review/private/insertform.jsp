<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="content center">
<h3 class="review">소중한 <strong>후기</strong>를 작성해주세요! <i class="fas fa-comment-dots"></i></h3>
	<form action="insert.jsp" method="post">
		<ul class="review-ul mt30 review-text">
			<li>
				<div class="review-wrap">
					<div class="mt20">
						<label for="title">제목</label>
						<input type="text" name="title" id="title" />
					</div>
					<div class="mt20">
						<label for="content">작성하기</label>
						<textarea name="content" id="content" class="mt20" cols="40" rows="20" placeholder="글 내용을 입력해주세요!" onfocus="this.placeholder=''" onblur="this.placeholder='글 내용을 입력해주세요!'"></textarea>
					</div>
				</div>
			</li>
		</ul>
		<div class="left">
			<button type="submit" class="mt20">등록</button>
		</div>
	</form>
</div><!-- content -->
<jsp:include page="../../include/footer.jsp"></jsp:include>