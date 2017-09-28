<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int i=3;
	out.println("i  = "+ i);
	request.setAttribute("ia", 3);
	request.setAttribute("ia2", 3);
%>
<p>
 i = <%=i >4%> 
</p>
i =${ia > 4}
<p>
 i = <%="3" +4%> 
</p>
i =${ia2 + 4}


</body>
</html>





