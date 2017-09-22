<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 에러페이지 입니다.
 	
 	<a href="PageDirective.jsp">이전페이지</a>
 
 <br>
 에러 타입 : <%= exception.getClass().getName() %>
 
 <br> 에러 메세지 : <%= exception.getMessage() %>


</body>
</html>