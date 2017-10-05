<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/Header.jsp" />  
 </head> 
<body>


  <!--  error section -->
  <section id="aa-error">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-error-area">
            <h3>  CSRF Attack Detected & 404</h3>
            <span>잘못된 접근 이거나, 존재하지 않는 페이지 입니다.</span>
          	<p>Macaronics.net - Developer  Jun Ho Choi </p>
            <a href="MacaronicsServlet?command=index"> Go to Homepage</a>
          
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / 404 error section -->

     <!-- FOOTER -->
<nav class="avbar navbar-inverse navbar-fixed-bottom">
  <div class="container text-center" style="color:#fff;">
  <p>&nbsp;</p>
   <p ><a href="http://macaronics.net/" style="color:#fff;">Macaronics.net</a></p>  
    <p>&nbsp;</p>
  </div>
</nav>
   


