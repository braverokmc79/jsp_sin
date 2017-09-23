<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<style>
#form1{
	padding:10px;
	border: 2px solid #666;
	background-color:#F9F9F9;
}
</style>
</head>
<body>
	
	<div class="row">
		<div class="col-xs-2 col-md-3"></div>
		<div class="col-xs-6 col-md-6">
				<form class="form-horizontal" id="form1" action="ResponseProc.jsp" method="post">
					<div class="form-group">
						<label for="id" class="col-sm-2">아이디</label>
						<div class="col-sm-10">
						<input type="text" class="form-control" name="id" id="id">
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2">패스워드</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="pass" id="name">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-12">
						  <div class="text-center">
							<input type="submit" value="로그인" class="btn btn-success">
							<input type="reset" value="취소" class="btn btn-danger">
							</div>
						</div>
					</div>
					
				</form>
		</div>
		<div class="col-xs-3 col-md-3"></div>
	</div>


</body>
</html>