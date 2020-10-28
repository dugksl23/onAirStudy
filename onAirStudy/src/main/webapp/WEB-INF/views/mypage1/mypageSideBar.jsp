<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">

	<nav class="side-navbar mypage-sideBar ">
		<!-- Sidebar Header-->
		<div class="sidebar-header py-5">
			<div class="message-icon-line">
				<div class="icon icon-mail message" onclick="location.href='${pageContext.request.contextPath}/message/messageList.do';" style="cursor:pointer;"></div>
				<div class="messageAlarm" >1</div>
			</div>
			<div class="avatar">
				<img src="${ pageContext.request.contextPath }/resources/images/avatar-7.jpg" alt="...">
				<h3>Honggd</h1>
				<h5>premium</h3>
			</div>
			<div class="d-day-display">
		        <hr>
		        <span>D - 37</span></br>
		        <span>2020.11.02</span></br>
		        <span>토익시험</span></br>
		    	<hr>s
	   		</div>
		</div>
		<span class="heading">Menu</span>
		
		<ul class="list-unstyled">
			<li><a href="${ pageContext.request.contextPath}/mypage1/invitationlist.do">초대내역</a></li>
			<li><a href="${ pageContext.request.contextPath }/premium.do">프리미엄</a></li>
			<li><a href="${ pageContext.request.contextPath}/mypage1/mystudylist.do">내 스터디방</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/scheduler.do">스케줄러</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">내 정보</a></li>
		</ul>
	</nav>
	
	
	