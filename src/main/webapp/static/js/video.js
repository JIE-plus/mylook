var currentPage = 1;//当前页
var lastPage = 0;//最后页
var commentCount = 0;//评论数



$(document).ready(function() {
    
	$(function () {
		   $('[data-toggle="tooltip"]').tooltip()
	});
	
	monitorPage();
	
	var li = $(".pagination").children("li");
	lastPage = li.size()/2 - 2;
	
	commentCount = parseInt($(".comment-input").val());
	
	pageNav(commentCount);

});

/*
 * 发起关注的请求
 */
function getFollow(path,videoId,userId){
	$.ajax({
		url : "follow.do?path=" + path + "&videoId=" + videoId + "&followUserId=" + userId + "&isUserFollow=y",  
		success : procResultGetFollow,
		error : handleError
	});	
}

function procResultGetFollow(responseStr){
	
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isFollow = responseJson.result;
	if(isFollow == false){
		window.location.href = "login.view";
	}else{
		var resultBoolean = isFollow.resultBoolean;
		if(resultBoolean){
			var resultInt = isFollow.resultInt;
			$("#fans").html(resultInt);
			$("#follows-btn-one").css("display","none");
			$("#follows-btn-two").css("display","block");
			var followsBtnThree = document.getElementById("follows-btn-three");
			if(followsBtnThree != null){
				$("#follows-btn-three").css("display","none");
			}
			var followsBtnFour = document.getElementById("follows-btn-four");
			if(followsBtnFour != null){
				$("#follows-btn-four").css("display","block");
			}
		}else{
			return;
		}
		
	}
}

/*
 * 发起取消关注的请求
 */
function deleteFollow(path,videoId,userId){
	$.ajax({
		url : "follow.do?path=" + path + "&videoId=" + videoId + "&followUserId=" + userId + "&isUserFollow=n",  
		success : procResultDeleteFollow,
		error : handleError
	});	
}

function procResultDeleteFollow(responseStr){
	
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isFollow = responseJson.result;
	if(isFollow == false){
		//其实可以不用
		window.location.href = "login.view";
	}else{
		var resultBoolean = isFollow.resultBoolean;
		
		if(resultBoolean){
			var resultInt = isFollow.resultInt;
			$("#fans").html(resultInt);
			$("#follows-btn-one").css("display","block");
			$("#follows-btn-two").css("display","none");
			var followsBtnThree = document.getElementById("follows-btn-three");
			if(followsBtnThree != null){
				console.log("1111");
				$("#follows-btn-three").css("display","block");
			}
			var followsBtnFour = document.getElementById("follows-btn-four");
			if(followsBtnFour != null){
				$("#follows-btn-four").css("display","none");
				console.log("2222");
			}
		}else{
			return;
		}
		
	}
}


/*
 * 观看记录
 */
var ishistory = true;
function history(videoId) {
	
	if(ishistory == true){
		$.ajax({
			url : "history.do?videoId=" + videoId,
			success : procResultGetHistory,
			error : handleError
		});	
		ishistory = false;
	}
}

function procResultGetHistory(responseStr){
	var responseJson = JSON.parse(responseStr);
	var isHistory = responseJson.result;
	
	if(isHistory == false){
		return;
	}else{
		var resultBoolean = isHistory.resultBoolean;
		if(resultBoolean){
			var resultInt = isHistory.resultInt;
			$("#watchCount").html(resultInt);
		}else{
			return;
		}
	}
}

/**
 * 发起点赞的请求
 * path,videoId,userId
 * @returns
 */
function getThumbsUp(path,videoId){
	$.ajax({
		url : "thumbsUp.do?path=" + path + "&videoId=" + videoId + "&isThumbsUp=y",  
		success : procResultGetThumbsUp,
		error : handleError
	});	
}

function procResultGetThumbsUp(responseStr){
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isThumbsUp = responseJson.result;
	if(isThumbsUp == false){
		window.location.href = "login.view";
	}else{
		var resultBoolean = isThumbsUp.resultBoolean;
		if(resultBoolean){
			var resultInt = isThumbsUp.resultInt;
			$("#thumbsUp").html(resultInt);
			$("#thumbs-up-one").css("display","none");
			$("#thumbs-up-two").css("display","block");
			var thumbsUpThree = document.getElementById("thumbs-up-three");
			if(thumbsUpThree != null){
				$("#thumbs-up-three").css("display","none");
			}
			var thumbsUpFour = document.getElementById("thumbs-up-four");
			if(thumbsUpFour != null){
				$("#fthumbs-up-four").css("display","block");
			}
		}else{
			return;
		}
		
	}
}

