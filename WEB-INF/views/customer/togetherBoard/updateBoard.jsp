<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a53c0b810ce1d051d15c474f3785be1d&libraries=services"></script>
	<link href="resources/css/togetherBoard/togetherUpdate.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
	
	<div id="contents">
		<div id="updateheader">글 수정</div>
		<div id="updateFormBox">
			<form action="t_updateBoard.do" method="post" enctype="multipart/form-data" id="updateForm">
				<div class="form-inline">
					<label for="exampleSelect1">말머리</label>
					<select class="form-control" id="tHeader" name="tHeader"  onchange="dSearchLocShow(this.value);">
						<option value="함께먹어요">함께 먹어요</option>
						<option value="함께출퇴근해요">함께 출퇴근해요</option>
						<option value="함께나눠요">함께 나눠요</option>
					</select>
				</div>	
				<div class="form-group">
	     			<label for="tTitle">제목</label>
	    			<input type="text" class="form-control" id="tTitle" name="tTitle" value="${board.tTitle}">
	  			</div>
				<div class="form-inline">
   					<label>모임 장소</label><br>
                      <input type="text" id="searchLoc1" name="tAddress" class="form-control" value="${board.tAddress}"/><input type="button" id="searchBtn1"
                          onclick="PostCode()" value="주소 검색" class="btn btn-primary"/>
                    <div id="map"></div>
                    <input type="hidden" id="tLocX" name="tLocX" value="${board.tLocX}" />
                    <input type="hidden" id="tLocY" name="tLocY" value="${board.tLocY}" />
	  			</div>
	  			<c:if test="${board.tHeader == '함께출퇴근해요'}">
		  			<div class="form-inline" id="dSearchLoc">
	   					<label>도착 장소</label><br>
	                      <input type="text" id="searchLoc2" name="dAddress" class="form-control" value="${board.tDestinationVO.dAddress}"/><input type="button" id="searchBtn1"
	                          onclick="PostCode2()" value="주소 검색" class="btn btn-primary"/>
	                    <div id="map2"></div>
	                    <input type="hidden" id="dLocX" name="dLocX" value="${board.tDestinationVO.dLocX}" />
	                    <input type="hidden" id="dLocY" name="dLocY" value="${board.tDestinationVO.dLocY}" />
		  			</div>
		  		</c:if>
				<div class="form-group">
	     			<label for="tJoinDate">날짜</label>
	    			<input type="datetime-local" class="form-control" id="tJoinDate" name="tJoinDate" value="${board.tJoinDate}">
	  			</div>
	  			<div class="form-inline">
					<label for="tJoinMax">참여가능 인원수</label>
					<select class="form-control" id="tJoinMax" name="tJoinMax">
						   <option>1</option>
						   <option>2</option>
						   <option>3</option>
						   <option>4</option>
						   <option>5</option>
						   <option>6</option>
						   <option>7</option>
						   <option>8</option>
						   <option>9</option>
						   <option>10</option>
					</select>
				</div>	
				<div class="form-group">
					<label for="tContent">내용</label>
					<textarea class="form-control" id="tContent" name="tContent" cols="20" rows="8">${board.tContent}</textarea>
				</div>
				<div class="form-group">
					<label for="uploadFile1">썸네일 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1" onchange="loadFile(event);">
					
					<div id="befoFile1">이전 파일: ${board.tPic1}</div>
					<div id="tPic1"><img class="image_preview" src="/WEB-INF/boardImages/${board.tPic1}" height="200" width="350"></div>
					<input type="hidden" value="${board.tPic1}" id="tPicHidden1" name="tPic1">
				</div>
				<div class="form-group">
					<label for="uploadFile2">내용사진 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2" onchange="loadFile(event);">
					
					<div id="befoFile2">이전 파일: ${board.tPic2}</div>
					<div id="tPic2"><img class="image_preview" src="/WEB-INF/boardImages/${board.tPic2}" height="200" width="350"></div>
					<input type="hidden" value="${board.tPic2}" id="tPicHidden2" name="tPic2">
				</div>
				<input type="hidden" id="tNo" name="tNo" value="${board.tNo}">
				<div id="updatebutton">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" onclick="location.href='t_openBoardList.do?tHeader=${board.tHeader}'" class="btn btn-primary">취소</button>
				</div>
			</form>
		</div>
	</div>	
 <script src="resources/js/togetherBoard/togetherUpdate.js?v=<%=System.currentTimeMillis()%>"></script>
 <script>
	$(document).ready(function(){
		
		var tHeader = '${board.tHeader}'; 
		var tJoinMax = '${board.tJoinMax}';
		console.log(tHeader+","+tJoinMax);	
		
		$('#tHeader').val(tHeader).attr('selected',true);
		$('#tJoinMax option:eq('+(tJoinMax-1)+')').attr('selected',true);
		
		var tHeader = '${board.tHeader}';
		var tLocX = '${board.tLocX}';
		var tLocY = '${board.tLocY}';
		var dLocX = '${board.tDestinationVO.dLocX}';
		var dLocY = '${board.tDestinationVO.dLocY}';
		console.log(tHeader+","+tLocX+","+tLocY+","+dLocX+","+dLocY);
		
		if(tHeader == '함께출퇴근해요'){
			getMap();
			getMap2();
		}else{
			getMap();
		}
		
		function getMap(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(tLocX, tLocY), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(tLocX, tLocY); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			// 지도를 보여준다.
            mapContainer.style.display = "block";
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		}
		
		function getMap2(){
			var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(dLocX, dLocY), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map2 = new kakao.maps.Map(mapContainer2, mapOption); // 지도를 생성합니다
		
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(dLocX, dLocY); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			mapContainer2.style.display = "block";
			map2.relayout();
			marker.setMap(map);
		}
		
	});
</script>
