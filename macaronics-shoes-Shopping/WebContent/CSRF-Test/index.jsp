<%@page import="model.BoardListTest"%>
<%@page import="config.MybatisService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
	//out.print(test.memberList().toString());
%>


<csrf:form id="formTest2" name="formTest2" action="protect.html">
	<input type="text" name="text" value="text"/>
	<input type="submit" name="submit" value="submit"/>
</csrf:form>


Welcome to the OWASP CSRFGuard Test Application! Where would you like to go?
<br/>
<strong>Tests:</strong>
<ul>
	<li><a href="javascript.html">JavaScript Token Injection</a></li>
	<li><a href="tag.jsp">JSP Tag Token Injection</a></li>
	<li><a href="redirect.jsp">JSP Redirect Token Injection</a>
	<li><a href="forward.jsp">JSP Forward Token Injection</a>
	<li><a href="ajax.html">Ajax Token Injection</a></li>
	<li><a href="upload.html">Multipart Verification</a>
</ul>
<br/>
<strong>Utilities:</strong>
<ul>
	<li><a href="session.jsp?action=invalidate">Invalidate Session</a>
</ul>




<script src="JavaScriptServlet"></script>


</body>
</html>

