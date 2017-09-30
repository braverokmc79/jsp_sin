<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>

<div class="row">
 <div class="col-xs-3 col-sm3"></div>
 <div class="col-xs-6 col-sm6">
 	<h2 class="text-center">회원가입</h2>
 	<form action="Mproc2" method="post">
 	<table class="table">
 		<tr>
 		  <td>아이디</td>
 		  <td><input type="text" name="id" class="form-control"></td>
 		</tr>
 		<tr>
 		  <td>패스워드</td>
 		  <td><input type="password" name="password" class="form-control" ></td>
 		</tr>
 		<tr>
 		  <td>이메일</td>
 		  <td><input type="email" name="email"  class="form-control"></td>
 		</tr>
 		<tr>
 		  <td>전화</td>
 		  <td><input type="tel" name="tel" class="form-control" ></td>
 		</tr> 		
 		<tr>
 		  <td>주소</td>
 		  <td><input type="text" name="address" class="form-control"></td>
 		</tr> 		
 		<tr>
 		  <td colspan="2"  class="text-center">
 		  <input type="submit" value="회원가입"   class="btn btn-success">
 		  </td>
 		</tr>  		
 	</table> 	
 	</form>
 	
 	
 	
 </div>	
</div>


</body>
</html>