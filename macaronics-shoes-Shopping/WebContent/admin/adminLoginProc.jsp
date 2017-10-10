<%@page import="net.macaronics.web.admin.controller.AdminLoginAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>    
<%

    AdminLoginAction  login =new AdminLoginAction();
	String url="MacaronicsServlet?command=admin_login_form&message=error";
	
	boolean result =login.processRequest(request, response);
	System.out.print("반환 값 :  " + result);
	 if(result){
		 System.out.print(request.getAttribute("username"));
			 //로그인 성공
			 session.setAttribute("wokerid", request.getAttribute("username"));
			// url="MacaronicsServlet?command=admin_product_list";
			 url="MacaronicsServlet?command=admin_product_list";
	}
	response.sendRedirect(url);

%>    
