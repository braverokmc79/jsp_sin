<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%
	int i =4;
%>
 
<c:if test="${4 >3 }">
  안녕하세요.
</c:if>

--%>

<!--  변수 선언 -->
<c:set var="i" value="4" />


<!--  if 문 사용법 -->
<c:if test="${i >3 }" >
  안녕하세요

</c:if>


<!-- 반복문 for -->

<c:forEach begin="1" end="10" var="i" step="3">
 <c:set var="sum" value="${sum=sum+i }" />
 <c:out value="${i }" />
</c:forEach> 

${sum }



</body>
</html>
