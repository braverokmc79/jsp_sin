<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">답변글 입력하기</h2><p></p>
		<form action="BoardReWriteProcCon.do" method="post">
			<div class="table table-responsive">
					  <table class="table table-striped">
		 	<tr>
		 		<td>작성자</td>
		 		<td><input type="text"  class="form-control" name="writer"></td>
		 	</tr>
		 	<tr>
		 		<td>제목</td>
		 		<td><input type="text"  class="form-control" name="subject" value="[답변]"></td>
		 	</tr>
		 	<tr>
		 		<td>이메일</td>
		 		<td><input type="email"  class="form-control" name="email"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>비밀번호</td>
		 		<td><input type="password"  class="form-control" name="password"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>글내용</td>
		 		<td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
		 	</tr>
		  	<tr>	
		 		<td colspan="2"  class="text-center">
		 			<input type="hidden" name="ref"  value="${ref }">
			 		<input type="hidden" name="re_step"  value="${re_step }">
			 		<input type="hidden" name="re_level"  value="${re_level }">
		 		
		 			<input type="submit" value="답글쓰기완료" class="btn btn-success">
		 			<input type="reset" value="취소" class="btn btn-warning">
		 			<input type="button"  class="btn btn-primary" onclick="location.href='BoardListCon.do'" value="전체글보기">
		 		</td>
		 	</tr>
		 	
		  </table>
		
	
			</div>
		</form>	
	</div>
</div>


<jsp:include page="Bottom.jsp"/>
</body>
</html>




