$(document).ready(function() {

	var registerButton = $(".register-button");
	if (registerButton != null) {
		registerButton.click(function() {
			return goToRegister();
		});
	}

	var loginForm = $("#login-form");
	if (loginForm != null) {
		loginForm.submit(function() {
			return validateLoginForm();
		});
	}
	
});



function goToRegister() {
	window.location.href = "register.view";
}

function validateLoginForm() {
	
	hideElementsByClassName("validation-message");
	hideElementsByClassName("validation-message-backend");
	hideElementsByClassName("validation-message-success");

	var isValid = true;

	var loginName = $("#loginName");
	var loginPwd = $("#loginPwd");

	var cnValid = RegExp(/^[\u4E00-\u9FA5a-zA-Z0-9]+$/);
	var pwdValid = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);

	if (loginName.val() == undefined || loginName.val() == null || loginName.val() == '' || loginName.val() ==
		'null' || loginName.val() == 'undefined') {

		$("#login-name-message").html("请您输入用户名");
		$("#login-name-message").css("display", "inline");
		loginName.focus();
		isValid = false;

	} else if (loginName.val().length < 6 || loginName.val().length > 8 || !cnValid.test(loginName.val())) {
		$("#login-name-message").html("用户名输入有误！");
		$("#login-name-message").css("display", "inline");
		loginName.focus();
		isValid = false;
	}

	if (loginPwd.val() == undefined || loginPwd.val() == null || loginPwd.val() == '' || loginPwd.val() ==
		'null' || loginPwd.val() == 'undefined') {
		$("#login-pwd-message").html("请输入密码");
		$("#login-pwd-message").css("display", "inline");
		loginPwd.focus();
		isValid = false;
	} else if (loginPwd.val().length < 8 || loginPwd.val().length > 16 || !pwdValid.test(loginPwd.val()) ||
		loginPwd.val().indexOf(" ") != -1) {
        $("#login-pwd-message").html("密码输入有误！");
        $("#login-pwd-message").css("display", "inline");
        loginPwd.focus();
        isValid = false;
	}

	return isValid;
}

// 根据类名隐藏对应元素
function hideElementsByClassName(className) {
	var elements = $("." + className);
	for (var x = 0; x < elements.length; x++) {
		elements.eq(x).css("display", "none");
	}
}
