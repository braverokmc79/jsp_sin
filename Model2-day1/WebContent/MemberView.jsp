<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>

<p></p>
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-6">
	
	 <p>id : ${bean.id }</p>
	 <p>password : ${bean.password }</p>
	 <p>email : ${bean.email }</p>
	 <p>tel : ${bean.tel }</p> 
	 <p>address : ${bean.address }</p> 
	 
</div>
</div>

</body>
</html>