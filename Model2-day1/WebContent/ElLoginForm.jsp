<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>
<div style="margin-top: 50px;"></div>
<div class="row">
	<div class="col-xs-4 col-sm-4"></div>
	 <div class="col-xs-4 col-sm-4">
	   <form action="ElLoginProc.jsp" method="post">
	   <table class="table">
	    <thead>
	       <tr>
	       	<td colspan="2" class="text-center"><h2>로그인</h2></td>
	       </tr>
	    </thead>
	     <tr>
	       <td>아이디</td>
	       <td><input type="text" name="id" id="id" class="form-control"></td>
	     </tr>
	     
	     <tr>
	       <td>패스워드</td>
	       <td><input type="password" name="password" id="password" class="form-control"> 
	       </td>
	     </tr>
	     
	     <tr>     
	       <td colspan="2" class="text-center"><input type="submit" value="로그인" class="form-control"
	       			style="background-color:orange;"></td>
	     </tr>
	   </table>
	   </form>
	 </div>

</div>



</body>
</html>


