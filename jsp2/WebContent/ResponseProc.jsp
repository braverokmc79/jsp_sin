<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	
	<div class="row">
		<div class="col-xs-2 col-md-3"></div>
		<div class="col-xs-6 col-md-6">
			
				<h2>이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>
				<%
					request.setCharacterEncoding("UTF-8"); //post 방식 한글 처리
					
					String id =request.getParameter("id"); //request 객체에 담겨진 사용자 정보중 id만 추출
					
					//response.sendRedirect("ResponseRedirect.jsp");//흐름 제어
					
				%>	
				<%-- <jsp:forward page="ResponseRedirect.jsp"/> <!-- 흐름 제어 --> --%>
				
				<jsp:forward page="ResponseRedirect.jsp">
					<jsp:param value="mmmm" name="id" />
					<jsp:param value="1234" name="phone" />
				</jsp:forward>
				
				
				<h3> 아이디 :  <%= id %></h3>
		</div>
		<div class="col-xs-3 col-md-3"></div>
	</div>


</body>
</html>