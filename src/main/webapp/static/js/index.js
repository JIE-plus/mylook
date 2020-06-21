function indexSort(module,sort,hobby){
	
	var procResultSortVideo = null;
	
	if(module == 1){
		procResultSortVideo = procResultSortVideoFirst;
	}else if(module == 2){
		procResultSortVideo = procResultSortVideoSecond;
	}else if(module == 3){
		procResultSortVideo = procResultSortVideoThird;
	}else if(module == 4){
		procResultSortVideo = procResultSortVideoFourth;
	}
	
	$.ajax({
        url : "indexSort.do?module=" + module + "&sort=" + sort + "&hobby=" + hobby,
        success : procResultSortVideo,
        error : handleError
    });
}

function procResultSortVideoFirst(responseStr){
	$("#first-sort").html(responseStr);
}

function procResultSortVideoSecond(responseStr){
	$("#second-sort").html(responseStr);
}

function procResultSortVideoThird(responseStr){
	$("#third-sort").html(responseStr);
}

function procResultSortVideoFourth(responseStr){
	$("#fourth-sort").html(responseStr);
}

function handleError(xhr) {
    $(document.body).html(xhr.responseText);
}