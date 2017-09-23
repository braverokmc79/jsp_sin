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
				<th>당신의 관심분야</th>
				<td>
				<input type="checkbox"  name="hobby" value="캠핑">캠핑 &nbsp;&nbsp;
				<input type="checkbox"  name="hobby" value="등산">등산 &nbsp;&nbsp;
				<input type="checkbox"  name="hobby" value="영화">영화 &nbsp;&nbsp;
				<input type="checkbox"  name="hobby" value="독서">독서 &nbsp;&nbsp;
				</td>		
			</tr>
			
			<tr>
				<th>당신의 직업은</th>
				<td>
				 <select name="job" class="form-control">
				 	<option value="교사">교사</option>
				 	<option value="변호사">변호사</option>
				 	<option value="의사">의사</option>
				 	<option value="기술사">기술사</option>
				 </select>
				</td>		
			</tr>
			
						
			<tr>
				<th>당신의 연력은</th>
				<td>
				<input type="radio"  name="age" value="10">10대 &nbsp;&nbsp;
				<input type="radio"  name="age" value="20">20대 &nbsp;&nbsp;
				<input type="radio"  name="age" value="30">30대 &nbsp;&nbsp;
				<input type="radio"  name="age" value="40">40대 &nbsp;&nbsp;
				</td>		
			</tr>
			
			<tr>
				<th>하고 싶은 말</th>
				<td>
				 <textarea rows="5" cols="40" name="info" class="form-control"></textarea>
				</td>		
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