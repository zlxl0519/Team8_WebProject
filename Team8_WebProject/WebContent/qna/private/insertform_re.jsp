<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	
	String title = dto.getTitle();
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="content">
	<h2>답글 작성하기</h2>
	<div class="table-wrap boardList">
		<form action="insert_re.jsp" method="post">
			<input type="hidden" name="num" id="num" value="<%=num%>"/>
			<input type="hidden" name="title" value="<%=title%>"/>
			<table class="mb20">
				<tbody>
					<tr>
						<th scope="row">
							<label for="title">제목</label> 
						</th>
						<td>
							<input type="text" id="title" value="<%="└RE:"+title%>" disabled/>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="content">작성하기</label>
						</th>
						<td class="smart_content">
							<textarea name="content" id="content" cols="40" rows="20"></textarea>
						</td>
					</tr>
			</table> 
			<div>
				<button id="submit" type="submit"  class="btn-default" onclick="submitContents(this);">등록</button>
			</div>
			</form>
	</div>
</div>
<!-- content -->
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath  }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>

	$("#submit").on("click", function(){
	    if($("#title").val() == ""){
	    	alert("내용을 입력해주세요");
	    	$("#title").focus();
		      return false;
	    }
	});
 
     var oEditors = [];
     
     //추가 글꼴 목록
     //var aAdditionalFontSet = [["MS UI Gothic", "MS UI  Gothic"], ["Comic Sans MS", "Comic Sans  MS"],["TEST","TEST"]];
     
     nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content",
          sSkinURI:  "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
          htParams : {
              bUseToolbar : true,               // 툴바  사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,       // 입력창  크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,           // 모드  탭(Editor | HTML | TEXT) 사용 여부 (true:사용/  false:사용하지 않음)
              //aAdditionalFontList : aAdditionalFontSet,          // 추가 글꼴 목록
              fOnBeforeUnload : function(){
                   //alert("완료!");
              }
          }, //boolean
          fOnAppLoad : function(){
              //예제 코드
               //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이  완료된 후에 본문에 삽입되는 text입니다."]);
          },
          fCreator: "createSEditor2"
     });
     
     function pasteHTML() {
          var sHTML = "<span  style='color:#FF0000;'>이미지도 같은 방식으로  삽입합니다.<\/span>";
          oEditors.getById["content"].exec("PASTE_HTML",  [sHTML]);
     }
     
     function showHTML() {
          var sHTML = oEditors.getById["content"].getIR();
          alert(sHTML);
     }
          
     
     //폼에 저장버튼을 누르면 호출되는 함수
     //<button type="submit"  onclick="submitContents(this);"></button>
     function submitContents(elClickedObj) {
          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",  []); // 에디터의 내용이 textarea에 적용됩니다.
          
          // 에디터의 내용에 대한 값 검증은 이곳에서  document.getElementById("content").value를 이용해서  처리하면 됩니다.
          
          try {
              elClickedObj.form.submit(); //폼 강제 제출
          } catch(e) {}
     }
     
     function setDefaultFont() {
          var sDefaultFont = '궁서';
          var nFontSize = 24;
          oEditors.getById["content"].setDefaultFont(sDefaultFont,  nFontSize);
     }
</script>
<jsp:include page="../../include/footer.jsp"></jsp:include>
