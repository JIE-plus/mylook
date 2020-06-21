<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.muldini.mylook.common.StringConstant"%>
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
<link rel="stylesheet" href="static/css/index.css" />
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/index.js"></script>


</head>

<body>
	<!--导航栏  -->
	<c:import url="header.jsp" />
    
    
    <!--轮播 -->
	<div class="container-box container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>

			<div class="carousel-inner">
				<c:set var="carouselFirst" value="1" />
				<c:forEach var="carousel"
					items="${requestScope.REQ_RESULT_CAROUSEL}">

					<c:choose>
						<c:when test="${carouselFirst == '1'}">
							<div class="carousel-item active">
								<a href="${carousel.url}"> <img src="${carousel.picture}"
									class="d-block w-100" alt="...">
								</a>
							</div>
							<c:set var="carouselFirst" value="2" />
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
								<a href="${carousel.url}"> <img src="${carousel.picture}"
									class="d-block w-100" alt="...">
								</a>
							</div>
						</c:otherwise>
					</c:choose>


				</c:forEach>

			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
    
    
    <!-- 第一模块 -->
	<c:set var="resultModuleFirst"
		value="${requestScope.REQ_INDEX_FIRST}" />

	<div class="box-title container-box container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">
					<strong>${resultModuleFirst[0].hobby.name}爱好区</strong>
				</h1>
			</div>
			<img src="${resultModuleFirst[0].hobby.hobbyPicture}"
				class="card-img-top" alt="...">
			<div class="title-img-body card-img-overlay">
				<div class="sort_a">
					<a href="javascript:;" onclick="indexSort(1,1,${resultModuleFirst[0].hobby.hobbyId});" class="btn btn-primary btn-sm">最多观看人数</a> 
					<a href="javascript:;" onclick="indexSort(1,2,${resultModuleFirst[0].hobby.hobbyId});" class="btn btn-secondary btn-sm">最多点赞数</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 用户的爱好为八个 -->
	<div id="first-sort" class="container-box container">
		<div class="row row-cols-2 row-cols-md-4">

			<c:forEach var="video" items="${resultModuleFirst}">

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
								<svg class="box-svg bi bi-collection-play-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-3" class="box-span">${video.watchCount}</span>
								<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-1" class="box-span" >${video.thumbsUp}</span> <span
									id="box-span-2" class="box-span">${video.time}</span>
							</div>
							<div class="card-body">
								<h5 class="box-body" class="card-title">
									<strong>${video.name}</strong>
								</h5>
							</div>
						</div>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
	
	
	<!--第二模块  -->
	<c:set var="resultModuleSecond"
		value="${requestScope.REQ_INDEX_SECOND}" />

	<div class="box-title container-box container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">
					<strong>${resultModuleSecond[0].hobby.name}爱好区</strong>
				</h1>
			</div>
			<img src="${resultModuleSecond[0].hobby.hobbyPicture}"
				class="card-img-top" alt="...">
			<div class="title-img-body card-img-overlay">
				<div class="sort_a">
					<a href="javascript:;" onclick="indexSort(2,1,${resultModuleSecond[0].hobby.hobbyId});" class="btn btn-primary btn-sm">最多观看人数</a> 
					<a href="javascript:;" onclick="indexSort(2,2,${resultModuleSecond[0].hobby.hobbyId});" class="btn btn-secondary btn-sm">最多点赞数</a>
				</div>
			</div>
		</div>
	</div>


	
	<div id="second-sort" class="container-box container">
		<div class="row row-cols-2 row-cols-md-4">

			<c:forEach var="video" items="${resultModuleSecond}">

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
								<svg class="box-svg bi bi-collection-play-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-3" class="box-span">${video.watchCount}</span>
								<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-1" class="box-span" >${video.thumbsUp}</span> <span
									id="box-span-2" class="box-span">${video.time}</span>
							</div>
							<div class="card-body">
								<h5 class="box-body" class="card-title">
									<strong>${video.name}</strong>
								</h5>
							</div>
						</div>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
	
	<!-- 第三模块 -->
	<c:set var="resultModuleThird"
		value="${requestScope.REQ_INDEX_THIRD}" />

	<div class="box-title container-box container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">
					<strong>${resultModuleThird[0].hobby.name}爱好区</strong>
				</h1>
			</div>
			<img src="${resultModuleThird[0].hobby.hobbyPicture}"
				class="card-img-top" alt="...">
			<div class="title-img-body card-img-overlay">
				<div class="sort_a">
					<a href="javascript:;" onclick="indexSort(3,1,${resultModuleThird[0].hobby.hobbyId});" class="btn btn-primary btn-sm">最多观看人数</a> 
					<a href="javascript:;" onclick="indexSort(3,2,${resultModuleThird[0].hobby.hobbyId});" class="btn btn-secondary btn-sm">最多点赞数</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 用户的爱好为八个 -->
	<div id="third-sort" class="container-box container">
		<div class="row row-cols-2 row-cols-md-4">

			<c:forEach var="video" items="${resultModuleThird}">

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
								<svg class="box-svg bi bi-collection-play-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-3" class="box-span">${video.watchCount}</span>
								<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-1" class="box-span" >${video.thumbsUp}</span> <span
									id="box-span-2" class="box-span">${video.time}</span>
							</div>
							<div class="card-body">
								<h5 class="box-body" class="card-title">
									<strong>${video.name}</strong>
								</h5>
							</div>
						</div>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
	
	<!--第四模块  -->
	<c:set var="resultModuleFourth"
		value="${requestScope.REQ_INDEX_FOURTH}" />

	<div class="box-title container-box container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">
					<strong>${resultModuleFourth[0].hobby.name}爱好区</strong>
				</h1>
			</div>
			<img src="${resultModuleFourth[0].hobby.hobbyPicture}"
				class="card-img-top" alt="...">
			<div class="title-img-body card-img-overlay">
				<div class="sort_a">
					<a href="javascript:;" onclick="indexSort(4,1,${resultModuleFourth[0].hobby.hobbyId});" class="btn btn-primary btn-sm">最多观看人数</a> 
					<a href="javascript:;" onclick="indexSort(4,2,${resultModuleFourth[0].hobby.hobbyId});" class="btn btn-secondary btn-sm">最多点赞数</a>
				</div>
			</div>
		</div>
	</div>


	
	<div id="fourth-sort" class="container-box container">
		<div class="row row-cols-2 row-cols-md-4">

			<c:forEach var="video" items="${resultModuleFourth}">

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
								<svg class="box-svg bi bi-collection-play-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M1.5 14.5A1.5 1.5 0 010 13V6a1.5 1.5 0 011.5-1.5h13A1.5 1.5 0 0116 6v7a1.5 1.5 0 01-1.5 1.5h-13zm5.265-7.924A.5.5 0 006 7v5a.5.5 0 00.765.424l4-2.5a.5.5 0 000-.848l-4-2.5zM2 3a.5.5 0 00.5.5h11a.5.5 0 000-1h-11A.5.5 0 002 3zm2-2a.5.5 0 00.5.5h7a.5.5 0 000-1h-7A.5.5 0 004 1z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-3" class="box-span">${video.watchCount}</span>
								<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em"
									height="1em" viewBox="0 0 16 16" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
										clip-rule="evenodd" />
								</svg>
								<span id="box-span-1" class="box-span" >${video.thumbsUp}</span> <span
									id="box-span-2" class="box-span">${video.time}</span>
							</div>
							<div class="card-body">
								<h5 class="box-body" class="card-title">
									<strong>${video.name}</strong>
								</h5>
							</div>
						</div>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>
	
	<div class="box-title container-box container">
		<div class="card">
			<img src="static/img/hostuser.png" class="card-img-top" alt="...">
		</div>
	</div>
    
    <c:set var="resultModuleFifth"
		value="${requestScope.REQ_INDEX_FIFTH}" />
    
    <div class="container-box container">
		  <div class="row row-cols-2 row-cols-md-4">
             <c:forEach var="user" items="${resultModuleFifth}">
                   <div class="card-box col mb-4">
					<a id="box-a" href="https://www.baidu.com/">
						<div id="card-user" class="card h-100">
							<img src="${user.header}" alt="..." class="user-img mx-auto card-img-top rounded-circle">
							<div class="card-body">
								<h5 class="box-body" class="card-title"><strong>${user.username}</strong></h5>
								<p class="box-p">爱好：<strong>${user.hobby.name}</strong></p>
								<p class="box-p">粉丝：<strong>${user.fans}</strong></p>
								<p class="box-p">关注：<strong>${user.follows}</strong></p>
							</div>
						</div>
					</a>
				</div>
             </c:forEach>
			</div>
		</div>
		
		<c:import url="bottom2.jsp" />
        

</body>
</html>

