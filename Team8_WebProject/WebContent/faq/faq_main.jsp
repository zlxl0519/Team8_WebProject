<%@page import="java.util.List"%>
<%@page import="dao.FaqDao"%>
<%@page import="dto.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amung's FAQ "; 
</script>
<style>
</style>
<%
	FaqDao dao = FaqDao.getInstance();
	List<FaqDto> list = dao.getList();

%>


<div class="content">
	
	<h2>FAQ</h2>
	
	<div class="left">
	<h3>자주 물어보시는 질문들입니다.</h3>
	<p>
		검색해도 나오지 않는 질문이 있으시다면 
		<a href="${pageContext.request.contextPath }/qna/qna_list.jsp">
		   <strong class="f_blue f16">QnA</strong>
		</a>
		게시판을 찾아주세요.
	</p>
	</div>
	
<!-- faq 아코디언형 게시판 부분 -->
	<ul class="accordion-wrap">
	<% for(FaqDto tmp:list){ %>
		<li>
		<div class="accordion-q">
		<div class="q">
			<h6></h6>
		</div>
			
			<a href=""><%=tmp.getQst() %></a>
			
			
		</div>
		<div class="accordion-a">
		<div class="a">
			<h6></h6>
		</div>
		
			<p><%=tmp.getAns() %></p>
		</div>
			
		</li>
	<%} %>
	</ul>


</div>



<script>
$(document).ready(function(){
	  $(".accordion-a").hide();
	  $(".accordion-q").click(function(){
	    $(this).next().slideToggle(300);
	    $(".accordion-q").not(this).next().slideUp(300);
	    return false;});
	  $(".accordion-q").eq(0).trigger("click");
	});

/* function faqevent(wrap){
	var area = document.querySelectorAll(wrap);
	
	area.forEach(function(area){
		var btn = area.querySelector('.btn_toggle');
		
		btn.addEventListener('click', function(){
			var name= area.dataset['group'];
			var groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
			var thisContent = area.querySelector('.faq_qa');
			
			groupArr.forEach(function(group){
				var content = group.querySelector('.faq_qa');
				content.classList.remove('act');
			});
			
			thisContent.classList.add('act');
		});
	});
	
} */

faqevent('.faq');

</script>
<jsp:include page="../include/footer.jsp"></jsp:include>