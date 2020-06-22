<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.muldini.mylook.common.UserUtils"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>趣看</title>
</head>

<body>
	<%
	    String path = request.getServletPath();
	    String url = UserUtils.resultUrl(path);
	%>
	<c:set var="url" value="<%=url%>" />
	<c:if test="${url =='video'}">
	      <c:set var="video" value="${requestScope.REQ_VIDEO_MESSAGES}"/>
	      <c:set var="url" value="video.do?videoId=${video.videoId}"/>
	</c:if>

	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<div class="container">
			<img src="static/img/qukan.png" width="80" height="40" alt="">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="nav navbar-nav mr-auto">
					<li class="active"><a id="item-font" class="nav-link"
						href="index.do"><strong>首页</strong><span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a id="item-font" class="nav-link"
						href="hobbyclass.do"><strong>爱好分类</strong></a></li>
					<li class="nav-item"><a id="item-font" class="nav-link"
						href="usercore.view?path=${url}"><strong>个人中心</strong></a></li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<ul class="navbar-nav mr-auto">

						<c:set var="userStatus"
							value="${sessionScope.SESSION_LOGIN_STATUS_MSG}" />
						<c:set var="userId" value="${sessionScope.SESSION_USER_ID}" />
						<c:set var="userHeader" value="${sessionScope.SESSION_USER_HEADER}" />
						<c:choose>
							<c:when test="${empty userStatus || empty userId}">
								<li class="nav-item"><a id="item-font" class="nav-link"
									href="login.view"><strong>登录</strong></a></li>
								<li class="nav-item"><a id="item-font" class="nav-link"
									href="register.view"><strong>注册</strong></a></li>
							</c:when>
							<c:when
								test='${not empty userStatus && not empty userId && userStatus == "10"}'>
								<li class="nav-item dropdown"><a href="#"
									data-toggle="dropdown"> 
									<c:choose>
									   <c:when test="${not empty userHeader}">
									        <img class="userHeader" src="${userHeader}" alt="" />
									   </c:when>
									   <c:otherwise>
									         <img class="userHeader" src="static/img/header1.jpg" alt="" />
									   </c:otherwise>
									</c:choose>
									
								</a>
									<ul class="dropdown-menu">
									<li id="menu-li-one"><strong class="menu-name"><c:out value="${sessionScope.SESSION_USER_NAME}" /></strong></li>
										<li><a class="dropdown-item" href="usercore.view">历史记录</a></li>
										<li><a class="dropdown-item" href="usercore.view">我要投稿</a></li>
										<li><a class="dropdown-item" href="usercore.view">个人中心</a></li>
										<div class="dropdown-divider"></div>
										<li><a class="dropdown-item" href="signout.do?path=${url}">退出</a></li>
									</ul></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</nav>

</body>
</html>
