<%@page import="java.util.List"%>
<%@page import="dao.FaqDao"%>
<%@page import="dto.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung's FAQ</title>
<style>
	.btn{padding:0; background:transparent; border:0; outline:0}
	.faq{width: 690px; margin:20px auto; border:1px solid #000}
	.faq .btn_toggle{display:block; width:100%; height:30px; padding:0
	10px; background:#85D4BE; font-size:14px; text-align: left; line-height:30px; box-sizing: border-box}
	.faq .btn_toggle::before{display:inline; content:'Q.'}
	.faq .content{display:none; padding:10px; text-align: left; background:#ffffff}
	.faq .content::before{display:inline; content:'A.'}
	.faq .content.act{display:block}
</style>
</head>
<body>
<%
	FaqDao dao = FaqDao.getInstance();
	List<FaqDto> list = dao.getList();

%>

<div class="container" style="text-align:center;">

	<h1>FAQ</h1>
	<h3>자주 물어보시는 질문들입니다.</h3>
	<p>검색해도 나오지 않는 질문이 있으시다면 QnA 게시판을 찾아주세요.</p>
	
		<!-- faq 아코디언형 게시판 부분 -->
		<% for(FaqDto tmp:list){ %>
		<div class="faq" data-group="faq1">
			<button class="btn btn_toggle"> <%=tmp.getQst() %></button>
			<div class="content"> <%=tmp.getAns() %> </div>
		</div>
		<%} %>
	
</div>


<script>

function faqevent(wrap){
	var area = document.querySelectorAll(wrap);
	
	area.forEach(function(area){
		var btn = area.querySelector('.btn_toggle');
		
		btn.addEventListener('click', function(){
			var name= area.dataset['group'];
			var groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
			var thisContent = area.querySelector('.content');
			
			groupArr.forEach(function(group){
				var content = group.querySelector('.content');
				content.classList.remove('act');
			});
			
			thisContent.classList.add('act');
		});
	});
	
}

faqevent('.faq');

</script>

</body>
</html>