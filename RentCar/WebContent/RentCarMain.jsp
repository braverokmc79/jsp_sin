<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<jsp:include page="Header.jsp" />
  </head>
 <body>
  <!-- top 메뉴 -->
<jsp:include page="Top.jsp" />

<%
	String center =request.getParameter("Center");
	//처음 실행시에는 center 값이 넘어오지 않기에
	if(center==null){//null 처리해줌
		center="Center.jsp";//디폴트 cetner 값을 부여
	}
%>

<jsp:include page="<%= center %>" />
 
 
<!--  Bottom -->
 <jsp:include page="Bottom.jsp"/>
 
 
 