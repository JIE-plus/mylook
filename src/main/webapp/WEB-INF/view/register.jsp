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
	content="width=device-width, user-scalable=no, initial-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>趣看</title>
<link rel="shortcut icon" href="static/img/qukan.png" />
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/header.css" />
<link rel="stylesheet" href="static/css/registerLogin.css" />
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">

	<c:import url="header.jsp" />

	<!-- register -->
	<div id="register-box">
		<div id="register-title">注册</div>



		<form id="register-form" action="register.do" method="post">
            <c:set var="registerSuccess" value="${REQ_REGISTER_SUCCESS_MSG}" />
            <c:if test="${not empty registerSuccess}">
                  <div class="validation-message-success alert alert-success">
				<strong>注册成功!</strong>欢迎<strong><c:out value="${param.username}"/></strong>来到<strong>趣看的世界！</strong>
			</div>
            </c:if>
			

			<div id="register-input-name">
				<div class="username">用户名</div>
				
				<input name="username" id="registerName" class="ipusername"
					type="text"
					title="1.用户名长度为6~8位。2.用户名可以由英文,数字和中文组成。"
					data-toggle="tooltip"
					data-placement="right"
					value='<c:out value="${param.username}"/>' 
					autocomplete='off'/>
				<div id="name-message" class="validation-message alert alert-danger">请输入用户名</div>

				<c:set var="registerNameMsg"
					value="${requestScope.REQ_REGISTER_NAME_MSG}" />
				<c:if test="${not empty registerNameMsg}">
					<div class="validation-message-backend alert alert-danger">
						<c:out value="${registerNameMsg}" />
					</div>
				</c:if>

			</div>


			<div id="register-input-pwd">
				<div class="pwd">密码</div>
				<input name="password" id="registerPwd" class="ipusername" 
					type="password" 
					title="1.密码长度为8~16位。2.至少1个大写字母,1个小写英文字母,1位数字,有1个特殊字符(#?!@$%^&*-)。3.密码不能包含空格和中文。"
					data-toggle="tooltip"
					data-placement="right"
					value='<c:out value="${param.password}" />' />
				<div id="pwd-message" class="validation-message alert alert-danger">请输入用户名</div>

				<c:set var="registerPwdMsg"
					value="${requestScope.REQ_REGISTER_PWD_MSG}" />
				<c:if test="${not empty registerPwdMsg}">
					<div class="validation-message-backend alert alert-danger">
						<c:out value="${registerPwdMsg}" />
					</div>
				</c:if>

			</div>


			<div id="register-input-twicepwd">
				<div class="twicepwd">确认密码</div>
				<input name="confirmPassword" id="confirmPwd" class="ipusername"
					type="password" value='<c:out value="${param.confirmPassword}" />' />
				<div id="confirm-message"
					class="validation-message alert alert-danger">请输入用户名</div>

				<c:set var="registerConfirmMsg"
					value="${requestScope.REQ_REGISTER_CONFIRM_MSG}" />
				<c:if test="${not empty registerConfirmMsg}">
					<div class="validation-message-backend alert alert-danger">
						<c:out value="${registerConfirmMsg}" />
					</div>
				</c:if>
			</div>
			<div id="register-input-code">
				<div class="register-code">验证码</div>
				<input name="authCode" id="registerCode" class="icode" type="text"
					value='<c:out value="${param.authCode}"/>' /> <img id="codeImg"
					src="code.do">
				<div id="code-message" class="validation-message alert alert-danger">请输入用户名</div>

				<c:set var="registerCodeMsg"
					value="${requestScope.REQ_REGISTER_CODE_MSG}" />
				<c:if test="${not empty registerCodeMsg}">
					<div class="validation-message-backend alert alert-danger">
						<c:out value="${registerCodeMsg}" />
					</div>
				</c:if>

			</div>
			<div>
				<input class="register-submit" type="submit" value="注册保存" />
			</div>
			<div class="login-button">
				<a href="login.view">已有账号，去登录</a>
			</div>
		</form>
	</div>

	<!-- 页尾 -->
	<c:import url="bottom.jsp" />

</body>
</html>
