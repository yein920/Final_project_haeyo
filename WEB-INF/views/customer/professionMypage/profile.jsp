<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<title>Document</title>
  <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
  <link href="resources/css/proMypage/Profession_profile.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
  <script src="resources/js/proMypage/Profession_profile.js" defer></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99b9a8524e76961c89d8abd8820de6d6&libraries=services"></script>
  <!--  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>-->
  <script>
  $(document).ready(function(){
	  getSubcate();
	
  });
  
  function getSubcate(){
	  
	   var subcate = ${subCateJson};

	   for(let cateName in subcate){
		   if(subcate[cateName]==1){
			   console.log(cateName);
			   document.getElementById(cateName).style.display = "inline-block";
		   }
	   }
  }
   	
  </script>	


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
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${professionProfile.pPic}" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName} 전문가님</p>
                            <p id="user-email">${user.uEmail} </p>
                        </div>
                    </div>
                    <div class="pro-mypage-list" id="pro-profile">
                        <p>나의 정보</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
                            <li class="nav-item"><a class="nav-link" href="getProfile.do">나의 전문가 프로필</a></li>
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="getRsvListView.do">예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href="getCompleteView.do">완료된 일정 보기</a></li>
                            <!-- <li class="nav-item"><a class="nav-link" href=#>나를 찜한 회원??</a></li> -->
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

                <!-- profession mypage 1.pro-profile(nav기준)-->
                <section>
                    <div id="page-title">
                        <h2>나의 전문가 프로필</h2>
                    </div>
                    <!--   form start-->
                    <div id="pro-mypage-content">
                        <div id="pro-mypage-profile">
                            <div class="pro-mypage-info">
                                <div id="profile-review-box">
                                    <div id="userpic-wrapper">
                                        <img id="pro-mypage-thumb" src="/resources/image/${professionProfile.pPic}"/>
                                    </div>

                                    <div id="profile-score">
                                        <span id="username">
                                            <h3>${user.uName}</h3>
                                        </span>
                                       <div class="starWrap">
											<div id="star" data-score="${professionProfile.score}">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>	
											</div>
											
										</div>
										    <p id="score"></p>
                                           	<p id="count">총 후기 : ${professionProfile.count}개</p>
                                    </div>
                                    <div class="btn-wrap">
                                        <button class="procheck-btn">상세 보기 <i class="fas fa-arrow-right"></i></button>
                                    </div>

                                </div>
                            </div>
                            <div class="pro-mypage-info">
                                <div class="pro-info-list service-section">
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">전문 분야</span></div>
                                            <div class="content1"><span class="category-text">${professionProfile.pCategory}</span></div>
                                        </div>
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">제공 서비스</span></div>
                                            <div class="content1">
                               					  <div class="category-text subCategory" id="pToilet">화장실 청소</div>
                               					  <div class="category-text subCategory" id="pRoom">생활 청소</div>
                               					  <div class="category-text subCategory" id="pRefrigerator">냉장고 청소</div>
                               					  <div class="category-text subCategory" id="pArrangement">정리 정돈</div>
                               					  <div class="category-text subCategory" id="pHomein">입주 청소</div>
                               					  
                                                  <div class="category-text subCategory" id="pTransportation" >용달/화물 운송</div>
                                                  <div class="category-text subCategory" id="pOneroom">소형/원룸 이사</div>
                                                  <div class="category-text subCategory" id="pKeep">짐 보관</div>
                                                  
                                                  <div class="category-text subCategory" id="pWaterpipe">수도 설치/수리</div>
                               					  <div class="category-text subCategory" id="pElectric">전기 설치/수리</div>
                               					  <div class="category-text subCategory" id="pDoor">문, 창문 설치/수리</div>
                               					  <div class="category-text subCategory" id="pLiving">생활 수리</div>
                               					  <div class="category-text subCategory" id="pTrash">철거/정리</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">증명서 등록</span></div>
                                            <img class="file-image" src="/resources/image/${professionProfile.certification}">
                                        </div>
                                    </div>
                                </div>

                                <div class="pro-info-list">
                                   <!--  <div class="info-content">
                                        <div class="content1"><span class="subtitle-text">성 별</span></div>
                                        <div class="content1"><span class="category-text">${professionProfile.pGender}</span></div>
                                    </div>-->
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">한 줄 소개</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pIntroduce}</span></div>
                                    </div>
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">활동 지역</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pAddress}</span></div>
                                        <div class="box content2">
                                            <div id="map"></div>
                                            <input type="hidden" id="locx" value="${professionProfile.pLocX}" />
                                            <input type="hidden" id="locy" value="${professionProfile.pLocY}" />
                                        </div>
                                    </div>
                                </div>

                                 <div id="pro-info-btn">
                                    <input type="button" value="수정 하기" class="propage-btn" onclick="location.href='updateProfileView.do'"/>
                                    <input type="button" value="전문가 탈퇴" class="propage-btn" id="openButton"/>
                                </div>
                            </div>
                        </div>
                    </div>
               </section>
            </div>
        </div>
        
         <!--modalStart-->
        <div class="modal hidden">
            <div class="out-modal-overlay"></div>
            <div class="modal-content">
                <h3>전문가 회원을 탈퇴하시겠습니까?</h3>
                <p>${user.uName}님의 전문가 정보만 삭제되며,<br/>일반 회원 계정은 유지됩니다.</p>
                <form action="deleteProfile.do" id="deletePro" method="post">
                    <input type="hidden" name="pNo" value="${professionProfile.pNo}"/>
                </form>
                <button type="reset"class="modal-btn">취 소</button>
                <button type="submit" class="modal-btn" form="deletePro">확 인</button>
            </div>
        </div>
        <!--modalEnd-->

    </wrap>
</body>