/*
 * 发起取消点赞的请求
 */
function deleteThumbsUp(path,videoId){
	$.ajax({
		url : "thumbsUp.do?path=" + path + "&videoId=" + videoId + "&isThumbsUp=n",
		success : procResultDeleteThumbsUp,
		error : handleError
	});	
}

function procResultDeleteThumbsUp(responseStr){
	
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isThumbsUp = responseJson.result;
	if(isThumbsUp == false){
		//其实可以不用
		window.location.href = "login.view";
	}else{
		var resultBoolean = isThumbsUp.resultBoolean;
		if(resultBoolean){
			var resultInt = isThumbsUp.resultInt;
			$("#thumbsUp").html(resultInt);
			$("#thumbs-up-one").css("display","block");
			$("#thumbs-up-two").css("display","none");
			var thumbsUpThree = document.getElementById("thumbs-up-three");
			if(thumbsUpThree != null){
				$("#thumbs-up-three").css("display","block");
			}
			var thumbsUpFour = document.getElementById("thumbs-up-four");
			if(thumbsUpFour != null){
				$("#thumbs-up-four").css("display","none");
			}
		}else{
			return;
		}
		
	}
}

/**
 * 发起收藏的请求
 * @param path
 * @param videoId
 * @returns
 */
function getCollection(path,videoId){
	$.ajax({
		url : "collection.do?path=" + path + "&videoId=" + videoId + "&isCollection=y",  
		success : procResultGetCollection,
		error : handleError
	});	
}

function procResultGetCollection(responseStr){
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isCollection = responseJson.result;
	if(isCollection == false){
		window.location.href = "login.view";
	}else{
		var resultBoolean = isCollection.resultBoolean;
		if(resultBoolean){
			var resultInt = isCollection.resultInt;
			$("#collections").html(resultInt);
			$("#collections-one").css("display","none");
			$("#collections-two").css("display","block");
			var collectionsThree = document.getElementById("collections-three");
			if(collectionsThree != null){
				$("#collections-three").css("display","none");
			}
			var collectionsFour = document.getElementById("collections-four");
			if(collectionsFour != null){
				$("#collections-four").css("display","block");
			}
		}else{
			return;
		}
		
	}
}

/*
 * 发起取消收藏的请求
 */
function deleteCollection(path,videoId){
	$.ajax({
		url : "collection.do?path=" + path + "&videoId=" + videoId + "&isCollection=n",  
		success : procResultDeleteCollection,
		error : handleError
	});	
}

function procResultDeleteCollection(responseStr){
	
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isCollection = responseJson.result;
	if(isCollection == false){
		//其实可以不用
		window.location.href = "login.view";
	}else{
		var resultBoolean = isCollection.resultBoolean;
		if(resultBoolean){
			var resultInt = isCollection.resultInt;
			$("#collections").html(resultInt);
			$("#collections-one").css("display","block");
			$("#collections-two").css("display","none");
			var collectionsThree = document.getElementById("collections-three");
			if(collectionsThree != null){
				$("#collections-three").css("display","block");
			}
			var collectionsFour = document.getElementById("collections-four");
			if(collectionsFour != null){
				$("#collections-four").css("display","none");
			}
		}else{
			return;
		}
		
	}
}

function indexSort(module,sort,hobby){
	$.ajax({
        url : "indexSort.do?module=" + module + "&sort=" + sort + "&hobby=" + hobby,
        success : procResultSortVideo,
        error : handleError
    });
}

function procResultSortVideo(responseStr){
	$("#sort").html(responseStr);
}

/**
 * 分页
 * @returns
 */
function commentPage(page,videoId){
	if(page == -1){
	   page = currentPage - 1;
	}
	
	if(page == -2){
	   page = currentPage + 1;
	}
	activeBtn(page);
	$.ajax({
        url : "page.do?videoId=" + videoId + "&pageNumber=" + page,
        success : procResultCommentPage,
        error : handleError
    });
	
}

