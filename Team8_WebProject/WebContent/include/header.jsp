<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<li><a href="javascript:void(0);">로그인</a></li>
						<li><a href="${pageContext.request.contextPath }/signup/signup_form.jsp">회원가입</a></li>
					</ul>
				</div>

			</nav>
			<nav id="nav-slide" class="nav2">
				<div>
					<h1>
						<a href="javascript:void:(o);" target="_blank"><img
							src="${pageContext.request.contextPath }/include/img/logo_top.png" alt="애견 호텔링 전문 : AMung" /></a>
					</h1>

					<div class="nav2-gnb">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">예약하기</a></li>
							<li><a href="#">이용안내</a></li>
							<li><a href="#">커뮤니티</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>


				</div>
			</nav>
			<nav class="nav2 nav2-small">
				<div>
					<h1>
						<a href="javascript:void:(o);" target="_blank"><img
							src="${pageContext.request.contextPath }/include/img/logo.png" alt="애견 호텔링 전문 : AMung" /></a>
					</h1>

					<div class="nav2-gnb">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">예약하기</a></li>
							<li><a href="#">이용안내</a></li>
							<li><a href="#">커뮤니티</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>


				</div>
			</nav>

		</header>