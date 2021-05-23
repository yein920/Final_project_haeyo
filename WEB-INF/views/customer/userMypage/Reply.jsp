<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<link href="resources/css/UserMypage/userMypageReply.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%
session = request.getSession();
UserVO user = (UserVO) session.getAttribute("user");
%>
    
     <!------- sidebar Start -------> 

        <div id="container">
            <!--  mypage navigation -->
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

            
            <section style="padding: 60px;">
                <div id="main-header">
                    <h5>커뮤니티</h5>
                    <p>내가 작성한 댓글</p>
                   <button class="btn_delete_all" onclick="location.href='deleteUserAllReply.do?uNo=${user.uNo}&tHeader=${Reply.togetherBoardVO.tHeader}'">전체삭제 </button>
                 </div> 

			<div id="replySubject-wrap">
					 <button class="heayo_btn" onclick="location.href='getUserReply.do?uNo=${user.uNo}&tHeader=함께먹어요'">함께먹어요 </button>
					 <button class="heayo_btn" onclick="location.href='getUserReply.do?uNo=${user.uNo}&tHeader=함께출퇴근해요'">함께출퇴근해요 </button>
					 <button class="heayo_btn" onclick="location.href='getUserReply.do?uNo=${user.uNo}&tHeader=함께나눠요'">함께나눠요 </button>
			</div>
				 
                <div class="User_MyReply_main">
                     <c:choose>
                      	<c:when test="${!empty tReplyList}">
                            <c:forEach var="Reply" items="${tReplyList}">
                                 <table id="User_reply_content">
                                    <tr>
                                        <td id = "tdSize">댓글 작성일 : ${Reply.trCredate}</td>
                                        <td rowspan="4">
                                       		<button class="btn_delete_one" onclick="location.href='deleteUserReply.do?trNo=${Reply.trNo}&tHeader=${Reply.togetherBoardVO.tHeader}'">삭제</button>
                                        </td> 
                                    </tr>
                                    <tr>     
                                        <td>댓글 내용 : ${Reply.trContent}</td>   
                                    </tr>
                                    <tr>     
                                        <td>카테고리 : ${Reply.togetherBoardVO.tHeader}</td>   
                                    </tr>
                                    <tr>     
                                        <td>글 제목 : ${Reply.togetherBoardVO.tTitle}</td>   
                                    </tr>
                                   </table>
                            </c:forEach>
                        </c:when>
                  		<c:otherwise>
                  			<table>
                  				<tr>     
                                     <td id="haveFun">아직 활동 전이시군요! 다양한 주제의 게시글에서 많은 사람들과 소통해보세요 :) 재밌을거에요 ☺</td>   
                                </tr>
                  			</table>
                  		</c:otherwise>
						       
					</c:choose> 

                <div id ="User_reply_bottom">
                    <!-- 페이징 -->
                    <div class="pazing_under">
                        <ul class="pagination pagination-sm">
                            <li class="page-item disabled">
                                <a class="page-link" href="#">&laquo;</a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">4</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">5</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div>
                    <!-- 날짜 검색 -->
                    <div class="box">
                        <input type="date" id="startDate" name="startDate" value="" />
                        <input type="date" id="endDate" name="EndDate" max="" />
                        <button type="submit" class="DateSubmit">전체삭제 </button>
                    </div>
               </div>
               </div>
          
            </section>
        </div>
	
