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
<!-- 게시글 보기에 카운터링을 설정하기위한 변수들을 선언  -->
<%
 //화면에 보여질 게시글의 개수를 지정
 int pageSize=10;
 //현재 카운터를 클릭한 번호값을 읽어옴
 String pageNum =request.getParameter("pageNum");
 //만약 처음 boardList.jsp를 클릭하거나 수정 삭제 등 다른 게시글에서 이 페이지로 넘어오면 pageNum값이 없기에 null 처리를 해줌
 if(pageNum==null){
	 pageNum="1";
 }
 int count =0; //전체 글의 갯수를 저장하는 변수
 int number =0; //페이지 넘버링 변수
 
 //전체 보고자 하는 페이지숫자를 저장
 int currentPage =Integer.parseInt(pageNum);
 	
 
 //전체 게시글의 내용을 jsp 쪽으로 가져와야 함
	BoardDAO bdao =new BoardDAO();

	//전체 게시글의 갯수를 읽어드린 메소드 호출
	count =bdao.getAllCount();
 
 
	//전체게시글을 리턴 받아주는 소스
	Vector<BoardBean> vec =bdao.getAllBoard();
%>

<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">전체 게시글 보기		
	  
		</h2>
		<p class="text-right">
		<input type="button" value="글쓰기"  onclick="location.href='BoardWrite.jsp'"  class="btn btn-warning">
		</p>
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
				
				</td>
			</tr>
		</table>
		</div>
	
	</div>
</div>


<jsp:include page="Bottom.jsp"/>
</body>
</html>





