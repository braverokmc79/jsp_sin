<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

int i=10;

<h2>1-10 까지의 숫자를 화면에 표시</h2>

<%

	//1-10 까지의 숫자를 화면에 출력하시오.
	for(int i=1; i<10; i++){
		System.out.println(i);
%>
		<%=i %><br>	
		
<%		
	}

%>



</body>
</html>