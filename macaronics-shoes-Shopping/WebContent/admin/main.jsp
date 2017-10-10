<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>    
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Login</title>
    <!-- Bootstrap -->
    <link href="../Bootstrap-Admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../Bootstrap-Admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="../Bootstrap-Admin/assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="../Bootstrap-Admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    

<!-- script 태그에서 가져오는 자바스크립트 파일의 순서에 주의해야한다! 순서가 틀릴경우 자바스크립트 오류가 발생한다. -->
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/rsa.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/prng4.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/rsa/rng.js"></script>
<script type="text/javascript" src="${request.getContextPath() }/js/login.js"></script>

  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin">
       
         <c:choose>
           <c:when test='${param.message=="error" }'>
            <h3 class="form-signin-heading  text-center">
             <small style="color:red;">아이디와 비밀번호가 일치하지 않습니다.</small>
             </h3>
           </c:when>
         	<c:otherwise>
         	 <h2 class="form-signin-heading  text-center">
         		관리자 로그인
         	</h2>
         	</c:otherwise>
         </c:choose>
         
        
        <input type="text" class="input-block-level" placeholder="아이디" id="username"  value="admin">
        <input type="password" class="input-block-level" placeholder="비밀번호" id="password" value="1111">
        <label class="checkbox">
         
        </label>
        <div class="text-center"><button class="btn btn-large btn-primary" 
        type="button" onclick="validateEncryptedForm(); return false;">로그인</button></div>
      </form>


    <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
    <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />
  <csrf:form  id="securedLoginForm" name="securedLoginForm"
     action="${request.getContextPath() }/admin/adminLoginProc.jsp" method="post" style="display: none;">
       <input type="hidden" name="securedUsername" id="securedUsername" value="" />
       <input type="hidden" name="securedPassword" id="securedPassword" value="" />
 
   </csrf:form>




    </div> <!-- /container -->
    <script src="../Bootstrap-Admin/vendors/jquery-1.9.1.min.js"></script>
    <script src="../Bootstrap-Admin/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>