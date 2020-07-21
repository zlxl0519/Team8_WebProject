<%@page import="java.util.List"%>
<%@page import="dao.FaqDao"%>
<%@page import="dto.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%
    //한 페이지에 나타낼 row 의 갯수
    final int PAGE_ROW_COUNT=5;
    //하단 디스플레이 페이지 갯수
    final int PAGE_DISPLAY_COUNT=5;
    
    //보여줄 페이지의 번호
    int pageNum=1;
    //보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와  본다.     
    String strPageNum=request.getParameter("pageNum");
    if(strPageNum != null){//페이지 번호가 파라미터로  넘어온다면
         //페이지 번호를 설정한다.
         pageNum=Integer.parseInt(strPageNum);
    }
    //보여줄 페이지 데이터의 시작 ResultSet row 번호
    int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
    //보여줄 페이지 데이터의 끝 ResultSet row 번호
    int endRowNum=pageNum*PAGE_ROW_COUNT;
    
    //검색 키워드 처리
    String keyword = request.getParameter("keyword");
    if(keyword==null){
    	keyword="";
    }
    
    String encodedK=URLEncoder.encode(keyword);
    String condition=request.getParameter("condition");
    
    FaqDto dto = new FaqDto();
    dto.setStartRowNum(startRowNum);
    dto.setEndRowNum(endRowNum);
    
    List<FaqDto> list = null;
    int totalRow=0;
    
    if(!keyword.equals("")){
    	if(condition.equals("qst_ans")){
    		dto.setQst(keyword);
    		dto.setAns(keyword);
        	list=FaqDao.getInstance().getListQA(dto);
        	totalRow=FaqDao.getInstance().getCountQA(dto);
    	}else if(condition.equals("qst")){
    		dto.setQst(keyword);
        	list=FaqDao.getInstance().getListQ(dto);
        	totalRow=FaqDao.getInstance().getCountQ(dto);
    	}else if(condition.equals("ans")){
    		dto.setAns(keyword);
        	list=FaqDao.getInstance().getListA(dto);
        	totalRow=FaqDao.getInstance().getCountA(dto);
    	}
    }else{
    	condition="";
    	keyword="";
    	list=FaqDao.getInstance().getList(dto);
    	totalRow=FaqDao.getInstance().getCount();
    }
    
    
    //전체 페이지의 갯수 구하기
    int totalPageCount=
              (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
    //시작 페이지 번호
    int startPageNum=
         1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
    //끝 페이지 번호
    int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
    //끝 페이지 번호가 잘못된 값이라면
    if(totalPageCount < endPageNum){
         endPageNum=totalPageCount; //보정해준다.
    }
    
%>
            
<script>
	document.title = "Amung's FAQ "; 
</script>
<style>

	.btn{
	padding:0; background:transparent; border:0; outline:0
	} 
	
	.faq{
	width: 690px; margin:20px auto; border:1px solid #000
	} 
	
	.faq .btn_toggle{
	display:block; width:100%; height:30px; padding:0 10px;
	background:#85D4BE; font-size:14px; text-align: left;
	line-height:30px; box-sizing: border-box}
	
	.faq .btn_toggle::before{
	display:inline; content:'Q.'
	}
	
	.faq .content{
	display:none; padding:10px; text-align: left; background:#ffffff
	}
	
	.faq .content::before{
	display:inline; content:'A.'
	}
	
	.faq .content.act{
	display:block
	}
	
	.page-display{
		margin-left: 360px;
	}
	
	.page-display a{
		text-decoration: none;
		color: #000000;
	}
	
	.page-display ul li{
		float: left;
		list-style-type: none; 
		margin-left: 10px;
	}
	
	.page-display ul li.active{
		font-weight: bold;
	}
	
	.page-display ul li.active a{
		color: #85D4BE
	}
</style>

<jsp:include page="../include/header.jsp"></jsp:include>


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


		<%} %>
		<div class="page-display">
              <ul>
                   <%if(startPageNum !=1){ %>
                        <li><a href="faq_main.jsp?pageNum=<%=startPageNum-1  %>">prev</a></li>
                   <%} %>
                   <%for(int i=startPageNum; i<=endPageNum; i++){ %>
                        <%if(i==pageNum){ %>
                             <li class="active"><a href="faq_main.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} else{%>
                             <li><a href="faq_main.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} %>
                   <%} %>
                   <%if(endPageNum < totalPageCount){ %>
                        <li><a href="faq_main.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
                   <%} %>
              </ul>
          </div>
          <br/>
          <br/>
 
 <!-- 검색 폼 -->         
        
        <form action="faq_main.jsp" method="get">
        	<label for="condition">검색 조건</label>
        	<select name="condition" id="condition">
        		<option value="qst_ans" <%if(condition.equals("qst_ans")){%>selected<%} %>>제목+내용</option>
        		<option value="qst" <%if(condition.equals("qst")){%>selected<%} %>>제목</option>
        		<option value="ans" <%if(condition.equals("ans")){%>selected<%} %>>내용</option>
        	</select>
        	<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어를 입력하세요." />
        	<button type="submit">검색</button>
        </form> 
          
</div>



<script>
/*faq 아코디언*/
$(document).ready(function(){
	  $(".accordion-a").hide();
	  $(".accordion-q").click(function(){
	    $(this).next().slideToggle(300);
	    $(".accordion-q").not(this).next().slideUp(300);
	    return false;});
	  $(".accordion-q").eq(0).trigger("click");
	});

/* 
function faqevent(wrap1){
	var area = document.querySelectorAll(wrap1);
	
	area.forEach(function(area){
		var btn = area.querySelector('.btn_toggle');
		
		btn.addEventListener('click', function(){
			var name= area.dataset['group'];
			var groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
			var thisAnswer = area.querySelector('.content');
			
			groupArr.forEach(function(group){
				var content = group.querySelector('.content');
				content.classList.remove('act');
			});
			
			thisAnswer.classList.add('act');
		});
	});
	
} */

faqevent('.faq');

</script>
<jsp:include page="../include/footer.jsp"></jsp:include>