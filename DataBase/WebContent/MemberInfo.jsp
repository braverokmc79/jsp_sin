<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<!-- 1.데이터 베이스에서 한회원의 정보를 가져옴 2. table태그를 이용하며 화면에 회원의 정보를 출력 -->
<%
	String id =request.getParameter("id");	//memberlist id 를 받아줌

	MemberDAO mdao =new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id); //해당하는 id의 화원정보를 리턴

%>
<div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Macaronics.net</a>
        </div>     
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2>회원 정보 보기</h2>
					<table class="table table-striped">
					  <tr>
						<td>아이디</td>
						<td><%= mbean.getId() %></td>
					  </tr>
					  
					  <tr>
						<td>이메일</td>
						<td><%= mbean.getEmail() %></td>
					  </tr>
					  
					  <tr>
						<td>전화</td>
						<td><%= mbean.getTel() %></td>
					  </tr>
					  
					  <tr>
						<td>취미</td>
						<td><%= mbean.getHobby() %></td>
					  </tr>
					  
					  <tr>
						<td>직업</td>
						<td><%= mbean.getJob() %></td>
					  </tr>
					  
					 <tr>
						<td>나이</td>
						<td><%= mbean.getAge() %></td>
					  </tr>
					  
					  <tr>
						<td>정보</td>
						<td><%= mbean.getInfo() %></td>
					  </tr>
					  
				
					  
					</table>
				

				</div>
		</div> <!-- col-sm-12 -->
	</div><!-- row -->
</div> <!-- container end-->
	
	
</body>
</html>