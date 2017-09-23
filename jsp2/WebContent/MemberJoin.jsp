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
    <h2>회원가입</h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table class="table table-boardered">
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" name="id" placeholder="id를 넣으세요"></td>		
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" class="form-control" name="pass1" placeholder="비밀번호는 영문만 넣어주세요"></td>		
			</tr>
			
			<tr>
				<th>패스워드확인</th>
				<td><input type="password" class="form-control" name="pass2"></td>		
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="email" class="form-control" name="email"></td>		
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input type="tel" class="form-control" name="tel"></td>		
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" class="form-control" name="address"></td>		
			</tr>

			
			<tr>
				<td colspan="2">
				<input type="submit" class="btn btn-primary" value="전송">
				<input type="reset" class="btn btn-danger" value="취소">
				</td>
			</tr>
			
			
		</table>
	</form>
	</div>
	
	</div>
	</div>
</div>
</body>
</html>