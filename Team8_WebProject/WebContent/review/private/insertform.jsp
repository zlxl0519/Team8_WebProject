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
		</form>

		<div class="left">
			<button id="submit" type="submit" class="mt20">등록</button>
		</div>

	</div>
	
<jsp:include page="../../include/footer.jsp"></jsp:include>

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
