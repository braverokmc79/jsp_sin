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
		<h2 class="text-center">게시글 수정</h2><p>&nbsp;</p>
		<form action="BoardUpdateProcCon.do" method="post">
			<div class="table table-responsive">
					  <table class="table table-striped">
		 	<tr>
		 		<td class="danger">작성자</td>
		 		<td>${bean.writer}</td>
		 		<td class="danger">작성일</td>
		 		<td>${bean.reg_date}</td>
		 	</tr>
		 	<tr>
		 		<td class="danger">제목</td>
		 		<td colspan="3"><input type="text"  class="form-control" name="subject" value="${bean.subject}"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td class="danger">패스워드</td>
		 		<td colspan="3"><input type="password"  class="form-control" name="password"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td class="danger">글내용</td>
		 		<td colspan="3"><textarea  name="content" class="form-control">${bean.content}</textarea></td>
		 	</tr>
		 	
		  	<tr>	
		 		<td colspan="4"  class="text-center">
		 			<input type="hidden" name="num"  value="${bean.num}">
		 			<input type="hidden" name="pass"  value="${bean.password}">
		 			<input type="submit" value="글수정" class="btn btn-warning">
		 			<input type="button"  class="btn btn-primary" onclick="location.href='BoardListCon.do'" value="전체글보기">
		 		</td>
		 	</tr>
		  </table>
		
	
			</div>
		</form>	
	</div>
</div>



<jsp:include page="Bottom.jsp"/>
<script>
CKEDITOR.replace('content', {
		
	width:'100%',
	height:'350'
		
});

</script>
</body>
</html>