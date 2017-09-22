<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>화면에 구구단을 출력하시오</h2>

<%
	for(int i=2;  i<10; i++){
		for(int j=1; j<10; j++){
			System.out.println(i+ " * " +j  + "  = " +i*j);
%>
		<%=i %>  +  <%= j %> = <%= i*j %>&nbsp;&nbsp;
		
<%			
		}
%>
		<br/>
	<% 
	    System.out.println();
	}
%>


</body>
</html>