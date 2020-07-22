<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	GalleryDto dto = GalleryDao.getInstance().getData(num);
%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
<div class="form-wrap">
	<h2>호텔 일상 | 글 작성</h2>
	<form action="update.jsp" method="post" enctype="multipart/form-data">
		<label for="caption">제목</label>
		<input type="text" name="caption" id="caption" value="<%=dto.getCaption() %>"/><br />
	
		<label for="image">썸네일</label>
		<input type="file" name="image" id="image" accept=".jpg, jpeg, .png, .JPG, .JPEG"/><br />
		
		<label for="content">내용</label>
		<textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
		<button type="submit" onclick="submitContents(this);">저장</button>
	</form>
</div>
</div>

<%----------스마트 에디터 script--------------%>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);  <%-- id 바꿀거면 여기 content도 바꿔줘야함 --%>
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();   <%-- id 바꿀거면 여기 content도 바꿔줘야함 --%>
		alert(sHTML); 
	}
	//폼에 저장 버튼을 누르면 호출되는 함수 <button type="submit" onclick="submitContents(this);">저장</button>
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit(); //폼 강제 제출
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>