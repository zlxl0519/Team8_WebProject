<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<h2>호텔 일상 글 작성</h2>
	<!--html편집기-->
	<div class="table-wrap boardList">
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<th scope="row">이름</th>
							<td>운영자</td>
						</tr>
						<tr>
							<th scope="row"><label for="caption">제목</label></th>
							<td>
								<input type="text" name="caption" id="caption" placeholder="제목을 입력해주세요." />
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="image">이미지</label>
							</th>
							<td class="filebox">
								<input class="upload-name" value="파일선택" disabled="disabled">
								<label for="image">업로드</label> 
								<input type="file" name="image" id="image" class="upload-hidden" accept=".jpg, jpeg, .png, .JPG, .JPEG" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="content">내용</label>
							</th>
							<td>
								<textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="left mt20">
					<button type="submit">upload</button>
				</div>
			
		</form>
	</div><!-- form-wrap -->
	

	

</div>
<!--content -->
<jsp:include page="../include/footer.jsp"></jsp:include>
