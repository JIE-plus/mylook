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
<link rel="stylesheet" href="static/css/bottom.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>


</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">

	<c:import url="header.jsp" />
	<h1>爱好分类</h1>
	<form method="post" action="upload.do" enctype="multipart/form-data">
		<div>
			关键字：<input type="text" name="keyword" required>
		</div>
		<%-- 若上传多个文件，则需要多个file类型的input元素，name属性也必须有，其值可不同 --%>
		<div>
			文件：<input type="file" name="file">
		</div>
		<div>
			<input type="submit" value="Upload">
		</div>
	</form>

</body>
</html>

