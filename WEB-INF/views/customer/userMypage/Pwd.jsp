<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="com.haeyo.biz.user.UserVO" %>
<!DOCTYPE html>
<script defer src="resources/js/userMypage/userMypagePwd.js"></script>
<link href="resources/css/UserMypage/userMypagePwd.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

   <%
   session = request.getSession();
   UserVO user = (UserVO) session.getAttribute("user");
   %>
    <wrap>
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

           <section>
                <div id="main-header">
                    <h5>나의 정보</h5>
                    <p>비밀번호 변경</p>
                </div>
                 
                    <div id="user-mypage-profile">
                        <div class="mypage-pwd">
                            <p>기존 비밀번호</p>
                               <div id="mypage-pwd-before">
                                      <form id="FromRecheckPwd">
                                       <input type="password" id="uPwd" name="" placeholder="현재 비밀번호를 입력해주세요"/> 
                                    <input type="hidden" name="" value="${user.uNo}"/> 
                                       <button id="recheck" class="modify_button_recheck" onclick="recheckPwd(); return false;">데이터확인</button>
                                    </form> 
                                    <div id="noticePwd"></div>
                               </div>
                            </div>          
                            
                            
                                        
                     <form action = "getUpdatePwdUser.do" name="form" method="post">
                           <div class="mypage-pwd">
                                   <p>새로운 비밀번호</p> 
                                    <div id="mypage-pwd-after1"> 
                                    <input type="password" id="uPwd3" name=""  value="" placeholder="영문+숫자 조합 8자리 이상 입력해주세요 "></div>  
                               </div>

                               <div class="mypage-pwd">
                                     <p>새로운 비밀번호 확인</p> 
                                    <div id="mypage-pwd-after"> 
                                    <input type="password" id="uPwd4" name="uPwd" value="" placeholder="비밀번호를 한번 더 입력해주세요"></div>  
                               </div>
                               
                               
                               <div id = "buttons">
                        <input type="hidden" name="uNo" value="${user.uNo}"/> 
                               <button class="modify_button" onclick="return pwd_check" type ="submit">수정원해요</button>
                              
                            </form>  
                               <button class="modify_button" onclick="location.href = 'mypageinfo.do'">취소하기</button>  </div>
                     
                      </div>
            </section>
        </div>
    </wrap>
