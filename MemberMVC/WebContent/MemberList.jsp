<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>


<div class="row">
	<div class="col-sm-2"></div>
	
	
	<div class="col-sm-9">
		<h2 class="text-center">모든 회원 보기</h2>
		
		<div class="table-responsive">
			<table class="table table-striped">
				<tr>
				  <td>아이디</td>
				  <td>이메일</td>
				  <td>전화</td>
				  <td>취미</td>
				  <td>직업</td>
				  <td>나이</td>
				</tr>
			
				<c:forEach items="${v}" var="bean" >
				 <tr>
				    <td>${bean.id }</td>
				    <td><a href="#">${bean.email }</a></td>
				    <td>${bean.tel }</td>
				    <td>${bean.hobby }</td>
				    <td>${bean.job }</td>
				    <td>${bean.age }</td>
				 </tr>
				</c:forEach>
			
			</table>
		</div>
		
	</div>
	
</div>



</body>
</html>