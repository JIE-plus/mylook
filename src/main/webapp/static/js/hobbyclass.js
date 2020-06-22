function hobbyVideo(hobbyId) {
	console.log(hobbyId);
	$.ajax({
		url : "hobbyVideo.do?hobbyId=" + hobbyId,  
		success : procResultHobbyVideo,
		error : handleError
	});	
}
function procResultHobbyVideo(responseStr) {
	$("#right").html(responseStr);
}
function handleError(xhr) {
    $(document.body).html(xhr.responseText);
}