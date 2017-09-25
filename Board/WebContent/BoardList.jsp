<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>
<%
	//전체 게시글의 내용을 jsp 쪽으로 가져와야 함
	BoardDAO bdao =new BoardDAO();

	//전체게시글을 리턴 받아주는 소스
	Vector<BoardBean> vec =bdao.getAllBoard();
%>

<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">전체 게시글 보기</h2>
		<div class="table-responsive">
		<table class="table table-bordered table-striped" >
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
<%-- 			<%
				int k=0;
				for(BoardBean bean : vec){
				 	
			%>
			<tr>		
			<td><%= k+1%></td>
			<td><a href="BoardInfo.jsp?num=<%= bean.getNum() %>" ><%= bean.getSubject()  %></a></td>
			<td><%=bean.getWriter() %></td>
			<td><%= bean.getReg_date() %></td>
			<td><%= bean.getReadcount() %></td>
			</tr>
			<%	k++;} %>		
			 --%>
			<%
				for(int i=0; i<vec.size(); i++){
					BoardBean bean =vec.get(i); //벡터에 저장되어 있는 빈클래스를 하나씩 추출
			%>		
							<tr>		
			<td><%= i+1%></td>
			
			<td><a href="BoardInfo.jsp?num=<%= bean.getNum() %>" >
			<%
				if(bean.getRe_step() >1){
					for(int j =0; j<(bean.getRe_step()*5); j++){
			%>
					&nbsp;
			<%						
					}
				}		
			%>
			<%= bean.getSubject()  %></a></td>
			
			
			<td><%=bean.getWriter() %></td>
			<td><%= bean.getReg_date() %></td>
			<td><%= bean.getReadcount() %></td>
			</tr> 	
			<%	}%>
			
			<tr>
				<td colspan="5" class="text-center">
				  <input type="button" value="글쓰기"  onclick="location.href='BoardWrite.jsp'"  class="btn btn-warning">
				</td>
			</tr>
		</table>
		</div>
	
	</div>
</div>


<jsp:include page="Bottom.jsp"/>

</body>
</html>

