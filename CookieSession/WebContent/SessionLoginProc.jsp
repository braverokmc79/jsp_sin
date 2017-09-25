<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<div class="text-center">
	<h2 >세션 로그인 처리 1</h2>
<%
	request.setCharacterEncoding("UTF-8");

	//사용자로부터 데이터를 읽어드림
	String id =request.getParameter("id");
	String pass=request.getParameter("pass");
	
	//아이디외 패스워드를 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	//세셔의 유효시간 설정
	session.setMaxInactiveInterval(60);
	
	response.sendRedirect("SessionMain.jsp");
%>

	 <h2>당신의 아이디는 <%= id %>입니다. 패스워드는 <%= pass %>입니다.</h2>
	 <%-- <a href="SessionLoginProc2.jsp?id=<%=id%>&pass=<%= pass %>" >다음페이지로 이동</a> --%>	
	 <a href="SessionLoginProc2.jsp" >다음페이지로 이동</a>
	
	</div>
	
	
</body>
</html>