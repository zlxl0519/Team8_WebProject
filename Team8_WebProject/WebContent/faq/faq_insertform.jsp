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
		<h1>faq 작성하기</h1>
		<div class="form-wrap">
			<br/>
			<form action="faq_insert.jsp" method="post">
				<label for="qst">질문</label>
				<textarea name="qst" id="qst" cols="20" rows="20"></textarea><br/>
				<label for="ans">답변</label>
				<textarea name="ans" id="ans" cols="20" rows="20"></textarea><br/>
				<br/>
				<button type="submit">등록</button>
			</form>
		</div>

	</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>

<script>
   $("#submit").on("click", function(){
      if($("#title").val() == ""){
         alert("질문을 입력해주세요")
         $("#title").focus();
         return false;
      }
   });
</script>

</body>
</html>