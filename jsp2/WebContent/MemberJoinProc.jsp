<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	
   <jsp:include page="Header.jsp" />
</head>
<body>
	 <div class="container">
	<div class="row">
	<div class="col-sm-12 text-center" >
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
		 
		 <h2>회원 정보 보기</h2>
		 <%
		 	request. setCharacterEncoding("UTF-8");
		 %>
		 <!--  request 로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean -->
		 <jsp:useBean id="mbean" class="bean.MemberBean"> <!-- 객체생성 MemberBean mbean = new MemberBean() -->
		 <!-- Jsp 내용을 자바빈 클래스 (MemberBean의미 )에 데이터를 맵핑 넣어줌) -->
		 	<%-- <jsp:setProperty name="mbean" property="id"/> --%>
		 	<jsp:setProperty name="mbean" property="*"/> <!-- 자동으로 모두 맵핑시켜주시오 -->
		 </jsp:useBean>
		 	
			<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
			<h2>당신의 패스 <jsp:getProperty property="pass1" name="mbean"/></h2>
			<h2>당신의 이메일 <jsp:getProperty property="pass2" name="mbean"/></h2>
		
			<h2>당신의 전화는 <%= mbean.getTel() %></h2>
		</div>
	</div>
	</div>
</div>
</body>
</html>