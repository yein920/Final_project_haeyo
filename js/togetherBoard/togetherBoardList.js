
	//북마크
	function tBookmark(tNo){
		var bookmark = $('#'+tNo).text();
		console.log("tNo: "+tNo+", bookmark: "+bookmark);
		var param = {"tNo":tNo,"bookmark":bookmark}; 
		$.ajax({
			url:"t_checkBookmark.do",
			type: "GET",
			contentType : "application/json; charset=UTF-8",
			data: param,
			success: function(result){
				console.log(result);
				
				if(result == 1){
					$('#'+tNo).addClass('select');
					$('#'+tNo).text(1);
				}else if(result == 0){
					$('#'+tNo).removeClass('select');
					$('#'+tNo).text(0);
				}
			}
		});
	}
	
	var uLat = 0;
	var uLon = 0;
	
	//내 위치 가져오기 부분
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	    	uLat = position.coords.latitude; // 위도
	    	uLon = position.coords.longitude; // 경도
	        console.log(uLat+","+uLon);
	        
	     // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	    	searchAddrFromCoords(uLon, uLat, displayCenterInfo);
	          
	     });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	}
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	function searchAddrFromCoords(uLon, uLat, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(uLon, uLat, callback);         
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('locMark');
	        console.log(result);
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }
	}
	
	//카테고리별 리스트
	function getTboardList(tHeader, nowPage){
		resetButtonColor();
		var param = {"tHeader": tHeader, "nowPage": nowPage, "uLat":uLat, "uLon": uLon};
		console.log(param);
		$.ajax({
			url:"t_getBoardList.do",
			type:"GET",
			contentType: "application/json; charset=UTF-8",
			data: param,
			success: function(result){
				var boardList = result.boardList;
				var paging = result.paging;
				console.log("getTboardList: "+boardList);
				
				//정렬버튼 출력
				var html1 = "<ul id='sort_buttons'>"
					+"<li><button class='sort_button heayo_btn' onclick='sortBoardList(\"조회수순\",\""+tHeader+"\",1)'>조회수순</button></li>"
					+"<li><button class='sort_button heayo_btn' onclick='sortBoardList(\"북마크 인기순\",\""+tHeader+"\",1)'>북마크 인기순</button></li>"
					+"<li><button class='sort_button heayo_btn' onclick='sortBoardList(\"남은인원 많은순\",\""+tHeader+"\",1)'>남은인원 많은순</button></li>"
					+"<li><button class='sort_button heayo_btn' onclick='sortBoardList(\"최대인원 많은순\",\""+tHeader+"\",1)'>최대인원 많은순</button></li>"
					+"</ul>";
				$('#upper_box').html(html1);
					
				//글 목록 출력
				var html2 = getCommonBoardList(boardList);
				$('#t_content_box').html(html2);
				
				//페이징 출력부분
				var html3 = "";
				html3 += '<ul class="pagination">'
				
				if(paging.startPage == 1){
					html3 += '	<li class="page-item disabled">'
					html3 += '		<a class="page-link" href="#" >&laquo;</a></li>'
				}else{
					html += '	<li class="page-item">'
					html += '		<a class="page-link" href="#" onclick="getTboardList(\''+tHeader+'\','+(paging.startPage-1)+'); return false;">&laquo;</a></li>'
				}
										
				for(i = paging.startPage; i <= paging.endPage; i++){
					html3 += '<li class="page-item '+ (paging.nowPage == i ? "active" : "") +'">'
					html3 +=   '<a class="page-link" href="#" onclick="getTboardList(\''+tHeader+'\','+i+'); return false;">'+i+'</a>'
					html3 += '</li>'
				}
				
			    if(paging.endPage == paging.lastPage){
			    	html3 += '<li class="page-item disabled">'
			    	html3 += '		<a class="page-link" href="#" >&laquo;</a></li>'
			    }else{
			    	html3 += '<li class="page-item">'
			    	html3 += '		<a class="page-link" href="#" onclick="getTboardList(\''+tHeader+'\','+(paging.endPage+1)+'); return false;">&raquo;</a></li>'
			    }
			    html3 +='</ul>';
			  
				$('#paging_box').html(html3);
			}
		});
		
		$('#writingBoard').show();
		$('#sort_buttons').show();
	}
	
	
	//검색창
	function searchBoardList(nowPage){
		if(nowPage == null){
			nowPage = 1;
		}
		var searchInput = $('#searchInput').val();
		var param = {"searchInput": searchInput,"nowPage":nowPage};
		console.log(param);
		$.ajax({
			url:"t_searchBoardList.do",
			type:"GET",  //문제
			contentType:"application/json; charset=utf-8",
			data:param,
			dataType:"json",
			success: function(result){
				console.log(result);
				var paging = result.paging;
				var boardList = result.boardList;
				
				var html= "<div style='font-size:20px'>검색결과</div>";
				//공통 출력 부분
				html += getCommonBoardList(boardList);
				$('#t_content_box').html(html);
				$('#sort_buttons').hide();
				$('#writingBoard').hide();
				
				//페이징 출력부분
				var html = "";
				html += '<ul class="pagination">'
				
				if(paging.startPage == 1){
					html += '	<li class="page-item disabled">'
					html += '		<a class="page-link" href="#" >&laquo;</a></li>'
				}else{
					html += '	<li class="page-item">'
					html += '		<a class="page-link" href="#" onclick="searchBoardList('+(paging.startPage-1)+'); return false;">&laquo;</a></li>'
				}
										
				for(i = paging.startPage; i <= paging.endPage; i++){
					html += '<li class="page-item '+ (paging.nowPage == i ? "active" : "") +'">'
					html +=   '<a class="page-link" href="#" onclick="searchBoardList('+i+'); return false;">'+i+'</a>'
					html += '</li>'
				}
				
			    if(paging.endPage == paging.lastPage){
			    	html += '<li class="page-item disabled">'
			    	html += '		<a class="page-link" href="#" >&laquo;</a></li>'
			    }else{
			    	html += '<li class="page-item">'
			    	html += '		<a class="page-link" href="#" onclick="searchBoardList('+(paging.endPage+1)+'); return false;">&raquo;</a></li>'
			    }
			    html +='</ul>';
			  
				$('#paging_box').html(html);
				$('#previewSearch').hide();
			}
		});
	}
	
	//검색창 자동완성(미리보기)
	function previewBoardList(){
		var searchInput = $('#searchInput').val();
		if(searchInput != ''){
			var param = {"searchInput": searchInput};
			console.log(param);
			$.ajax({
				url:"t_previewBoardList.do",
				type:"GET", 
				contentType:"application/json; charset=utf-8",
				data:param,
				dataType:"json",
				success: function(result){
					console.log(result);
					var html= "";
					for(i in result){
						html += "<a href='t_getBoard.do?tNo="+result[i].tNo+"'>"+result[i].tTitle+"</a></br>"
					}
					$('#previewSearch').html(html).show();
				}
			});
		}else{
			$('#previewSearch').hide();
			
		}
	} 
	
	//분류별 정렬
	function sortBoardList(sortInput, tHeader, nowPage){
		var param = {"sortInput": sortInput,"tHeader": tHeader,"nowPage": nowPage};
		console.log(param);
		console.log(event.target.classList[0]);
		var eTarget = event.target.classList[0];
		//버튼 색 변경
		if(eTarget == 'sort_button'){
			changeButtonColor(event);
		}
		$.ajax({
			url:"t_sortBoardList.do",
			type:"get",
			contentType:"application/json; charset=utf-8",
			data:param,
			dataType: "json",
			success: function(result){
				console.log(result);
				var boardList = result.boardList;
				var paging = result.paging;
				
				//공통 출력 부분
				var html = getCommonBoardList(boardList);
				$('#t_content_box').html(html);
			
				//페이징 출력부분
				var html = "";
				html += '<ul class="pagination">'
				
				if(paging.startPage == 1){
					html += '	<li class="page-item disabled">'
					html += '		<a class="page-link" href="#" >&laquo;</a></li>'
				}else{
					html += '	<li class="page-item">'
					html += '		<a class="page-link" href="#" onclick="sortBoardList(\''+sortInput+'\',\''+tHeader+'\','+(paging.startPage-1)+'); return false;">&laquo;</a></li>'
				}
										
				for(i = paging.startPage; i <= paging.endPage; i++){
					html += '<li class="page-item '+ (paging.nowPage == i ? "active" : "") +'">'
					html +=   '<a class="page-link" href="#" onclick="sortBoardList(\''+sortInput+'\',\''+tHeader+'\','+i+'); return false;">'+i+'</a>'
					html += '</li>'
				}
				
			    if(paging.endPage == paging.lastPage){
			    	html += '<li class="page-item disabled">'
			    	html += '		<a class="page-link" href="#" >&laquo;</a></li>'
			    }else{
			    	html += '<li class="page-item">'
			    	html += '		<a class="page-link" href="#" onclick="sortBoardList(\''+sortInput+'\',\''+tHeader+'\','+(paging.endPage+1)+'); return false;">&raquo;</a></li>'
			    }
			    html +='</ul>';
			  
				$('#paging_box').html(html);
			}
		});
	}
	
	//공통 리스트 출력  메서드
	function getCommonBoardList(boardList){
		var html= "";
		for(i in boardList){
			console.log(boardList[i].tBookmarkVO);
			html += "<div id='t_content'>"
			html +=	"  <div id='tAddress_Bookmark' class='clearfix'>"
			
			if(boardList[i].tDestinationVO != null){
				html += "    <div id='tAddress'>"+boardList[i].tAddress+"</div>"    //+"=>"+boardList[i].tDestinationVO.dAddress
			}else{
				html += "    <div id='tAddress'>"+boardList[i].tAddress+"</div>"
			}
			
			if(boardList[i].tBookmarkVO != null){
				html += "    	<div class='tBookmark select' id='"+boardList[i].tNo+"' onclick='tBookmark("+boardList[i].tNo+")'>1</div>"
			}else{
				html += "    	<div class='tBookmark' id='"+boardList[i].tNo+"' onclick='tBookmark("+boardList[i].tNo+")'>0</div>"
			}
			
			html += "  </div>"
			html += "  <div id='imgWrap'>"	
			html += "		<a href='t_getBoard.do?tNo="+boardList[i].tNo+"'> <img src='/WEB-INF/boardImages/"+boardList[i].tPic1+"' height='250' width='250'></a>"	
			html += "  </div>"	
			html += "  <div id='tTitle'>"+boardList[i].tTitle+"("+boardList[i].tJoinNow+"/"+boardList[i].tJoinMax+")</div>"
			html += "  <div id='tHeader'>"
			html += "		<button type='submit' class='heayo_btn'>"+boardList[i].tHeader+"</button>"
			html += "  </div>"
			html += "  <div id='t_hits'>조회"+boardList[i].tHits+"</div>"
			html += "</div>"
		}
		
		return html;
	}
	
	
	//버튼색 변경
	var div2 = document.getElementsByClassName("sort_button");
	function changeButtonColor(event){
          for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
            div2[i].classList.add("heayo_btn");
          }

          event.target.classList.add("clicked");
     }
	
	function resetButtonColor(){
		for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
            div2[i].classList.add("heayo_btn");
          }
	}
	
	