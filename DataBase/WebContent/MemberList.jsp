<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<!--  1.데이터 베이스에서 모든회원의 정보를 가져옴. 2. table 태그를 이용하여 화면에 정보를 출력 -->
	<%
		 MemberDAO mdao =new MemberDAO();
		 //회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
		 Vector<MemberBean> vec =mdao.allSelectMember();
	
	%>

</body>
</html>