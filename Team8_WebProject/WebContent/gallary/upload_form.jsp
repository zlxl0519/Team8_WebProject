<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
<div class="form-wrap">
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<label for="image">이미지</label>
		<input type="file" name="image" id="image" accept=".jpg, jpeg, .png, .JPG, .JPEG"/><br />
		
		<label for="caption">제목</label>
		<input type="text" name="caption" id="caption" /><br />
		
		<label for="content">내용</label>
		<textarea name="content" id="content" cols="30" rows="10"></textarea>
		<button type="submit">upload</button>
	</form>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
