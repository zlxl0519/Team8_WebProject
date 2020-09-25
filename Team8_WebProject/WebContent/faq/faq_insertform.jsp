<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

	
	<div class="content">
		
		<h2>신규 FAQ 등록</h2>
	
		<form action="faq_insert.jsp" method="post">
		<ul class="review-ul mt30 review-text">
			<li>
				<div class="review-wrap">
					<div class="mt20">
						<label for="qst">질문</label>
						<input type="text" name="qst" id="qst" />
					</div>
					<div class="mt20">
						<label for="ans">답변</label>
						<textarea name="ans" id="ans" class="mt20" cols="40" rows="20" placeholder="답변을 입력해주세요!" onfocus="this.placeholder=''" onblur="this.placeholder='답변을 입력해주세요!'"></textarea>
					</div>
				</div>
			</li>
		</ul>
		<div class="left">
			<button id="submit" type="submit" class="mt20">등록</button>
		</div>
		</form>
	</div>
<script>
   $("#submit").on("click", function(){
      if($("#qst").val() == ""){
         alert("질문을 입력해주세요")
         $("#qst").focus();
         return false;
      } else if($("#ans").val() == ""){
    	  alert("답변을 입력해주세요")
          $("#ans").focus();
          return false;
      }
   });
</script>	
<jsp:include page="../include/footer.jsp"></jsp:include>