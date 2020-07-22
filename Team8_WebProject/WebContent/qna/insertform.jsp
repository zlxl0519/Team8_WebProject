<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<h2>QnA 작성하기</h2>
	<div class="table-wrap boardList">
		<form action="insert.jsp" method="post" enctype="multipart/form-data">
			<table class="mb20">
				<tbody>
					<tr>
						<th scope="row">
							<label for="title">제목</label> 
						</th>
						<td>
							<input type="text" name="title" id="title" placeholder="제목을 입력해주세요."/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">
							<label for="amFile">파일 첨부</label>
						</th>
						<td class="filebox">
						<input class="upload-name" value="파일선택" disabled="disabled">
						<label for="amFile">업로드</label> 
						<input type="file" name="amFile" id="amFile"  class="upload-hidden"/>
							</td>
					</tr>
					
					<tr>
						<th scope="row">
							<label for="content">작성하기</label>
						</th>
						<td>
							<textarea name="content" id="content" cols="40" rows="20" placeholder="글을 입력해주세요."></textarea>
						</td>
					</tr>
			</table> 
			<div>
				<input type="submit" value="등록" class="btn-default"/>
				<input type="reset" value="취소" class="btn-default btn-gray"/>
			</div>
			</form>
	</div>
</div>
<!-- content -->

<jsp:include page="../include/footer.jsp"></jsp:include>