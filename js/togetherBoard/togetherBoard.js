

function insertReply(){
	    var trContent = $('#trContent').val();
		var uNo = $('#uNo').val();
		var tNo = $('#tNo').val();
		var trParent = $('#trParent').val();
		var replyParam = {"trContent": trContent, "uNo": uNo, "tNo": tNo, "trParent":trParent};
		console.log("trParent: "+trParent+", trContent: "+trContent);
		$('#trContent').val('');
		
		$.ajax({
			url:"t_insertReply.do",
			type: "GET",
			data: replyParam,
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				html ="<div id=trNo"+result.trNo+" style='border: none; border-radius:12px; padding:5px; width:800px; height:65px; margin-top: 5px;"
			         +"margin-left: "+50*(result.trDepth)+"px; display: inline-block'>";
				html += getReplyHtml(result);
				html += "<div id='reReply"+result.trNo+"'>";
				html += 	"<input type='hidden' id='trNo' value=''>";
				html += 	"<input type='hidden' id='trParent"+result.trNo+"' value='"+result.trNo+"'>";
				html += 	"<input type='hidden' id='trDepth' value='"+result.trDepth+"'>";
				html += "</div>";
				$('#t_reply_content').append(html);
			}
		});
}

function deleteReply(trNo){
	var replyParam = {"trNo":trNo}
	console.log(replyParam);
	$.ajax({
		url:"t_deleteReply.do",
		type: "GET",
		contentType : "application/json; charset=UTF-8",
		data: replyParam,
		dataType: "json",
		success: function(result){
			console.log("result"+result);
			if(result != 0 ){
				$('#trNo'+trNo).remove();
				$('#reReply'+trNo).remove();
			}
		}
	});
}

function editReply(trNo,tNo,uPic){
	var uNick = $('#uNick'+trNo).text();
	var trContent = $('#trContent'+trNo).text();
	var trCredate = $('#trCredate'+trNo).text();
	console.log(uPic+","+uNick+","+trContent+","+trCredate);
	updateReplyInput = "<img src='/resources/image/"+uPic+".jpg' height='50' width='50' style='border-radius:25px'>"
					+"<b id='uNick"+trNo+"' style='font-size:17px'>"+uNick+"</b>&nbsp;"
					+"<input type='text' id='updateTrContent' name='updateTrContent' style='width:320px; height:35px;' value='"+trContent+"'>&nbsp;&nbsp;&nbsp;&nbsp;"
					+"<span id=trCredate"+trNo+">"+trCredate+"</span>"
					+"<button class='heayo_btn' onclick='updateReply("+trNo+");'>등록</button>"
					+"<button class='heayo_btn' onclick='cancleReply("+trNo+","+tNo+",\""+trContent+"\",\""+uPic+"\");'>취소</button>";
	$('#trNo'+trNo).html(updateReplyInput);	
}

function cancleReply(trNo,tNo,trContent,uPic){
	var uNick = $('#uNick'+trNo).text();
	var trCredate = $('#trCredate'+trNo).text();
	console.log(uPic+","+uNick+","+trContent+","+trCredate);
	updateReplyInput = "<img src='/resources/image/"+uPic+".jpg' height='50' width='50' style='border-radius:25px'>"
					+"<b id='uNick"+trNo+"' style='font-size:17px'>"+uNick+"</b>&nbsp;"
					+"<span id=trContent"+trNo+">"+trContent+"</span>&nbsp;&nbsp;&nbsp;&nbsp;"
					+"<span id=trCredate"+trNo+">"+trCredate+"</span>"
					+"<button class='heayo_btn' onclick='deleteReply("+trNo+");'>삭제</button>"
					+"<button class='heayo_btn' onclick='editReply("+trNo+","+tNo+",\""+uPic+ "\");'>수정</button>";
	$('#trNo'+trNo).html(updateReplyInput);
}

function updateReply(trNo){
	var trContent = $('#updateTrContent').val();
	var param = {"trNo":trNo, "trContent":trContent};
	console.log(param);
	$.ajax({
		url:"t_updateReply.do",
		type: "GET",
		contentType : "application/json; charset=UTF-8",
		data: param,
		success: function(result){
			console.log(result);
			var	t_reply_content = getReplyHtml(result);
			$('#trNo'+trNo).html(t_reply_content);
		}
	});
}

