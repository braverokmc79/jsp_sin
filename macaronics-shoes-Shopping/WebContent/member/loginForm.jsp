<%@page import="java.net.URLEncoder"%>
<%@page import="config.GetIpAddress"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html >
<html>
<head>
<jsp:include page="../include/Header.jsp" />  


<!-- script 태그에서 가져오는 자바스크립트 파일의 순서에 주의해야한다! 순서가 틀릴경우 자바스크립트 오류가 발생한다. -->
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/rsa.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/prng4.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/rng.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/login.js"></script>


 </head> 
<body>
<jsp:include page="../include/HeaderMenu.jsp" />




<div class="row">
	
	<div class="col-xs-12 col-sm-12">
	<h2>&nbsp;</h2>	
	<h2 class="text-center">로그인</h2>
	</div>		
	
	<div class="col-xs-3 col-sm-3"></div>	

		
		
		<form class="form-horizontal">
		<div class="col-xs-8 col-sm-8">
	 	<p>&nbsp;</p>
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label for="id">아이디</label>
		 	</div>
		 	<div class="col-sm-6 text-left">
		 		<input type="text" class="form-control" name="id" id="username" >
		 		<p style="color:red;">${idError}</p>
		 	</div>
		 </div>
		 
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="pwd">패스워드</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="password" class="form-control" name="pwd" id="password">
		 		<p style="color:red;">${pwdError}</p>
		 	</div>
		 </div>
		</div>
		
		
		  <div class="col-xs-12 col-sm-12">
		 <div class="form-group text-center" >
		    <div class="col-xs-12 col-sm-12" style="color:red;">
		    <c:if test="${param.msg=='failed' }">
		    	<script>
		    		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		    		location.href="/MacaronicsServlet?command=login_form";
		    	
		    	</script>
		    	
		    </c:if>
		 	 
		 	</div>
		 </div>	
		 </div>
		
		
	  <div class="col-xs-12 col-sm-12">
		 <div class="form-group text-center" >
		    <div class="col-xs-12 col-sm-12">
		 	<input type="button" value="로그인" class="btn btn-primary" onclick="validateEncryptedForm(); return false;">
		 	<input type="reset" value="취소" class="btn btn-warning">
		 	</div>
		 </div>	
		 </div>
	</form> 
		 
		 
		 
        <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
        <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />
	<csrf:form  id="securedLoginForm" name="securedLoginForm" 
		 action="${request.getContextPath() }/member/loginproc.jsp" method="post" style="display: none;">
	       <input type="hidden" name="securedUsername" id="securedUsername" value="" />
           <input type="hidden" name="securedPassword" id="securedPassword" value="" />

	</csrf:form> 

	

</div>

<h2>&nbsp;</h2>
<h2>&nbsp;</h2>
<h2>&nbsp;</h2>
<h2>&nbsp;</h2>



<jsp:include page="../include/Footer.jsp" />



   

