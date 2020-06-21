$(document).ready(function() {

	var registerForm = $("#register-form");
	if (registerForm != null) {
		registerForm.submit(function() {
			return validateRegisterForm();
		});
	}
	
	var codeImg = $("#codeImg");
	if(codeImg != null){
		codeImg.click(function(){
			return getCodeImg();
		});
	}
	
	var registerName = document.getElementById("registerName");
	if(registerName != null){
		registerName.onblur = checkIfUserExists;
		
	}
	
	$(function () {
	   $('[data-toggle="tooltip"]').tooltip()
	})
	

});





function checkIfUserExists(){
	var registerName = $("#registerName").val();
	if(registerName == 0){
		return;
	}
	
    $.ajax({
    	url : "registerNameCheck.do?name=" + registerName,
        success : procResForcheckIfUserExists,
        error : handleError
    });
}

function procResForcheckIfUserExists(responseStr){
	var responseJson = JSON.parse(responseStr); // 解析返回字符串，{"result":true}
    var isExisted = responseJson.result;
    if (isExisted == true) {
        hideElementsByClassName("validation-message"); // 隐藏前端校验信息
        hideElementsByClassName("validation-message-backend"); // 隐藏后端校验信息

        $("#name-message").html("粉丝名已存在");
        $("#name-message").css("display", "inline");
    } else {
        $("#name-message").css("display", "none");
    }
}


function getCodeImg(){
	console.log("asdfa");
	$("#codeImg").attr("src","code.do");
}

function validateRegisterForm() {

	hideElementsByClassName("validation-message");
	hideElementsByClassName("validation-message-backend");
	hideElementsByClassName("validation-message-success");

	var isValid = true;

	var registerName = $("#registerName");
	var registerPwd = $("#registerPwd");
	console.log(registerPwd.val());
	var confirmPwd = $("#confirmPwd");
	var registerCode = $("#registerCode");
	
	var chValid = RegExp(/^[^\u4e00-\u9fa5]+$/);
	var cnValid = RegExp(/^[\u4E00-\u9FA5a-zA-Z0-9]+$/);
	var pwdValid = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/);


	if (registerName.val() == undefined || registerName.val() == null || registerName.val() == '' || registerName.val() ==
		'null' || registerName.val() == 'undefined') {
		$("#name-message").html("请您输入用户名");
		$("#name-message").css("display", "inline");
		isValid = false;
	} else if (registerName.val().length < 6 || registerName.val().length > 8) {
		$("#name-message").html("用户名的长度要6~8位");
		$("#name-message").css("display", "inline");
		$("#name-message").css("width", "160px");
		isValid = false;
	} else if (!cnValid.test(registerName.val())) {
		$("#name-message").html("用户名只包含英文,数字和中文");
		$("#name-message").css("display", "inline");
		$("#name-message").css("width", "230px");
		isValid = false;
	}

	if (registerPwd.val() == undefined || registerPwd.val() == null || registerPwd.val() == '' || registerPwd.val() ==
		'null' || registerPwd.val() == 'undefined') {
		console.log("asdfasd");
		$("#pwd-message").html("请您输入密码");
		$("#pwd-message").css("display", "inline");
		isValid = false;
	} else if (registerPwd.val().length < 8 || registerPwd.val().length > 16) {
		$("#pwd-message").html("密码的长度要8~16位");
		$("#pwd-message").css("display", "inline");
		$("#pwd-message").css("width", "160px");
		isValid = false;
	} else if (!pwdValid.test(registerPwd.val())) {
		$("#pwd-message").html("密码不符合要求");
		$("#pwd-message").css("display", "inline");
		isValid = false;
	} else if (registerPwd.val().indexOf(" ") != -1) {
		$("#pwd-message").html("密码不能包含空格");
		$("#pwd-message").css("display", "inline");
		isValid = false;
	}else if(!chValid.test(registerPwd.val())){
		$("#pwd-message").html("密码不能包含中文");
		$("#pwd-message").css("display", "inline");
		isValid = false;
	}

	if (confirmPwd.val() != registerPwd.val()) {
		$("#confirm-message").html("密码不一样");
		$("#confirm-message").css("display", "inline");
		isValid = false;
	} else if (confirmPwd.val() == undefined || confirmPwd.val() == null || confirmPwd.val() == '' || confirmPwd.val() ==
		'null' || confirmPwd.val() == 'undefined'){
		$("#confirm-message").html("请再次输入密码");
		$("#confirm-message").css("display", "inline");
		isValid = false;	
	}
	
	if (registerCode.val() == undefined || registerCode.val() == null || registerCode.val() == '' || registerCode.val() ==
		'null' || registerCode.val() == 'undefined') {
		$("#code-message").html("请输入验证码");
		$("#code-message").css("display", "inline");
		isValid = false;
	}else if(registerCode.val().indexOf(" ") != -1){
		$("#code-message").html("输入验证码有误！");
		$("#code-message").css("display", "inline");
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

function handleError(xhr) {
    $(document.body).html(xhr.responseText); // 若只是$(document)，jq会报错
//    document.write(xhr.responseText);
}

