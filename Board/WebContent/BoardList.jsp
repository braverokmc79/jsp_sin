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
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">전체 게시글 보기</h2>
		
	
	
	</div>
</div>


<jsp:include page="Bottom.jsp"/>

</body>
</html>


