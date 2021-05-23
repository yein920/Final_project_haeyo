<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>proMypageUpdate</title>
  <link href="resources/css/header.css" rel="stylesheet">
  <link href="resources/css/proMypage/Profession_profile_update.css??v=<%=System.currentTimeMillis()%>" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75d6c9cf371d5f0cd64d40592c350582&libraries=services"></script>
  <script src="resources/js/proMypage/Profession_profileUpdate.js?v=<%=System.currentTimeMillis()%>" defer></script>
  <script > 
  var pcate = "${profession.pCategory}"

  $(document).ready(function(){
	  categoryInit();
	  loadstar();
  });
  
  function categoryInit(){
	 $("input:radio[name='pCategory']").each(function() { //순회 처리 
	      console.log(this.value);
		  if(this.value == pcate){  //값 비교 
	            this.checked = true;  //checked 처리
	       };
	    });
	}
 
  function loadstar(){
		var star = $('#star');
		var score = star.attr('data-score');
		console.log(score);
		
		//별점 찍기
		star.each(function(){
			var starScore = Math.floor(score);
			console.log(starScore);
			
			star.find('svg:nth-child(-n+'+starScore+')').css({color:'#ffe327'});
		});
		
		//score 값넣기
		var scoretxt = Math.round(score*10) / 10 ;
		console.log(scoretxt);
		document.getElementById('score').innerText = '평 점 : '+ scoretxt;
		
	}

  
  //$("#toilet").val() = "${profession.professionsCleaningVO.pToilet}" 
  //$("#room").val() = "${profession.professionsCleaningVO.pRoom}"
  //$("#refrigerator").val() = "${profession.professionsCleaningVO.pRefrigerator}" 
  //$("#arrangement").val()= "${profession.professionsCleaningVO.pArrangement}" 
  //$("#Homein").val() = "${profession.professionsCleaningVO.pHomein}" 
  //var trans_val = "${profession.professionsMovingVO.pTransportation}" 
  //var oneroom_val = "${profession.professionsMovingVO.pOneroom}"
  //var keep_val = "${profession.professionsMovingVO.pKeep}"
  //var waterpipe_val = "${profession.professionsRepairVO.pWaterpipe}" 
  //var elec_val = "${profession.professionsRepairVO.pElectric}"
  //var door_val = "${profession.professionsRepairVO.pDoor}" 
  //var living_val = "${profession.professionsRepairVO.pLiving}" 
  //var trash_val = "${profession.professionsRepairVO.pTrash}"
  
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
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${profession.pPic}" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName} 전문가님</p>
                            <p id="user-email">${user.uEmail}</p>
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
                            <li class="nav-item"><a class="nav-link" href="getReservationList.do">예약된 일정 보기</a></li>
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
                      <form action="updateProfile.do" method="post" id="pro-mypage-profile" enctype="multipart/form-data">
                        <input type="hidden" name="pNo" value="${profession.pNo}"/>
                        
                            <div class="pro-mypage-info">
                                <div id="profile-review-box">
                                    <div id="userpic-wrapper">
                                        <img id="thumb-img" name="pPic" src="/resources/image/${profession.pPic}" />
                                        <label class="click-icon" for="user-thumb"><i class="fas fa-camera"></i></label>
                                        <input type="file" name="file_pic" id="user-thumb" class="upload-box upload-plus"
                                           value="/resources/image/${profession.pPic}" accept="image/*" onchange="thumbnail(event)">
                                    </div>

                                    <div id="profile-score">
                                        <span id="username">
                                            <h3> ${user.uName}</h3>
                                        </span>
                                        <div class="starWrap">
											<div id="star" data-score="${profession.score}">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>	
											</div>
										</div>
									    <p id="score"></p>
                                        <p id="count">총 후기 : ${profession.count}개</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="pro-mypage-info">
                                <div class="pro-info-list service-section">
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">전문 분야</span></div>
                                            <div class="content1">
                                                <span class="category-text">
                                                  <label for="cleaning" class="checklabel">청 소</label>
                                                  <input class="category" id="cleaning" type="radio" value="청소" name="pCategory" onchange="setDisplay()">
                                                </span>
                                                <span class="category-text">
                                                    <label for="moving" class="checklabel">이 사</label>
                                                    <input class="category" id="moving" type="radio" value="이사" name="pCategory" onchange="setDisplay()" >
                                                  </span>
                                                <span class="category-text">
                                                    <label for="repair" class="checklabel">수 리</label>
                                                    <input class="category" id="repair" type="radio" value="수리" name="pCategory" onchange="setDisplay()">
                                                </span>
                                            </div>
                                        </div>
                                        
                                         <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">제공 서비스</span></div>
                                            <div class="content1" id="cleaning-service" >
                                                <span class="category-text">
                                                   <label for="toilet" class="checklabel">화장실 청소</label>
                                                   <input class="subcategory" id="toilet" type="checkbox" value="" name="pToilet" >
                                                </span>
                                                <span class="category-text">
                                                   <label for="room" class="checklabel">생활 청소</label>
                                                   <input class="subcategory" id="room" type="checkbox" value="" name="pRoom" >
                                                </span>
                                                <span class="category-text">
                                                   <label for="refrigerator" class="checklabel">냉장고 청소</label>
                                                   <input class="subcategory" id="refrigerator" type="checkbox" value="" name="pRefrigerator" >
                                                </span>
                                                <span class="category-text">
                                                   <label for="arrangement" class="checklabel">정리 정돈</label>
                                                   <input class="subcategory" id="arrangement" type="checkbox" value="" name="pArrangement" >
                                                </span>
                                                <span class="category-text">
                                                   <label for="homein" class="checklabel">입주 청소</label>
                                                   <input class="subcategory" id="homein" type="checkbox" value="" name="pHomein" >
                                                </span>
                                            </div>

                                            <div class="content1" id="moving-service">
                                                <span class="category-text">
                                                    <label for="transportation" class="checklabel">용달/화물 운송</label>
                                                    <input class="subcategory" id="transportation" type="checkbox" value="" name="pTransportation" >
                                                </span>
                                                <span class="category-text">
                                                    <label for="oneroom" class="checklabel">소형/원룸 이사</label>
                                                    <input class="subcategory" id="oneroom" type="checkbox" value="" name="pOneroom" >
                                                </span>
                                                <span class="category-text">
                                                    <label for="keep" class="checklabel">짐 보관</label>
                                                    <input class="subcategory" id="keep" type="checkbox" value="" name="pKeep" >
                                                </span>
                                           </div>
                                           
                                          <div class="content1" id="repair-service">
                                             <span class="category-text" >
                                                <label for="waterpipe" class="checklabel">수도 설치/수리</label>
                                                <input class="subcategory" id="waterpipe" type="checkbox" value="" name="pWaterpipe" >
                                             </span>
                                             <span class="category-text">
                                                <label for="electric" class="checklabel">전기 설치/수리</label>
                                                <input class="subcategory" id="electric" type="checkbox" value="" name="pElectric" >
                                             </span>
                                             <span class="category-text">
                                                <label for="door" class="checklabel">문,창문 설치/수리</label>
                                                <input class="subcategory" id="door" type="checkbox" value="" name="pDoor" >
                                             </span>
                                             <span class="category-text">
                                                <label for="living" class="checklabel">생활 수리</label>
                                                <input class="subcategory" id="living" type="checkbox" value="" name="pLiving" >
                                             </span>
                                             <span class="category-text">
                                                <label for="trash" class="checklabel">철거/정리</label>
                                                <input class="subcategory" id="trash" type="checkbox" value="" name="pTrash">
                                             </span>
                                           </div>
                                         
                                        </div>
                                    </div>
                                        
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">증명서 등록</span></div>
                                             <input type="file" name="file_cert" class="form-control" value="/resources/image/${profession.certification}" accept="image/*" onchange="certification(event)">
                                             <img id="file-img" src="/resources/image/${profession.certification}">
                                        </div>
                                    </div>
                                </div>

                                <div class="pro-info-list">
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">한 줄 소개</span></div>
                                        <div class="content2"><textarea class="form-control" name="pIntroduce">${profession.pIntroduce}</textarea></div>
                                    </div>
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">활동 지역</span></div>
                                        
                                        <div class="box content2">
                                            <input type="text" id="searchLoc" name="pAddress" value="${profession.pAddress}"/>
                                            <input type="button" id="searchBtn" onclick="Postcode()" value="주소 검색"/>
                                            <div id="map"></div>
                                            <input type="hidden" id="locx" name="pLocX" value="${profession.pLocX}"/>
                                            <input type="hidden" id="locy" name="pLocY" value="${profession.pLocY}"/>
                                        </div>
                                    </div>
                                </div>

                                 <div id="pro-info-btn">
                                    <input type="reset" value="취 소" class="update-btn" />
                                    <input type="submit" value="저장하기" class="update-btn" />
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>

    </wrap>
</body>
</html>