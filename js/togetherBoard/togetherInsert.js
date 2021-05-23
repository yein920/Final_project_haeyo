	$(document).ready(function(){
		$('#image_preview').hide();
	});
	
	var tHeader = "";
	
	function formCheck(){
		var tTitle = $('#tTitle').val();
		var tLocX = $('#tLocX').val();
		var dLocX = $('#dLocX').val();
		var tJoinDate = $('#tJoinDate').val();
		var tContent = $('#tContent').val();
		var uploadFile1 = $('#uploadFile1').val();
		var uploadFile2 = $('#uploadFile2').val();
		console.log(tTitle+","+tLocX+","+dLocX);
		console.log(tJoinDate+","+tContent);
		console.log(uploadFile1+","+uploadFile2);
		
		if(tTitle == null || tTitle == ""){
			alert('제목을 입력하세요.')
			return false;
		}
		if(tLocX == null || tLocX == ""){
			alert('모임장소를 입력하세요.')
			return false;
		}
		
		if(tHeader == '함께출퇴근해요'){
			if(dLocX == null || dLocX == ""){
				alert('도착장소를 입력하세요.')
				return false;
			}
		}
		
		if(tJoinDate == null || tJoinDate == ""){
			alert('날짜를 입력하세요.')
			return false;
		}
		if(tContent == null || tContent == ""){
			alert('내용을 입력하세요.')
			return false;
		}
		if(uploadFile1 == null || uploadFile1 == ""){
			alert('썸네일을 업로드하세요.')
			return false;
		}
		if(uploadFile2 == null || uploadFile2 == ""){
			alert('내용 사진을 업로드하세요.')
			return false;
		}
		
		return true;
	}
	

	function dSearchLocShow(tHeaderValue){
		tHeader = tHeaderValue;
		if(tHeaderValue == '함께출퇴근해요'){
			var html = "";
			html += '<label>도착 장소</label><br>';
			html += ' <input type="text" id="searchLoc2" name="dAddress" value="" class="form-control" /><input type="button" id="searchBtn2" onclick="PostCode2()" value="주소 검색" class="btn btn-primary"/>';
			html += '<div id="map2"></div>';
			html += '<input type="hidden" id="dLocX" name="dLocX" value="" />';
			html += '<input type="hidden" id="dLocY" name="dLocY" value="" />';
			$('#dSearchLoc').html(html);
		}else{
			var html = "";
			$('#dSearchLoc').html(html);
		}
	}
	
	function loadFile(event){
		var uploadWrap = event.target.parentNode;
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var newImg = document.createElement("img");
			
			uploadWrap.appendChild(newImg);
			newImg.setAttribute("src", event.target.result);
			newImg.setAttribute("id", "image_preview");
		};
		reader.readAsDataURL(event.target.files[0]);	
	}
	

	/*지도 */
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
    
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(37.537187, 127.005476),
	    map: map
	});
	
	/*우편번호 찾기 */
	const tLocX = document.getElementById('tLocX');
	const tLocY = document.getElementById('tLocY');
	
	function PostCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = data.address; // 최종 주소 변수
	            console.log(addr);
	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("searchLoc1").value = addr;
	            // 주소로 상세 정보를 검색
	            console.log(geocoder);
	            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
	                if (status === daum.maps.services.Status.OK) {
	                    var result = results[0]; //첫번째 결과의 값을 활용
	                    console.log(result);
	                    // 해당 주소에 대한 좌표를 받아서
	                    var coords = new daum.maps.LatLng(result.y, result.x);
	                    console.log(result.y);
	                    // 태그에 좌표값을 넣어준다.
                        tLocX.setAttribute("value",result.y);
	                    tLocY.setAttribute("value",result.x);
	                    // 지도를 보여준다.
	                    mapContainer.style.display = "block";
	                    map.relayout();
	                    // 지도 중심을 변경한다.
	                    map.setCenter(coords);
	                    // 마커를 결과값으로 받은 위치로 옮긴다.
	                    marker.setPosition(coords)
	                }
	            });
	            
	        }
	    }).open();
	}
	

	function PostCode2() {
		
		var dLocX = document.getElementById('dLocX');
		var dLocY = document.getElementById('dLocY');
		
		var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		    
		//지도를 미리 생성
		var map2 = new daum.maps.Map(mapContainer2, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.537187, 127.005476),
		    map: map2
		});
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = data.address; // 최종 주소 변수
	            console.log(addr);
	            // 주소 정보를 해당 필드에 넣는다.
	            
	             document.getElementById("searchLoc2").value = addr;
	            // 주소로 상세 정보를 검색
	            console.log(geocoder);
	            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
	                if (status === daum.maps.services.Status.OK) {
	                    var result = results[0]; //첫번째 결과의 값을 활용
	                    console.log(result);
	                    // 해당 주소에 대한 좌표를 받아서
	                    var coords = new daum.maps.LatLng(result.y, result.x);
	                    console.log(result.y);
	                    // 태그에 좌표값을 넣어준다.
	                 
                    	dLocX.setAttribute("value",result.y);
		                dLocY.setAttribute("value",result.x);
		                // 지도를 보여준다.
		                mapContainer2.style.display = "block";
	                   
	                    map2.relayout();
	                    // 지도 중심을 변경한다.
	                    map2.setCenter(coords);
	                    // 마커를 결과값으로 받은 위치로 옮긴다.
	                    marker.setPosition(coords)
	                }
	            });
	            
	        }
	    }).open();
	}