
$(document).ready(function(){
    	$('#reviewModal').hide();
});
    
    
function modal(data1, data2){
	var no1 = data1;
	var no2 = data2;
	console.log(no1, no2);
	
	$('#reviewModal').show(function(){
		console.log(no1, no2);
		$('input[name=rsvNo]').val(no1);
		$('input[name=pNo]').val(no2);
	});
	
	$('#close-modal-btn').on('click', function(){
		$('#reviewModal').hide();
	});
}




//$(document).ready(function(){
//    $("#rsv-update").hide();
//    $("#rsv-update-btn").on("click", function(){
//        $("#rsv-update").toggle();
//   });
//});


//// delete modal창
//const openButton = document.getElementById("rsv-delete-btn");
//const modal = document.querySelector(".modal");
//const overlay = modal.querySelector("#out-modal-overlay");
//const closeBtn = modal.querySelector("button");
//
//const openModal = ()=> {
//    modal.classList.remove("hidden");
//}
//const closeModal = ()=> {
//    modal.classList.add("hidden");
//}
//overlay.addEventListener("click", closeModal);
//closeBtn.addEventListener("click", closeModal);
//openButton.addEventListener("click", openModal);


// function bottomArea(){
//    $("#rsv-update-btn").on("click", function(){
//         $("#rsv-update").toggle();
//    });
// }
