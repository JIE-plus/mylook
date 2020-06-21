<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.muldini.mylook.common.StringConstant"%>

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
			${comment.content}
 		</div>
   </div>
</c:forEach>