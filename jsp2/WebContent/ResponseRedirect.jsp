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
			
				<h2>ResponseRedirect.jsp 페이지 입니다.</h2>
				<%
					request.setCharacterEncoding("UTF-8"); //post 방식 한글 처리
					
					String id =request.getParameter("id"); //request 객체에 담겨진 사용자 정보중 id만 추출
					
					String phone= request.getParameter("phone");
				%>	
				<h3> 아이디 :  <%= id %> ,  폰 : <%= phone %></h3>
		</div>
		<div class="col-xs-3 col-md-3"></div>
	</div>


</body>
</html>