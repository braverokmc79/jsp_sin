<%@page import="model.BoardListTest"%>
<%@page import="config.MybatisService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%=
	MybatisService.getFactory()

%>
<br>
Mybais 연결 테스트
<%
	
	BoardListTest test =new BoardListTest();
	out.print(test.memberList().toString());
%>

</body>
</html>