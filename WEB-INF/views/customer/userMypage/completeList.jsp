<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전문가 예약 일정리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="resources/css/UserMypage/user_completeList.css" rel="stylesheet">
    <script src="resources/js/userMypage/user_completeList.js" defer></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script>
  
   </script>
</head>

<body>
    <wrap>

        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block">
                                   <img id="img-user-pic" src="/resources/image/${user.uPic}.jpg" alt="유저 사진" />
                                </span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName}님, 기다렸어요:)</p>
                            <p id="user-email">${user.uEmail}</p>
                        </div>
                    </div>
                    <div class="pro-mypage-list" id="pro-profile">
                        <p>나의 정보</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="mypageinfo.do">나의 회원 정보</a></li>
                            <li class="nav-item"><a class="nav-link" href="getProfile.do">나의 전문가 프로필</a></li>
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>커뮤니티</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>내가 작성한 글</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>내가 작성한 댓글</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>나의 찜한 글</a></li>

                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="getUserRsvList.do">예약한 서비스 일정</a></li>
                            <li class="nav-item"><a class="nav-link" href="getUserComList.do">완료된 서비스 내역</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>내가 찜한 전문가 보기</a></li>

                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="haeyo-info">
                        <p>해요 안내</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
                            <li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- profession mypage navigation -->

                <!------------- main: user_reservation --------------->
                <section>
				    <div id="page-title">
				        <h2>완료된 서비스 리스트</h2>
				    </div>
				    <div id="user-rsv-page">
				        <div class="rsv-count">
				            <p>지난 서비스 내역 <span class="total-rsv">${comCount}</span> 건</p>
				        </div>
				        <c:forEach var="userCom" items="${userComList}">
				            <div class="user-rsv-list">
				                <div class="user-rsv-content">
				                    <p class="rsv-no">예약 번호 no.${userCom.rsvNo}</p>
				                    <div class="propic-wrapper">
				                        <img class="pro-mypage-thumb" src="/resources/image/${userCom.professionVO.pPic}" alt="" />
				                    </div>
				                    <div class="rsv_info">
				                        <span class="pro-name">
				                            <h3>전문가 : ${userCom.pName}</h3>
				                        </span>
				                        <p>신청 서비스 : ${userCom.rsvCategory} | 
											<span class="subcateTXT">
											    ${userCom.reservationSubCate.rsvToilet}
											    ${userCom.reservationSubCate.rsvRoom}
											    ${userCom.reservationSubCate.rsvRefrigerator}
											    ${userCom.reservationSubCate.rsvArrangement}
											    ${userCom.reservationSubCate.rsvHomein}
											    ${userCom.reservationSubCate.rsvTransportation}
											    ${userCom.reservationSubCate.rsvOneroom}
											    ${userCom.reservationSubCate.rsvKeep}
											    ${userCom.reservationSubCate.rsvWaterpipe}
											    ${userCom.reservationSubCate.rsvElectric}
											    ${userCom.reservationSubCate.rsvDoor}
											    ${userCom.reservationSubCate.rsvLiving}
											    ${userCom.reservationSubCate.rsvTrash}
											</span>
				                        </p>
				                        <p>신청 일자 : ${userCom.rsvCredate}</p>
				                        <p>완료된 서비스 일정 : ${userCom.rsvDate}</p>
				                        <p>예약 주소 : ${userCom.rsvLoc}</p>
				                    </div>
				                    <div class="btn-wrap">
				                        <div class="pro-detail-btn">
				                            <button class="procheck-btn" onclick='location.href="detail.do?pNo=${userCom.pNo}&pCategory=${userCom.rsvCategory}"'>전문가 상세 보기<i class="fas fa-arrow-right"></i></button>
				                        </div>
				                        <div class="pro-info-btn">
				                            <input type="button" value="예약 상세" class="propage-btn" id="rsv-detail-btn" onclick="detail()" />
				                            <input type="button" value="일정 완료" class="propage-btn" id="rsv-complete-btn" onclick="modal('${userCom.rsvNo}','${userCom.pNo}')"/>
				                        </div> 
				                   </div>
				                </div>
				           </div>
				        </c:forEach>                
				    </div>
				    <div class="review-modal" id="reviewModal" >
					    <div id="modal-content">
					        <form action="insertReview.do" method="POST" id="insertReview">
					            <input type="hidden" value="${user.uNo}" name="uNo"/>
					            <input type="hidden" value="" name="pNo"/>
					            <input type="hidden" value="" name="rsvNo"/>
					           <h3>일정을 완료하시겠습니까?</h3>
					           <p>서비스에 대한 후기를 남겨주세요.</p>
					           <span id="star"> 
					                <input type="radio" value="1" name="score">★</input>
					                <input type="radio" value="2" name="score">★★</input> 
					                <input type="radio" value="3" name="score">★★★</input> 
					                <input type="radio" value="4" name="score">★★★★</input> 
					                <input type="radio" value="5" name="score">★★★★★</input> 
					            </span> 
					            <textarea id="review" name="reviewContent"></textarea>
					        </form>
					        <button type="reset" class="modal-btn" id="close-modal-btn">취 소</button>
					        <button type="submit" class="modal-btn" form="insertReview">확 인</button>
					    </div>
					</div>
				    <!-- 완료된 페이지 조정 -->
				    <br/>
				    <hr style="border-top: 1px solid #dddddd;">
					<div id="user-rsv-page">
				        <div class="rsv-count">    	
				            <p>완료된 서비스 내역 <span class="total-rsv">${endCount}</span> 건</p>
				        </div>
				        <c:forEach var="userEnd" items="${userEndList}">
				            <div class="user-rsv-list">
				                <div class="user-rsv-content">
				                    <p class="rsv-no">예약 번호 no.${userEnd.rsvNo}</p>
				                    <div class="propic-wrapper">
				                        <img class="pro-mypage-thumb" src="/resources/image/${userEnd.professionVO.pPic}" alt="" />
				                    </div>
				                    <div class="rsv_info">
				                        <span class="pro-name">
				                            <h3>전문가 : ${userEnd.pName}</h3>
				                        </span>
				                        <p>신청 서비스 : ${userEnd.rsvCategory} |
				                        	<span class="subcateTXT">
											    ${userEnd.reservationSubCate.rsvToilet}
											    ${userEnd.reservationSubCate.rsvRoom}
											    ${userEnd.reservationSubCate.rsvRefrigerator}
											    ${userEnd.reservationSubCate.rsvArrangement}
											    ${userEnd.reservationSubCate.rsvHomein}
											    ${userEnd.reservationSubCate.rsvTransportation}
											    ${userEnd.reservationSubCate.rsvOneroom}
											    ${userEnd.reservationSubCate.rsvKeep}
											    ${userEnd.reservationSubCate.rsvWaterpipe}
											    ${userEnd.reservationSubCate.rsvElectric}
											    ${userEnd.reservationSubCate.rsvDoor}
											    ${userEnd.reservationSubCate.rsvLiving}
											    ${userEnd.reservationSubCate.rsvTrash}
											</span>
				                        </p>
				                        <p>신청 일자 : ${userEnd.rsvCredate}</p>
				                        <p>완료된 서비스 일정 : ${userEnd.rsvDate}</p>
				                        <p>예약 주소 : ${userEnd.rsvLoc}</p>
				                    </div>
				                    <div class="btn-wrap">
				                        <div class="pro-detail-btn">
				                            <button class="procheck-btn" onclick='location.href="detail.do?pNo=${userEnd.pNo}&pCategory=${userEnd.rsvCategory}"'>전문가 상세 보기<i class="fas fa-arrow-right"></i></button>
				                        </div>
				                        <div class="pro-info-btn">
				                            <input type="button" value="예약 상세" class="propage-btn" id="rsv-detail-btn" onclick="location.href='#'" />
				                        </div> 
				                   </div>
				                </div>
				           </div>
				        </c:forEach>                
				    </div>		    
				    
				</section>
            </div>
        </div>
    </wrap>
</body>
</html>