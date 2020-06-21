<%--
 COPYRIGHT (C) 2014-2015 BY MULDINI. ALL RIGHTS RESERVED.
--%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html;charset=utf-8"%>
<html lang="zh-cn">
<head>
<title>Error</title>
<link rel="stylesheet" href="css/myface.css">
</head>
<body>
  <img src="static/img/fun0.gif">
  <p>
    啊哈<br>we are 真 de SORRY<br>出错啦<br> ^___________^
  </p>
  <%
      // 当前页面被设为错误页面时（在web.xml中配置）
      // 记错误日志。先记录HTTP错误状态码。
      Integer errorStatusCode = (Integer) request
              .getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
      System.err.println("HTTP Error Status Code=" + errorStatusCode);

      // 若对应的错误信息不为空，则将其记入日志。
      String errorMessage = (String) request
              .getAttribute(RequestDispatcher.ERROR_MESSAGE);
      if (errorMessage != null && !errorMessage.isEmpty()) {
          System.err.println("HTTP Error Message=" + errorMessage);
      }
      
      // 当ajax请求报错时，客户端不会显示error.jsp返回结果。
      // 为支持用ajax控制出错页面，删去了下面这行“为支持ie11错误页面显示”的代码。
      // response.setStatus(HttpServletResponse.SC_OK);
  %>
</body>
</html>