<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<link href="resources/css/UserMypage/04_User_mypage_reply.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

     <!------- sidebar Start -------> 

        <div id="container">
            <!-- profession mypage navigation -->
            <nav id="user-side-nav">
                <div class="user-mypage-list" id="user-info">
                    <div id="user-img-box">
                        <a href="#user-page-top">
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${user.uPic}."
                                    alt="" /></span>
                        </a>
                    </div>
                    <div id="user-info">
                        <p id="user-name">${user.uName}님, 기다렸어요:)</p>
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
                        <li class="nav-item"><a class="nav-link" href=#>완료된 서비스 내역</a></li>
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
                    <h5>해요안내</h5>
                    <p>공지사항</p>                
                </div> 

                <div class="notice_main">
                
                <div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        Accordion Item #1
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>This is the first item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
				      </div>
				    </div>
				  </div>
				 
				</div>
                
                
                     <c:choose>
                      <c:when test="${!empty notice}">
                            <c:forEach var="Reply" items="${tReplyList}">
                                 <table id="User_reply_content">
                                    <tr>
                                        <td>댓글 작성일 : ${Reply.trCredate}</td>
                                        <td rowspan="3">
                                       		<button class="btn_delete_one" onclick="location.href='deleteUserReply.do?trNo=${Reply.trNo}'">삭제</button>
                                        </td> 
                                    </tr>
                                    <tr>     
                                        <td>댓글 내용 : ${Reply.trContent}</td>   
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
              
            </div>
            </section>
        </div>
	
