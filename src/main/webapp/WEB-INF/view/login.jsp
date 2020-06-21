<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>趣看</title>
<link rel="shortcut icon" href="static/img/qukan.png" />
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/header.css" />
<link rel="stylesheet" href="static/css/registerLogin.css" />
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/login.js"></script>

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">
	
	<c:import url="header.jsp" />


	<!-- login -->
	<div id="register-box" class="container-box container">
		<div id="register-title">登录</div>
		<form id="login-form" action="login.do" method="post">
		
		    <c:set var="loginSuccess" value="${REQ_LOGIN_SUCCESS_MSG}" />
            <c:if test="${not empty loginSuccess}">
                  <div class="validation-message-success alert alert-success">
				<strong>登陆成功!</strong>欢迎<strong><c:out value="${param.username}"/></strong>来到<strong>趣看的世界！</strong>
			</div>
            </c:if>
		    
		
			<div id="register-input-name">
				<div class="username">用户名</div>
				<input name="username" id="loginName" class="ipusername" type="text" 
				       value='<c:out value="${param.username}" />' /> 
				<div id="login-name-message" class="validation-message alert alert-danger">请输入用户名</div>
				
				<c:set var="loginNameMsg" value="${requestScope.REQ_LOGIN_NAME_MSG}"/>
				<c:if test="${not empty loginNameMsg}">
				    <div  class="validation-message-backend alert alert-danger">
				         <c:out value="${loginNameMsg}" />
				    </div>
				</c:if>
				
			</div>
			
			<div id="register-input-pwd">
				<div class="pwd">密码</div>
				<input name="password" id="loginPwd" class="ipusername" type="password" />
				<div id="login-pwd-message" class="validation-message alert alert-danger">请输入用户名</div>
				
				<c:set var="loginPwdMsg" value="${requestScope.REQ_LOGIN_PWD_MSG}"/>
				<c:if test="${not empty loginPwdMsg}">
				    <div  class="validation-message-backend alert alert-danger">
				         <c:out value="${loginPwdMsg}" />
				    </div>
				</c:if>
				
			</div>
			
			<div id="login-register">
				<input class="register-button" type="button" value="注册" /> <input
					class="login-submit" type="submit" value="登陆" />
			</div>
		</form>
	</div>



	<!-- 页尾 -->
	<c:import url="bottom.jsp" />

</body>
</html>
