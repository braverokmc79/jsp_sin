<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>  
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/Header.jsp" /> 
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>   
 </head> 
<body>
<jsp:include page="../include/HeaderMenu.jsp" />


  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="/dailyShop/img/slider/4.jpg" alt="fashion img" height="300" style="margin-left: auto; margin-right: auto; display: block;">
   <div class="aa-catg-head-banner-area">
     <div class="container">
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->


  <!-- product category -->
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
          <div class="aa-product-catg-content">
          
          <csrf:form action="MacaronicsServlet?command=qna_write" method="post">
            <div class="aa-product-catg-body">
     			<h2>1:1 고객 게시판</h2>	
                <h3>고객님의 질문에 대해서 운영자가  1:1 답변을 드립니다.</h3>
        		<div class="table-responsive">
        		<table class="table">
        			<tr>
        			  <th>제목</th>
        			  <td><input type="text"  name="subject" class="form-control"/></td>
        			</tr>
					 <tr>
					   <th>내용</th>
					   <td><textarea name="content" id="content"></textarea></td>
					 </tr>
        		</table>
        		</div>
            </div>
            
            <div class="text-center">
           		 <input type="submit" value="글쓰기" class="btn btn-success">
                <input type="reset" value="취소" class="btn btn-warning">
            	<input type="button" value="쇼핑 계속하기" class="btn btn-primary"
            	 onclick="location.href='MacaronicsServlet?command=index'" >
            </div>
			</csrf:form>
			
			
          </div>
        </div>
        
        
		<jsp:include page="../include/MyLeftMenu.jsp" />
       
       
      </div>
    </div>
  </section>
  <!-- / product category -->

<script type="text/javascript">



//1 첫번째
CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
          width:'100%',
          height:'500px'
     	
          	
});


</script>

<jsp:include page="../include/Footer.jsp" />



