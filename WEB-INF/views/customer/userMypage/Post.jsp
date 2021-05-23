<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/header.css" rel="stylesheet">
<link
	href="resources/css/UserMypage/userMypagePost.css?v=<%=System.currentTimeMillis()%>"
	rel="stylesheet">
<title>내가쓴글모아보기</title>
</head>
<body>
	<!------- sidebar Start ------->

	<div id="container">
		    	<nav id="user-side-nav">
			<div class="user-mypage-list" id="user-info">
				<div id="user-img-box">
					<a href="#user-page-top"> <span class="d-none d-lg-block"><img
							id="img-user-pic" src="/resources/image/${user.uPic}" alt="" /></span>
					</a>
				</div>
				<div id="user-info">
					<p id="user-name">${user.uName}님,기다렸어요:)</p>
					<p id="user-email">${user.uEmail}</p>
				</div>
			</div>
			<div class="user-mypage-list" id="user-profile">
				<p>나의 정보</p>
				<ul class="nav-list">
					<li class="nav-item"><a class="nav-link" href="mypageinfo.do">나의 회원 정보</a></li>
					<li class="nav-item"><a class="nav-link" href="UserMypageInfoUpdate.do">회원 정보 관리</a></li>
				</ul>
			</div>
			<div class="user-mypage-list" id="user-content">
				<p>커뮤니티</p>
				<ul class="nav-list">
					<li class="nav-item"><a class="nav-link" href="getUserPost.do?uNo=${user.uNo}">내가 작성한 글</a></li>
					<li class="nav-item"><a class="nav-link" href='getUserReply.do?uNo=${user.uNo}&tHeader=함께먹어요'>내가 작성한 댓글</a></li>
					<li class="nav-item"><a class="nav-link" href=#>나의 찜한 글</a></li>
				</ul>
			</div>
			<div class="user-mypage-list" id="user-rsv">
				<p>전문가 예약</p>
				<ul class="nav-list">
					<li class="nav-item"><a class="nav-link" href="getUserRsvList.do">예약한 서비스 일정</a></li>
					<li class="nav-item"><a class="nav-link" href="getUserComList.do">완료된 서비스 내역</a></li>
					<li class="nav-item"><a class="nav-link" href=#>내가 찜한 전문가 보기</a></li>
				</ul>
			</div>
			<div class="user-mypage-list" id="haeyo-info">
				<p>해요 안내</p>
				<ul class="nav-list">
					<li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
					<li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
					<li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
				</ul>
			</div>
		</nav>
		<!------- sidebar end --------->
		<!-- 내가 쓴 글 모아보기 start -->
		<section>
			<div id="main-header">
				<h5>커뮤니티</h5>
				<p>내가 작성한 글</p>
			</div>

			<div id="t_contents">

				<c:choose>
					<c:when test="${!empty tPostList}">
						<c:forEach var="tPost" items="${tPostList}">
							<table id="User_reply_content_Wrap">
								<tr>
									<td rowspan="4" class="postPic"><img class="postPic"
										src="/WEB-INF/boardImages/${tPost.tPic1}"></td>
								</tr>

								<tr>
									<td id="tdSize">작성일 : ${tPost.tCredate}</td>
								</tr>

								<tr>
									<td>카테고리 : ${tPost.tHeader}</td>
								</tr>
								<tr>
									<td>글 제목 : ${tPost.tTitle}</td>
								</tr>
							</table>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<td>아직 활동 전이시군요! 다양한 주제의 게시글에서 많은 사람들과 소통해보세요 :) 재밌을거에요</td>
							</tr>
						</table>
					</c:otherwise>

				</c:choose>

			</div>
		</section>
	</div>
	<!------- 내가 쓴 글 모아보기 end --------->
</body>
</html>