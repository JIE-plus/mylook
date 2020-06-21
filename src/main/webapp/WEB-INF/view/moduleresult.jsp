<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.muldini.mylook.common.StringConstant"%>

<c:set var="resultModuleFirst" value="${requestScope.REQ_INDEX_FIRST}" />

<div class="container-box container">
	<div class="row row-cols-2 row-cols-md-4">

		<c:forEach var="video" items="${resultModuleFirst}">

			<div class="card-box col mb-4">
				<a id="box-a" href="${video.videoUrl}">
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
							<svg id="box-svg-1" class="box-svg bi bi-heart-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
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