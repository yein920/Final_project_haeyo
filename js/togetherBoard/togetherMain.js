	
	//3초마다 랜덤 재배치
	   var count=0;
	   var setTimeBoardList=setInterval(function(){
	      $.ajax({
	         url:"t_getBoardMainTime.do",
	         type:"GET",
	         contentType: "application/json; charset=UTF-8",
	         success: function(result){
	            console.log(result);
	            count++;
	           
	            if(count==5){
	 		       clearInterval(setTimeBoardList);
	 		    }
	            var html = "";
	            html = getBoardList(result);
	            $('#t_content_box').html(html); 
	         }
	      });
	   }, 3000);
		   
	// 글 목록 출력
	function getBoardList(boardList){
		var html = ""
		for(i in boardList){
			console.log(boardList[i].tBookmarkVO);
			html += "<div id='t_content'>"
			html +=	"  <div id='tAddress_Bookmark' class='clearfix'>"
			html += "    <div id='tAddress'>"+boardList[i].tAddress+"</div>"
			if(boardList[i].tBookmarkVO != null){
				html += "    	<div class='tBookmark select' id='"+boardList[i].tNo+"' onclick='checkBookmark("+boardList[i].tNo+")'>1</div>"
			}else{
				html += "    	<div class='tBookmark' id='"+boardList[i].tNo+"' onclick='checkBookmark("+boardList[i].tNo+")'>0</div>"
			}
			html += "  </div>"
			html += "  <div id='imgWrap'>"	
			html += "		<a href='t_getBoard.do?tNo="+boardList[i].tNo+"'> <img src='/WEB-INF/boardImages/"+boardList[i].tPic1+"' height='250' width='250'></a>"	
			html += "  </div>"	
			html += "  <div id='tTitle'>"+boardList[i].tTitle+"</div>"
			html += "  <div id='tHeader'>"
			html += "		<button type='submit' class='heayo_btn'>"+boardList[i].tHeader+"</button>"
			html += "  </div>"
			html += "</div>"
		}
		return html;
	}
	// 북마크
	function checkBookmark(tNo){
		var bookmark = $('#'+tNo).text();
		console.log(tNo+","+bookmark);
		var param = {"tNo":tNo,"bookmark":bookmark}; //json 문자열로 만들어 넘기기때문에 잘 넘어간다.
		$.ajax({
			url:"t_checkBookmark.do",
			type: "GET",
			contentType : "application/json; charset=UTF-8",
			data: param,
			success: function(result){ //result json객체 타입으로 받아짐
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
	

	
