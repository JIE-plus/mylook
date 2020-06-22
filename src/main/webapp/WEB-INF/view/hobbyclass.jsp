<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.muldini.mylook.common.StringConstant"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>趣看</title>
<link rel="shortcut icon" href="static/img/qukan.png" />
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/header.css" />
<link rel="stylesheet" href="static/css/classType.css" />
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/hobbyclass.js"></script>


</head>

<body>

	<!--导航栏  -->
	<c:import url="header.jsp" />

	<div class="row row-box">
		<div class="left col-3 col-md-2">
			<div class="faxian">发现爱好</div>

			<div class="lovebox">
				<c:set var="hobbyNameList"
					value="${requestScope.REQ_HOBBY_NAME_LIST}" />
				<c:forEach var="Hobby" items="${hobbyNameList}">
					<div class="love">
						<a href="javascript:;" onclick="hobbyVideo(${Hobby.hobbyId})">${Hobby.name}</a>
					</div>
				</c:forEach>
			</div>

		</div>

		<div id="right" class="right col-9 col-md-10">
			<div class="hobbyTitle container">
				<h4>热门爱好</h4>
			</div>

			<c:set var="hobbyHostModuleOne"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_ONE}" />
			<c:set var="hobbyHostModuleTwo"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_TWO}" />
			<c:set var="hobbyHostModuleThree"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_THREE}" />
			<c:set var="hobbyHostModuleFour"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_FOUR}" />
			<c:set var="hobbyHostModuleFive"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_FIVE}" />
			<c:set var="hobbyHostModuleSix"
				value="${requestScope.REQ_HOBBY_HOST_MODULE_SIX}" />

			<div class="container">
				<div class="divbox row">
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleOne.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleOne.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleOne.get(0).hobby.name}</p>
					</div>
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleTwo.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleTwo.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleTwo.get(0).hobby.name}</p>
					</div>
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleThree.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleThree.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleThree.get(0).hobby.name}</p>
					</div>
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleFour.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleFour.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleFour.get(0).hobby.name}</p>
					</div>
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleFive.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleFive.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleFive.get(0).hobby.name}</p>
					</div>
					<div class="hobbyVideo container col-md-2 col-4"
						onclick="hobbyVideo(${hobbyHostModuleSix.get(0).hobby.hobbyId})">
						<img src="${hobbyHostModuleSix.get(0).hobby.hobbySmallIcon}">
						<p>${hobbyHostModuleSix.get(0).hobby.name}</p>
					</div>
				</div>
			</div>



			<div class="divbox2">
				<div class="hobbyVideo container">
					<h4>热门视频</h4>
				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleOne.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleOne.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleOne}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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

				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleTwo.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleTwo.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleTwo}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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

				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleThree.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleThree.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleThree}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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
				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleFour.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleFour.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleFour}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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
				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleFive.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleFive.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleFive}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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
				</div>

				<div>
					<div class="hobbyVideo container">
						<img src="${hobbyHostModuleSix.get(0).hobby.hobbySmallIcon}">
						<span style="font-size: 18px; color: black;">${hobbyHostModuleSix.get(0).hobby.name}</span>
					</div>

					<div class="container-box container">
						<div class="row">
							<c:forEach var="video" items="${hobbyHostModuleSix}">
								<div class="card-box col-md-3">
									<a id="box-a" href="video.do?videoId=${video.videoId}">
										<div class="card h-100">

											<c:choose>
												<c:when test="${not empty video.videoGif}">
													<img id="box-b" src="${video.videoCover}"
														class="box-img card-img-top" alt="...">
													<img id="box-c" src="${video.videoGif}"
														class="box-img card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img src="${video.videoCover}" class="box-img card-img-top"
														alt="...">
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
												<svg id="box-svg-1" class="box-svg bi bi-heart-fill"
													width="1em" height="1em" viewBox="0 0 16 16"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
														d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
														clip-rule="evenodd" />
								</svg>
												<span id="box-span-1" class="box-span">${video.thumbsUp}</span>
												<span id="box-span-2" class="box-span">${video.time}</span>
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
				</div>

			</div>
		</div>
	</div>

	<c:import url="bottom2.jsp" />
</body>
</html>

