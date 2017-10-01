<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>


<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8">
	<h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
	<div class="table table-responsive">
		<table class="table">
		<tr>
			<th class="success">글번호</th>
			<td>${bean.num}</td>
			<th class="success">조회수</th>
			<td>${bean.readcount}</td>
		</tr>
		  
		
		<tr>
			<th class="success">작성자</th>
			<td>${bean.writer}</td>
			<th class="success">작성일</th>
			<td>${bean.reg_date}</td>
		</tr>
		
		<tr>
			<th class="success">이메일</th>
			<td colspan="3">${bean.email}</td>
		</tr>
		
		<tr>
			<th class="success">제목</th>
			<td colspan="3">${bean.subject}</td>
		</tr>
		
		<tr>
			<th class="success">글 내용</th>
			<td colspan="3">${bean.content}</td>
		</tr>
		
		<tr>
			<td colspan="4" class="text-center">
			  <input type="button" class="btn btn-success"  value="답글 쓰기" 
onclick="location.href='BoardReWriteCon.do?num=${bean.num}&ref=${bean.ref}&re_step=${bean.re_step}&re_level=${bean.re_level}'"  		  >
	<input type="button" class="btn btn-warning" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'">		  
<input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bean.num}'">
<input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='BoardListCon.do'">
			</td>
		</tr>
	
			
		
		</table>
	</div>
	
	</div>
</div>




<jsp:include page="Bottom.jsp"/>
</body>
</html>