// 공통적인 댓글 html
function getReplyHtml(result){
	var html = "<img src='/resources/image/"+result.userVO.uPic+".jpg' height='50' width='50' style='border-radius:25px' onclick='getReReplyForm("+result.trNo+",\""+result.userVO.uPic+"\",\""+result.userVO.uNick+"\");' >"
	+"<b id='uNick"+result.trNo+"' style='font-size:17px' onclick='getReReplyForm("+result.trNo+",\""+result.userVO.uPic+"\",\""+result.userVO.uNick+"\");'>"+result.userVO.uNick+"</b>&nbsp;"
	+"<span id=trContent"+result.trNo+">"+result.trContent+"</span>&nbsp;&nbsp;&nbsp;&nbsp;"
	+"<span id=trCredate"+result.trNo+">"+result.trCredate+"</span>";
	if(result.trDepth == 0){
		html += "<button class='heayo_btn' onclick='getReReplyForm("+result.trNo+",\""+result.userVO.uPic+"\",\""+result.userVO.uNick+"\");'>댓글</button>";
	}
	html += "<button class='heayo_btn' onclick='deleteReply("+result.trNo+");'>삭제</button>";
	html += "<button class='heayo_btn' onclick='editReply("+result.trNo+","+result.tNo+",\""+result.userVO.uPic+"\");'>수정</button>";
	return html;
}

//대댓글 입력양식
function getReReplyForm(trNo, myPic, myNick){ // 여기서의 trNo는 대댓글대상의 댓글번호
	var tNo = $('#tNo').text();
	var trCredate = $('#trCredate'+trNo).text();
	console.log(myPic+","+myNick+","+trCredate);
	var getReReplyForm = "<div id='reReplyForm"+trNo+"' style='border: none; border-radius:12px; padding:5px; width:750px; height:65px; margin-top: 5px;"
		         	+"margin-left: 50px; display: inline-block'>"
					+ "<img src='/resources/image/"+myPic+".jpg' height='50' width='50' style='border-radius:25px'>"
					+"<b id='uNick"+trNo+"' style='font-size:17px'>"+myNick+"</b>&nbsp;"
					+"<input type='text' id='tRrContent' style='width:320px; height:35px;'>&nbsp;&nbsp;&nbsp;&nbsp;"
					+"<span id=trCredate"+trNo+">"+trCredate+"</span>"
					+"<button class='heayo_btn' onclick='insertReReply("+trNo+");'>등록</button>"
					+"<button class='heayo_btn' onclick='cancleReReply("+trNo+");'>취소</button>";
					+"</div>"
	$('#reReply'+trNo).append(getReReplyForm);	
	$('#reReply'+trNo).show();
}

//대댓글 입력
function insertReReply(trNo){
    var trContent = $('#tRrContent').val();
	var uNo = $('#uNo').val();
	var tNo = $('#tNo').val();
	var trParent = trNo;
	var replyParam = {"trContent": trContent, "uNo": uNo, "tNo": tNo, "trParent":trParent};
	console.log(replyParam);
	console.log("trParent: "+trParent+", trContent: "+trContent);
	$('#trContent').val('');
	
	$.ajax({
		url:"t_insertReply.do",
		type: "GET",
		data: replyParam,
		contentType : "application/json; charset=UTF-8",
		dataType: "json",
		success: function(result){
			console.log(result);
			html ="<div id=trNo"+result.trNo+" style='border: none; border-radius:12px; padding:5px; width:"+(800-50*(result.trDepth))+"px; height:65px; margin-top: 5px;"
		         +"margin-left: "+50*(result.trDepth)+"px; display: inline-block'>";
			html += getReplyHtml(result);
			$('#reReply'+trNo).html(html);
		}
	});
}


function cancleReReply(trNo){
	$('#reReplyForm'+trNo).remove();
	$('#reReply'+trNo).hide();
}


//모임참여부분
function checkJoin(tNo,tJoinNow,tJoinMax){
	console.log("tNo: "+tNo+",tJoinNow: "+tJoinNow+",tJoinMax: "+tJoinMax);
	
	var joinOrCancle= $('#tJoinButton').text();
	
	if(tJoinNow >= tJoinMax){
		alert("이미 정원이 다 찼습니다.");
	}else{
		var param = {"tNo":tNo,"joinOrCancle":joinOrCancle};
		console.log(param);
		$.ajax({
			url:"t_checkJoin.do",
			type: "GET",
			data: param,
			dataType: 'json',
			contentType : "application/json; charset=UTF-8",
			success: function(result){
				console.log(result);
				$('#tJoinNow').text(result.tJoinNow);
				if(joinOrCancle == '참여하기'){
					$('#tJoinButton').text('참여취소');
				}else if(joinOrCancle == '참여취소'){
					$('#tJoinButton').text('참여하기');
				}
				
			}
		});
	}
}

function checkBookmark(tNo){
	var bookmark = $('.tBookmark').text();
	console.log(tNo+","+bookmark);
	var param = {"tNo":tNo,"bookmark":bookmark};
	$.ajax({
		url:"t_checkBookmark.do",
		type: "GET",
		dataType: 'json',
		data: param,
		contentType : "application/json; charset=UTF-8",
		success: function(result){
			console.log(result);
			if(result == 1){
				$('.tBookmark').addClass('select');
				$('.tBookmark').text(1);
			}else if(result == 0){
				$('.tBookmark').removeClass('select');
				$('.tBookmark').text(0);
			}
		}
	});
}