function procResultCommentPage(responseStr){
	$("#comment").html(responseStr);
}

function  monitorPage(){
	if(currentPage == 1){
		$("#previous-page-one").css("display","none");
		$("#previous-page-two").css("display","none");
	}else{
		$("#previous-page-one").css("display","block");
		$("#previous-page-two").css("display","block");
	}
	
	if(currentPage == lastPage){
		$("#next-page-one").css("display","none");
		$("#next-page-two").css("display","none");
	}else{
		$("#next-page-one").css("display","block");
		$("#next-page-two").css("display","block");
	}
}

function activeBtn(page){
	
	
	var liOne = $(".activeListOne").children("li");
	var liTwo = $(".activeListTwo").children("li");
	for (var i = 0; i < liOne.length; i++) {
		liOne[i].className = "page-item";
	}
	for (var i = 0; i < liTwo.length; i++) {
		liTwo[i].className = "page-item";
	}
	liOne[page].className = "page-item active";
	liTwo[page].className = "page-item active";
	currentPage = page;
	monitorPage();
	
}

function LoginComment(path,videoId){
	$.ajax({
        url : "comment.do?path=" + path + "&videoId=" + videoId,
        success : procResultLoginComment,
        error : handleError
    });
}

function procResultLoginComment(responseStr){
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
	var isComment = responseJson.result;
	if(isComment == false){
		window.location.href = "login.view";
	}
}

function getComment(videoId){
	
	var content = $("#txt").val();
	
	if(content.trim() == '' || content == ''){
		$("#txt").val('');
		alert('你还没有评论啊！');
		return;
	}
	if(content.length > 200){
		alert('你的评论很好，但是有点太长了哦！文字不能超过200字');
		return;
	}
	
	$.ajax({
        url : "getComment.do",
        type : "post",
        data : {videoId : videoId, content : content},
        success : procResultGetComment,
        error : handleError
    });
	
	var count = 0;
	
	commentCount = commentCount + 1;
	
	if((commentCount / 10) < 1){
		count = 1;
    }else{
        if((commentCount % 10) == 0){
        	count = commentCount / 10;
        }else{
        	count = Math.floor(commentCount / 10) + 1;
        }
    }
	
	if(count != lastPage){
		lastPage = count;
		var itemA = $("<a></a>");
		itemA.attr("class", "page-link");
		itemA.attr("onclick","commentPage("+lastPage+","+videoId+")");
		itemA.html(lastPage);
		
		var itemB = $("<a></a>");
		itemB.attr("class", "page-link");
		itemA.attr("onclick","commentPage("+lastPage+","+videoId+")");
		itemB.html(lastPage);
		
		var itemOne = $("<li></li>"); // 创建li元素
		itemOne.attr("class", "page-item");
		itemOne.append(itemA);
		
		var itemTwo = $("<li></li>"); // 创建li元素
		itemTwo.attr("class", "page-item");
		itemTwo.append(itemB);
		
		var ListOne = $(".activeListOne");
		var liOne = $(".activeListOne").children("li");
		for(var i = 0;i <= liOne.length;i++){
			if(i == (liOne.length - 1)){
				ListOne.append(itemOne);
			}else{
				if(i == liOne.length){
					ListOne.append(liOne[i - 1]);
				}else{
					ListOne.append(liOne[i]);
				}
				
			}
		}
		
		var ListTwo = $(".activeListTwo");
		var liTwo = $(".activeListTwo").children("li");
		for(var i = 0;i <= liTwo.length;i++){
			if(i == (liTwo.length - 1)){
				ListTwo.append(itemTwo);
			}else{
				if(i == liTwo.length){
					ListTwo.append(liTwo[i - 1]);
				}else{
					ListTwo.append(liTwo[i]);
				}
				
			}
		}
	}
	
}


function procResultGetComment(responseStr){
	$("#comment").html(responseStr);
	currentPage = 1;
	activeBtn(currentPage);
	pageNav(commentCount);
	$("#txt").val('');
	
}

function pageNav(commentCount) {
	if(commentCount <= 10){
		$("#nav-One").css("display", "none");
		$("#nav-Two").css("display", "none");
	}else{
		$("#nav-One").css("display", "block");
		$("#nav-Two").css("display", "block");
	}
	
}

function handleError(xhr) {
    $(document.body).html(xhr.responseText);
}