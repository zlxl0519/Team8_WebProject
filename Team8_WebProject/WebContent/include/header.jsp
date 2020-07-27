<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AMung</title>
<!--css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/include/css/base.css">
	<!-- fontAwesome -->
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<!-- IE9 이전 버전 / 로컬에서는 실행되지 않음-->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- //IE9 이전 버전-->
<!--script -->
<script type="text/javascript" src="${pageContext.request.contextPath }/include/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/include/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/include/js/script.js"></script>
<!-- jquery ui datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
</head>

<body onload="javascript:scrollMenu();">

	<div id="wrap">
		<div class="floatmenu">
			<a href="#"><img src="${pageContext.request.contextPath }/include/img/icon_talk.png"></a>
			<a
				href="#"><img src="${pageContext.request.contextPath }/include/img/icon_up.png"></a>
		</div>
		<header>
			<nav class="nav1">
				<div class="nav-gnb">
				<ul>
					<%if(id !=null){%>
						<li><a><span><%=id %></span> 님 환영합니다.</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/private/info.jsp">마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a></li>
						<%if(id.equals("admin")){ %>
						<li><a href="${pageContext.request.contextPath }/admin/list.jsp"><i class="fas fa-cog"></i>운영관리</a></li>
						<%} %>
					<% }else{%>
							<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
							<li><a href="${pageContext.request.contextPath }/signup/signup_form.jsp">회원가입</a></li>
					<%} %>
					</ul>
				</div>

			</nav>
			<nav id="nav-slide" class="nav2">
				<div>
					<h1>
						<a href="${pageContext.request.contextPath }/index.jsp"><img
							src="${pageContext.request.contextPath }/include/img/logo_top.png" alt="애견 호텔링 전문 : AMung" /></a>
					</h1>

					<div class="nav2-gnb">
						<ul>
							<li><a href="${pageContext.request.contextPath }/notice/notice_list.jsp">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/reservation/reserveform.jsp">예약하기</a></li>
							<li class="gnb-drop"><a href="#">이용안내</a>
								<ul class="dropdown">
									<li>
										<a href="${pageContext.request.contextPath }/guide/guide.jsp">Amung이용안내</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/guide/service.jsp">AMung주요서비스</a>
									</li> 
								</ul>
							</li>
							<li class="gnb-drop"><a href="#">커뮤니티</a>
							<ul class="dropdown">
								<li>
									<a href="${pageContext.request.contextPath }/gallery/list.jsp">AMung의 일상</a>
								</li>
				
								<li>
									<a href="${pageContext.request.contextPath }/review/rev_list.jsp">AMung 사용후기</a>
								</li> 
								<li>
									<a href="${pageContext.request.contextPath }/qna/qna_list.jsp">QnA게시판</a>
								</li>
							</ul>
							
							</li>
							<li><a href="${pageContext.request.contextPath }/faq/faq_main.jsp">FAQ</a></li>
						</ul>
					</div>


				</div>
			</nav>
			<nav class="nav2 nav2-small">
				<div>
					<h1>
						<a href="${pageContext.request.contextPath }/index.jsp"><img
							src="${pageContext.request.contextPath }/include/img/logo.png" alt="애견 호텔링 전문 : AMung" /></a>
					</h1>

					<div class="nav2-gnb">
						<ul>
							<li><a href="${pageContext.request.contextPath }/notice/notice_list.jsp">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/reservation/reserveform.jsp">예약하기</a></li>
							<li class="gnb-drop"><a href="${pageContext.request.contextPath }/guide/guide.jsp">이용안내</a>
								<ul class="dropdown dropdown-small">
									<li>
										<a href="#">Amung이용안내</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/guide/service.jsp">AMung주요서비스</a>
									</li> 
								</ul>
							</li>
							<li class="gnb-drop"><a href="#">커뮤니티</a>
								<ul class="dropdown dropdown-small">
									<li>
										<a href="${pageContext.request.contextPath }/gallery/list.jsp">AMung의 일상</a>
									</li>
					
									<li>
										<a href="${pageContext.request.contextPath }/review/rev_list.jsp">AMung 사용후기</a>
									</li> 
									<li>
										<a href="${pageContext.request.contextPath }/qna/qna_list.jsp">QnA게시판</a>
									</li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/faq/faq_main.jsp">FAQ</a></li>
						</ul>
					</div>


				</div>
			</nav>
			
		</header>
		 <script type="text/javascript">
     	 $(".gnb-drop").hover(function(){
        	$(this).find("ul").stop().fadeToggle(300);
     	 });
     	 
    	</script>