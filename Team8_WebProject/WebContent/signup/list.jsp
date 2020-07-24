<%@page import="java.net.URLEncoder"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
	

	//페이징에 관련된 처리============================
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT= 15;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT= 10;

	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	
	//검색 키워드에 관련된 처리============================
	
	String keyword=request.getParameter("keyword"); //검색 키워드
	String condition=request.getParameter("condition"); //검색 조건
	if(keyword==null){//전달된 키워드가 없다면 
		keyword=""; //빈 문자열을 넣어준다. 
		condition="";
	}
	
	//인코딩된 키워드를 미리 만들어 둔다. 
	String encodedK=URLEncoder.encode(keyword);
	
	//dao, dto 생성해서 데이터 set 할 준비 ============================
	MemberDto dto = new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//select 된 결과를 담을 List
	List<MemberDto> list = null;	
	//전체 row 갯수 담을 변수
	int totalRow = 0;
	
	
	//검색 키워드에 따라 select 결과가 달라지도록 만든다. ============================
	
	if(!keyword.equals("")){ //검색키워드 있을 때
		if(condition.equals("id")){
			dto.setId(keyword);
			list = MemberDao.getInstance().getListId(dto);
			totalRow = MemberDao.getInstance().getCountId(dto);
		}else if(condition.equals("name")){
			dto.setName(keyword);
			list = MemberDao.getInstance().getListName(dto);
			totalRow = MemberDao.getInstance().getCountName(dto); 
		}else if(condition.equals("phone")){
			dto.setPhone(keyword);
			list = MemberDao.getInstance().getListPhone(dto);
			totalRow = MemberDao.getInstance().getCountPhone(dto);
		}
	}else{ //검색 키워드 안쓰고 그냥 검색버튼 눌렀을 땐 전체 리스트 보이게
		list = MemberDao.getInstance().getList(dto);
		totalRow = MemberDao.getInstance().getCount();
	}
	
	//검색 키워드  끗! ========================================================
	

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
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "회원목록 "; 
</script>
<%--회원 목록 페이지 입니다.--%>
	<div class="content">
	<h2>회원 목록</h2>
	<div class="table-wrap">
	<table >
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				<th scope="col">가입일</th>
				<th scope="col">반려견 이름</th>
				<th scope="col">반려견 나이</th>
				<th scope="col">반려견 견종</th>
				<th scope="col">반려견 무게</th>
				<th scope="col">중성화 유무</th>
				<th scope="col">반려견 성별</th>
				<th scope="col">기타사항</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp : list){ %>
			<tr>
				<td><%= tmp.getId()%></td>
				<td><%= tmp.getEmail()%></td>
				<td><%= tmp.getName()%></td>
				<td><%= tmp.getPhone()%></td>
				<td><%= tmp.getRegdate()%></td>
				<td><%= tmp.getDname()%></td>
				<td><%= tmp.getDage()%></td>
				<td><%= tmp.getBreed()%></td>
				<td><%= tmp.getWeight()%></td>
				<td><%= tmp.getNeutral()%></td>
				<td><%= tmp.getGender()%></td>
				<%if(tmp.getMemo() != null){ %>
					<td><%= tmp.getMemo()%></td>
				<%}else{ %>
					<td></td>
				<%} %>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	
	<%-- 검색창 --%>
	<div class="right">
	
	
	<div class="search-form search-sm">
		<form action="list.jsp" method="get">
			<select name="condition" id="condition">
				<option value="id" <%if(condition.equals("id")){ %>selected<% }%>>아이디</option>
				<option value="name" <%if(condition.equals("name")){ %>selected<% }%>>이름</option>
				<option value="phone" <%if(condition.equals("phone")){ %>selected<% }%>>연락처</option>
			</select>
			<label for="keyword">
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요."/>
				<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
			</label>
		</form>
	</div>
	<div class="leftf mt30">
		<a href="list.jsp"><button>전체목록 보기</button></a>
	</div>
	
	</div><!-- right -->
	
	
	
	<%-- 페이징 넘버 --%>
	<div class="page-display">
		<ul>
		<%if(startPageNum != 1){ %>
			<li class="prev"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Prev</a></li>
		<%} %>
		<%for(int i=startPageNum; i<=endPageNum; i++){ %>
			<%if(i==pageNum){ %>
				<li class="active"><a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
			<%}else{%>
				<li><a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
			<%} %>
		<%} %>	
		<%if(endPageNum < totalPageCount){ %>
			<li class="next"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Next</a></li>
		<%} %>
		</ul>
	</div>
	
	
	</div><!-- table-wrap -->
	</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>