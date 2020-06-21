<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.muldini.mylook.common.StringConstant,com.muldini.mylook.common.UserUtils"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>趣看</title>
<link rel="shortcut icon" href="static/img/qukan.png" />
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/header.css" />
<link rel="stylesheet" href="static/css/video.css"/>
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/video.js"></script>


</head>

<body>
	<!--导航栏  -->
	<c:import url="header.jsp" />
    
    <c:set var="video" value="${requestScope.REQ_VIDEO_MESSAGES}"/>
    
	<div class="container">
		<div class="video-title">
			<h5>
				<strong>${video.name}</strong>
			</h5>
			<div class="container-box col-12">
				<p class="video-title-p">
					${video.hobby.name}<span class="video-time">${video.createTime}</span>
				</p>
				<p class="video-title-p ">
					<svg class="bi bi-collection-play-fill" width="1em" height="1em"
						viewBox="0 0 16 16" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
							d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
							clip-rule="evenodd" />
						</svg>
					<span class="video-time"><span id="watchCount">${video.watchCount}</span>播放</span>
					<svg t="1590676522245" class="icon" viewBox="0 0 1024 1024"
						version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1755"
						width="16" height="16">
							<path
							d="M763.776 968.96H261.504C147.456 968.96 55.04 876.544 55.04 762.496V260.224C55.04 146.176 147.456 53.76 261.504 53.76h502.272C877.824 53.76 970.24 146.176 970.24 260.224v502.272c0 114.048-92.416 206.464-206.464 206.464z"
							fill="#FF4D3C" p-id="1756"></path>
							<path
							d="M512.64 252.8c-142.592 0-258.56 115.968-258.56 258.56s115.968 258.56 258.56 258.56 258.56-115.968 258.56-258.56-115.968-258.56-258.56-258.56z m-194.688 258.56c0-42.24 13.568-81.152 36.48-113.024l271.36 271.36c-31.872 22.912-70.912 36.48-113.024 36.48-107.52 0-194.816-87.424-194.816-194.816z m352.896 113.152l-271.36-271.36c31.872-22.912 70.912-36.48 113.024-36.48 107.392 0 194.688 87.424 194.688 194.688 0.128 42.24-13.44 81.152-36.352 113.152z"
							fill="#FFFFFF" p-id="1757"></path>
						</svg>
					<span class="video-time">未经作者授权，禁止转载</span>
				</p>
				
			</div>
		</div>
	</div>
	
	<div class="container">
			<video id="video" class="video col-12" controls onplay="history(${video.videoId})">
				<source src="${video.videoUrl}" type="video/mp4">
			</video>
			<div class="video-evaluate col-12">
				
				<svg id="thumbs-up-two" class="thumbs-up" t="1590680552553" class="icon" viewBox="0 0 1024 1024" version="1.1"
				 xmlns="http://www.w3.org/2000/svg" p-id="3411" width="32" height="32" 
				 data-toggle="tooltip" data-placement="top" title="朋友爱你呦！"
				 onclick="deleteThumbsUp('video',${video.videoId})">
					<path d="M884.875894 423.143253 646.970506 423.143253c92.185562-340.464205-63.516616-357.853247-63.516616-357.853247-65.993017 0-52.312436 52.182476-57.3031 60.881602 0 166.502152-176.849824 296.971645-176.849824 296.971645l0 472.171899c0 46.607504 63.516616 63.393819 88.433098 63.393819l357.452111 0c33.641191 0 61.036122-88.224344 61.036122-88.224344 88.434122-300.70569 88.434122-390.177444 88.434122-390.177444C944.657442 418.179195 884.875894 423.143253 884.875894 423.143253L884.875894 423.143253 884.875894 423.143253zM884.875894 423.143253"
					 p-id="3412" fill="#1296db"></path>
					<path d="M251.671415 423.299819 109.214912 423.299819c-29.420053 0-29.873378 28.89612-29.873378 28.89612l29.420053 476.202703c0 30.309306 30.361495 30.309306 30.361495 30.309306L262.420223 958.707948c25.686009 0 25.458835-20.049638 25.458835-20.049638L287.879058 459.411271C287.879058 422.837284 251.671415 423.299819 251.671415 423.299819L251.671415 423.299819 251.671415 423.299819zM251.671415 423.299819"
					 p-id="3413" fill="#1296db"></path>
				</svg>

				<svg id="thumbs-up-one" class="thumbs-up thumbs-up-hover" t="1590680552553" class="icon" viewBox="0 0 1024 1024" version="1.1"
				 xmlns="http://www.w3.org/2000/svg" p-id="3411" width="32" height="32"
				 data-toggle="tooltip" data-placement="top" title="点我！点我！"
				 onclick="getThumbsUp('video',${video.videoId})">
					<path d="M884.875894 423.143253 646.970506 423.143253c92.185562-340.464205-63.516616-357.853247-63.516616-357.853247-65.993017 0-52.312436 52.182476-57.3031 60.881602 0 166.502152-176.849824 296.971645-176.849824 296.971645l0 472.171899c0 46.607504 63.516616 63.393819 88.433098 63.393819l357.452111 0c33.641191 0 61.036122-88.224344 61.036122-88.224344 88.434122-300.70569 88.434122-390.177444 88.434122-390.177444C944.657442 418.179195 884.875894 423.143253 884.875894 423.143253L884.875894 423.143253 884.875894 423.143253zM884.875894 423.143253"
					 p-id="3412"></path>
					<path d="M251.671415 423.299819 109.214912 423.299819c-29.420053 0-29.873378 28.89612-29.873378 28.89612l29.420053 476.202703c0 30.309306 30.361495 30.309306 30.361495 30.309306L262.420223 958.707948c25.686009 0 25.458835-20.049638 25.458835-20.049638L287.879058 459.411271C287.879058 422.837284 251.671415 423.299819 251.671415 423.299819L251.671415 423.299819 251.671415 423.299819zM251.671415 423.299819"
					 p-id="3413"></path>
				</svg>
                   
                <c:set var="isThumbsUp" value="${requestScope.REQ_VIDEO_ISTHUMBSUP}"/>
			    <c:choose>
			      <c:when test="${isThumbsUp == true}">
			         <svg id="thumbs-up-four" class="thumbs-up" t="1590680552553" class="icon" viewBox="0 0 1024 1024" version="1.1"
					     xmlns="http://www.w3.org/2000/svg" p-id="3411" width="32" height="32"
					     data-toggle="tooltip" data-placement="top" title="朋友爱你呦！"
					     onclick="deleteThumbsUp('video',${video.videoId})">
						<path d="M884.875894 423.143253 646.970506 423.143253c92.185562-340.464205-63.516616-357.853247-63.516616-357.853247-65.993017 0-52.312436 52.182476-57.3031 60.881602 0 166.502152-176.849824 296.971645-176.849824 296.971645l0 472.171899c0 46.607504 63.516616 63.393819 88.433098 63.393819l357.452111 0c33.641191 0 61.036122-88.224344 61.036122-88.224344 88.434122-300.70569 88.434122-390.177444 88.434122-390.177444C944.657442 418.179195 884.875894 423.143253 884.875894 423.143253L884.875894 423.143253 884.875894 423.143253zM884.875894 423.143253"
						 p-id="3412" fill="#1296db"></path>
						<path d="M251.671415 423.299819 109.214912 423.299819c-29.420053 0-29.873378 28.89612-29.873378 28.89612l29.420053 476.202703c0 30.309306 30.361495 30.309306 30.361495 30.309306L262.420223 958.707948c25.686009 0 25.458835-20.049638 25.458835-20.049638L287.879058 459.411271C287.879058 422.837284 251.671415 423.299819 251.671415 423.299819L251.671415 423.299819 251.671415 423.299819zM251.671415 423.299819"
						 p-id="3413" fill="#1296db"></path>
				    </svg>
			      </c:when>
			      <c:otherwise>
			        <svg id="thumbs-up-three" class="thumbs-up" t="1590680552553" class="icon" viewBox="0 0 1024 1024" version="1.1"
					     xmlns="http://www.w3.org/2000/svg" p-id="3411" width="32" height="32"
					     data-toggle="tooltip" data-placement="top" title="点我！点我！"
					     onclick="getThumbsUp('video',${video.videoId})">
						<path d="M884.875894 423.143253 646.970506 423.143253c92.185562-340.464205-63.516616-357.853247-63.516616-357.853247-65.993017 0-52.312436 52.182476-57.3031 60.881602 0 166.502152-176.849824 296.971645-176.849824 296.971645l0 472.171899c0 46.607504 63.516616 63.393819 88.433098 63.393819l357.452111 0c33.641191 0 61.036122-88.224344 61.036122-88.224344 88.434122-300.70569 88.434122-390.177444 88.434122-390.177444C944.657442 418.179195 884.875894 423.143253 884.875894 423.143253L884.875894 423.143253 884.875894 423.143253zM884.875894 423.143253"
						 p-id="3412"></path>
						<path d="M251.671415 423.299819 109.214912 423.299819c-29.420053 0-29.873378 28.89612-29.873378 28.89612l29.420053 476.202703c0 30.309306 30.361495 30.309306 30.361495 30.309306L262.420223 958.707948c25.686009 0 25.458835-20.049638 25.458835-20.049638L287.879058 459.411271C287.879058 422.837284 251.671415 423.299819 251.671415 423.299819L251.671415 423.299819 251.671415 423.299819zM251.671415 423.299819"
						 p-id="3413"></path>
				    </svg>
			      </c:otherwise>
			    </c:choose>
                    

				<span class="thumbs-up-count"><strong id="thumbsUp">${video.thumbsUp}</strong></span>

			
				<svg id="collections-two" class="collections" t="1590686755431" class="icon" viewBox="0 0 1024 1024" version="1.1"
				 xmlns="http://www.w3.org/2000/svg" p-id="4594" width="32" height="32"
				 data-toggle="tooltip" data-placement="top" title="朋友爱你呦！"
				 onclick="deleteCollection('video',${video.videoId})">
					<path d="M1003.52 390.826667c-6.826667-20.48-23.893333-34.133333-44.373333-37.546667l-273.066667-42.666667L563.2 49.493333C554.666667 29.013333 534.186667 17.066667 512 17.066667s-40.96 11.946667-51.2 32.426666l-122.88 261.12-273.066667 40.96c-20.48 3.413333-37.546667 17.066667-44.373333 37.546667-6.826667 20.48-1.706667 42.666667 13.653333 56.32l199.68 204.8L186.026667 938.666667c-3.413333 20.48 5.12 42.666667 23.893333 54.613333 17.066667 11.946667 40.96 13.653333 59.733333 3.413333L512 865.28l244.053333 136.533333c8.533333 3.413333 17.066667 6.826667 25.6 6.826667 30.72 0 56.32-25.6 56.32-56.32 0-6.826667-1.706667-11.946667-3.413333-17.066667l-44.373333-279.893333 199.68-204.8c15.36-17.066667 20.48-39.253333 13.653333-59.733333z"
					 fill="#1296db" p-id="4595"></path>
				</svg>

				<svg id="collections-one" class="collections" t="1590686755431" class="icon" viewBox="0 0 1024 1024" version="1.1"
				 xmlns="http://www.w3.org/2000/svg" p-id="4594" width="32" height="32"
				 data-toggle="tooltip" data-placement="top" title="点我！点我！"
				 onclick="getCollection('video',${video.videoId})">
					<path d="M1003.52 390.826667c-6.826667-20.48-23.893333-34.133333-44.373333-37.546667l-273.066667-42.666667L563.2 49.493333C554.666667 29.013333 534.186667 17.066667 512 17.066667s-40.96 11.946667-51.2 32.426666l-122.88 261.12-273.066667 40.96c-20.48 3.413333-37.546667 17.066667-44.373333 37.546667-6.826667 20.48-1.706667 42.666667 13.653333 56.32l199.68 204.8L186.026667 938.666667c-3.413333 20.48 5.12 42.666667 23.893333 54.613333 17.066667 11.946667 40.96 13.653333 59.733333 3.413333L512 865.28l244.053333 136.533333c8.533333 3.413333 17.066667 6.826667 25.6 6.826667 30.72 0 56.32-25.6 56.32-56.32 0-6.826667-1.706667-11.946667-3.413333-17.066667l-44.373333-279.893333 199.68-204.8c15.36-17.066667 20.48-39.253333 13.653333-59.733333z"
					 fill="#2c2c2c" p-id="4595"></path>
				</svg>
                
                
                <c:set var="isCollection" value="${requestScope.REQ_VIDEO_ISCOLLECTION}"/>
			    <c:choose>
			      <c:when test="${isCollection == true}">
			        <svg id="collections-four" class="collections" t="1590686755431" class="icon" viewBox="0 0 1024 1024" version="1.1"
					 xmlns="http://www.w3.org/2000/svg" p-id="4594" width="32" height="32"
					 data-toggle="tooltip" data-placement="top" title="朋友爱你呦！"
					 onclick="deleteCollection('video',${video.videoId})">
						<path d="M1003.52 390.826667c-6.826667-20.48-23.893333-34.133333-44.373333-37.546667l-273.066667-42.666667L563.2 49.493333C554.666667 29.013333 534.186667 17.066667 512 17.066667s-40.96 11.946667-51.2 32.426666l-122.88 261.12-273.066667 40.96c-20.48 3.413333-37.546667 17.066667-44.373333 37.546667-6.826667 20.48-1.706667 42.666667 13.653333 56.32l199.68 204.8L186.026667 938.666667c-3.413333 20.48 5.12 42.666667 23.893333 54.613333 17.066667 11.946667 40.96 13.653333 59.733333 3.413333L512 865.28l244.053333 136.533333c8.533333 3.413333 17.066667 6.826667 25.6 6.826667 30.72 0 56.32-25.6 56.32-56.32 0-6.826667-1.706667-11.946667-3.413333-17.066667l-44.373333-279.893333 199.68-204.8c15.36-17.066667 20.48-39.253333 13.653333-59.733333z"
						 fill="#1296db" p-id="4595"></path>
				    </svg>
			      </c:when>
			      <c:otherwise>
			        <svg id="collections-three" class="collections" t="1590686755431" class="icon" viewBox="0 0 1024 1024" version="1.1"
					 xmlns="http://www.w3.org/2000/svg" p-id="4594" width="32" height="32"
					 data-toggle="tooltip" data-placement="top" title="点我！点我！"
					 onclick="getCollection('video',${video.videoId})">
						<path d="M1003.52 390.826667c-6.826667-20.48-23.893333-34.133333-44.373333-37.546667l-273.066667-42.666667L563.2 49.493333C554.666667 29.013333 534.186667 17.066667 512 17.066667s-40.96 11.946667-51.2 32.426666l-122.88 261.12-273.066667 40.96c-20.48 3.413333-37.546667 17.066667-44.373333 37.546667-6.826667 20.48-1.706667 42.666667 13.653333 56.32l199.68 204.8L186.026667 938.666667c-3.413333 20.48 5.12 42.666667 23.893333 54.613333 17.066667 11.946667 40.96 13.653333 59.733333 3.413333L512 865.28l244.053333 136.533333c8.533333 3.413333 17.066667 6.826667 25.6 6.826667 30.72 0 56.32-25.6 56.32-56.32 0-6.826667-1.706667-11.946667-3.413333-17.066667l-44.373333-279.893333 199.68-204.8c15.36-17.066667 20.48-39.253333 13.653333-59.733333z"
						 fill="#2c2c2c" p-id="4595"></path>
				    </svg>
			      </c:otherwise>
			    </c:choose>
				
				<span class="collections-count"><strong id="collections">${video.collections}</strong></span>

				<a class="complain" href=""><span><strong>稿件投诉</strong></span></a>
			</div>
		</div>

        <div class="video-message container">
			<ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home"
					 aria-selected="true">视频介绍</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile"
					 aria-selected="false">评论</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact"
					 aria-selected="false">相关视频</a>
				</li>
			</ul>
			
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
					<div class="container-box video-message-context container">
						<div class="vieo-user col-12">
							<a href="https://www.baidu.com/">
								<img src="${video.user.header}" alt="..." class="video-user-img mx-auto card-img-top rounded-circle">
							</a>
							<h5 class="video-user-h5"><strong>${video.user.username}</strong></h5>
							<span class="video-user-span"><span id="fans">${video.user.fans}</span>粉丝</span>
							
						    <c:set var="userId" value="${sessionScope.SESSION_USER_ID}"/>
							<c:if test="${userId != video.user.userId}">
							     <button id="follows-btn-two" class="video-follows-btn" onclick="deleteFollow('video',${video.videoId},${video.user.userId})" >已关注</button>
				                 <button id="follows-btn-one" class="video-follows-btn" onclick="getFollow('video',${video.videoId},${video.user.userId})" >+关注</button>
							    
							    <c:set var="isFollow" value="${requestScope.REQ_VIDEO_ISFOLLOW}"/>
							    <c:choose>
							        <c:when test="${isFollow == true}">
				             			<button id="follows-btn-four" class="video-follows-btn" onclick="deleteFollow('video',${video.videoId},${video.user.userId})" >已关注</button>
				                    </c:when>
							        <c:otherwise>
							             <button id="follows-btn-three" class="video-follows-btn" onclick="getFollow('video',${video.videoId},${video.user.userId})" >+关注</button>
							        </c:otherwise>
							    </c:choose>								    	    
							</c:if>
						</div>

						<p class="video-message-p">${video.videoIntroduction}</p>
					</div>

				</div>
				<div class="tab-pane" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
					<div class="container-box container">
                        
                        <c:set var="userStatus" value="${sessionScope.SESSION_LOGIN_STATUS_MSG}"/>
                        <c:set var="userHeader" value="${sessionScope.SESSION_USER_HEADER}" />
                        <c:set var="userId" value="${sessionScope.SESSION_USER_ID}"/>
						<div id="first" class="media">
							<a name="first"></a>
							<c:choose>
							  <c:when test='${not empty userStatus && not empty userId && userStatus == "10"}'>
							     <c:choose>
								   <c:when test="${not empty userHeader}">
								        <img src="${userHeader}" class="comment-img" alt="..."/>
								   </c:when>
								   <c:otherwise>
								         <img class="comment-img" src="static/img/header1.jpg" alt="" />
								   </c:otherwise>
								</c:choose>                               						    
							  </c:when>
							  <c:otherwise>
							    <img class="comment-img" src="static/img/header1.jpg" alt="" />
							  </c:otherwise>
							</c:choose>
							
							
							<div  class="media-body row">
								<div class="form-group col-9">
								
								    <c:choose>
									  <c:when test='${not empty userStatus && not empty userId && userStatus == "10"}'>
										<label for="exampleFormControlTextarea1"><strong><c:out value="${sessionScope.SESSION_USER_NAME}" /></strong></label>
										<textarea class="form-control" id="txt" rows="3"></textarea>    
									  </c:when>
									  <c:otherwise>
									    <label for="exampleFormControlTextarea1"><strong><c:out value="请先登录后再评论" /></strong></label>
									    <textarea class="form-control" id="txt" rows="3"></textarea>
									    <button class="form-control button-control" onclick="LoginComment('video',${video.videoId})">请先登录后再评论</button>	
									  </c:otherwise>
							        </c:choose>
								</div>
								<c:set var="commentCount" value="${requestScope.REQ_VIDEO_COMMENT_COUNT}"/>
								<input type="text" class="comment-input" style="display:none" value="${commentCount}"/>
								<c:choose>
								  <c:when test='${not empty userStatus && not empty userId && userStatus == "10"}'>
									<button class="comment-btn btn btn-primary col-2" onclick="getComment(${video.videoId})">发表<br />评论</button>
								  </c:when>
								  <c:otherwise>
								    <button class="comment-btn btn btn-primary col-2" onclick="LoginComment('video',${video.videoId})">发表<br />评论</button>
								  </c:otherwise>
							    </c:choose>
								
							</div>
						</div>

                        <c:set var="commentPage" value="${requestScope.REQ_VIDEO_COMMENT_PAGE}"/>
                        
                           <nav id="nav-One" aria-label="Page navigation example">
							<ul class="pagination justify-content-end activeListOne">
								<li class="page-item" id="previous-page-one"><a class="page-link" onclick="commentPage(-1, ${video.videoId})">上一页</a></li>
								<c:forEach var="page" begin="1" end="${commentPage}">
								  <li class="page-item"><a class="page-link" onclick="commentPage(${page}, ${video.videoId})">${page}</a></li>
								</c:forEach>
								<li class="page-item" id="next-page-one"><a class="page-link" onclick="commentPage(-2, ${video.videoId})">下一页</a></li>
							</ul> 
						  </nav>
                        
						
						
                        <div id="comment">
                          <c:set var="commentList" value="${requestScope.REQ_VIDEO_COMMENT}"/>
                          <c:forEach var="comment" items="${commentList}">
                             <div class="media">
								<c:choose>
								   <c:when test="${not empty comment.user.header}">
								      <img src="${comment.user.header}" class="comment-img" alt="...">
								   </c:when>
								   <c:otherwise>
								      <img src="${comment.user.header}" class="static/img/header1.jpg" alt="...">
								   </c:otherwise>
						        </c:choose>
								<div class="media-body">
									<h5 class="mt-0"><strong>${comment.user.username}</strong><span class="span-time">${comment.createTime}</span></h5>
									<c:out value="${comment.content}" />
								</div>
						     </div>
                          </c:forEach>
                          
						  
                        </div>
						
                        
                           <nav id="nav-Two" aria-label="Page navigation example">
							<ul class="pagination justify-content-center activeListTwo">
								<li class="page-item" id="previous-page-two"><a class="page-link" href="#first" onclick="commentPage(-1, ${video.videoId})">上一页</a></li>
								<c:forEach var="page" begin="1" end="${commentPage}">
								  <li class="page-item"><a class="page-link" href="#first" onclick="commentPage(${page}, ${video.videoId})">${page}</a></li>
								</c:forEach>
								<li class="page-item" id="next-page-two"><a class="page-link" href="#first" onclick="commentPage(-2, ${video.videoId})">下一页</a></li>
							</ul> 
						  </nav>
                        
					</div>

				</div>
				<div class="tab-pane" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
				    <div class="sort-btn">
						<a href="javascript:;" onclick="indexSort(1,1,${video.hobby.hobbyId});" class="btn btn-primary btn-sm">最多观看人数</a> 
					    <a href="javascript:;" onclick="indexSort(1,2,${video.hobby.hobbyId});" class="btn btn-secondary btn-sm">最多点赞数</a>
					</div>
					<div id="sort" class="container-box container">
						<div class="row row-cols-2 row-cols-md-4">
                     
						    <c:set var="resultModule" value="${requestScope.REQ_VIDEO_ABOUTVIDEO}"/>
				            <c:forEach var="video" items="${resultModule}">
				                <div class="card-box col mb-4">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">
											<c:choose>
											   <c:when test="${not empty video.videoGif}">
											       <img id="box-b" src="${video.videoCover}" class="box-img card-img-top" alt="..."> 
												   <img id="box-c" src="${video.videoGif}" class="box-img card-img-top" alt="...">
											   </c:when>
											   <c:otherwise>
											       <img src="${video.videoCover}" class="box-img card-img-top" alt="...">
											   </c:otherwise>
						                    </c:choose>
											<div class="box-img-body card-img-overlay">
												<svg class="box-svg bi bi-collection-play-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
												 xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
													 clip-rule="evenodd" />
												</svg>
												<span id="box-span-3" class="box-span">${video.watchCount}</span>
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
												 xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
													 clip-rule="evenodd" />
												</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
											</div>
											<div class="card-body">
												<h5 class="box-body" class="card-title"><strong>${video.name}</strong></h5>
											</div>
										</div>
									</a>
								</div>
				            </c:forEach>
	
						</div>
					</div>
				</div>
			</div>
		</div>


        <c:import url="bottom2.jsp" />



</body>
</html>

