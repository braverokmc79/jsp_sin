<%@page import="net.macaronics.web.dto.MemberVO"%>
<%@page import="net.macaronics.web.dao.MemberDAO"%>
<%@page import="config.LoginServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginServlet login =new LoginServlet();
	if(login.processRequest(request, response)){
		//로그인 성공시
		MemberDAO dao =MemberDAO.getInstance();
		MemberVO   vo=dao.getMember((String)request.getAttribute("username"));
		session.setAttribute("loginUser", vo);
		response.sendRedirect("/index.html");
	}else{
		//로그인 실패
		//request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		//request.getRequestDispatcher("/member/loginForm.jsp").forward(request, response);
		response.sendRedirect("/member/loginForm.jsp?msg=failed");
	}
	
%>
