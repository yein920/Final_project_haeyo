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
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="resources/css/header.css" rel="stylesheet">
    <link href="resources/css/UserMypage/user_reservationList.css" rel="stylesheet">
    <script src="resources/js/userMypage/user_reservationList.js" defer></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
                        <h2>전문가 예약 리스트</h2>
                    </div>
                    <div id="user-rsv-page">
                        <div id="rsv-count">
                            <p>전체 예약 일정 <span id="total-rsv">${rsvCount}</span> 건</p>
                        </div>
                        <c:forEach var="userRsv" items="${userRsvList}"  varStatus="vs">
                            <div class="user-rsv-list">
                                <div class="user-rsv-content">
                                    <p class="rsv-no">예약 번호 no.${userRsv.rsvNo}</p>
                                    <div class="propic-wrapper">
                                        <img class="pro-mypage-thumb" src="/resources/image/${userRsv.professionVO.pPic}" alt="" />
                                    </div>
                                    <div class="rsv_info">
                                        <span id="pro-name">
                                            <h3>전문가 : ${userRsv.pName}</h3>
                                        </span>
                                        <p>신청 서비스 : ${userRsv.rsvCategory} | 
                                        	<span class="subcateTXT">
											    ${userRsv.reservationSubCate.rsvToilet}
											    ${userRsv.reservationSubCate.rsvRoom}
											    ${userRsv.reservationSubCate.rsvRefrigerator}
											    ${userRsv.reservationSubCate.rsvArrangement}
											    ${userRsv.reservationSubCate.rsvHomein}
											    ${userRsv.reservationSubCate.rsvTransportation}
											    ${userRsv.reservationSubCate.rsvOneroom}
											    ${userRsv.reservationSubCate.rsvKeep}
											    ${userRsv.reservationSubCate.rsvWaterpipe}
											    ${userRsv.reservationSubCate.rsvElectric}
											    ${userRsv.reservationSubCate.rsvDoor}
											    ${userRsv.reservationSubCate.rsvLiving}
											    ${userRsv.reservationSubCate.rsvTrash}
											</span>
                                        </p>
                                        <p>신청 일자 : ${userRsv.rsvCredate}</p>
                                        <p>예약된 서비스 일정 : ${userRsv.rsvDate}</p>
                                        <p>예약 주소 : ${userRsv.rsvLoc}</p>
                                    </div>
                                    <div class="btn-wrap">
                                        <div class="pro-detail-btn">
                                            <button class="procheck-btn" onclick='location.href="detail.do?pNo=${userRsv.pNo}&pCategory=${userRsv.rsvCategory}"'>전문가 상세 보기<i class="fas fa-arrow-right"></i></button>
                                        </div>
                                        <div id="pro-info-btn">
                                            <input type="button" value="일정 수정" class="propage-btn" id="rsv-update-btn"/>
                                            <input type="button" value="예약 취소" class="propage-btn" id="rsv-delete-btn" onclick="modal(${userRsv.rsvNo})"/>
                                            <input type="button" value="예약 상세" class="propage-btn" id="rsv-info-btn" onclick="datail()" />
                                        </div>
	                                </div>
	                             </div>
	                           </div>
	                     </c:forEach>                
	                     </div>
                             
                 <div class="delmodal" id="deleteModal" >
                   <!--   <div id="out-modal-overlay"></div> -->
                        <div id="modal-content">
                             <h3>선택하신 예약 일정을 취소하시겠습니까?</h3>
                             <p> 확인 클릭 시, 예약이 취소 처리됩니다.</p>
                             <div id="delete-ask-btn"> 
                                <form action="deleteReservation.do" id="deleteRSV" method="post">
                                     <input type="hidden" name="rsvNo" value=""/>
                                </form>
                                <button type="reset" class="modal-btn" id="close-modal-btn">취 소</button>
                                <button type="submit" class="modal-btn" form="deleteRSV">확 인</button>    
                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </div>
    </wrap>
</body>
</html>