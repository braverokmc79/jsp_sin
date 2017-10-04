<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session Utilities</title>
</head>
<body>
<%
String action = request.getParameter("action");

if("invalidate".equals(action)) {
	session.invalidate();
	request.getSession(true);
	%><strong>Session Invalidated!</strong><%
}
%>
</body>
</html>