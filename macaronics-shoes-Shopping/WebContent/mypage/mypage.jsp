<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/Header.jsp" />  
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
          		<h3 class="text-center">My Page (${title })</h3>
            <div class="aa-product-catg-body">
              <div class="table-responsive">
              <table class="table table-striped">
              	 <tr class="danger">
              	   <th>주문일자</th>
              	   <th>주문번호</th>
              	   <th>상품명</th>
              	   <th>결제 금액</th>
              	   <th>주문 상세</th>
              	 </tr>
              	 <tr>
              	   <c:forEach items="${orderList}" var="orderVO">
              	   	 <tr>
              	   	  <td><fmt:formatDate value="${orderVO.indate }" type="date" /></td>
              	   	  <td>${orderVO.oseq }</td>
              	   	  <td>${orderVO.pname }</td>
              	   	  <td><fmt:formatNumber value="${orderVO.price2 }" type="currency" /></td>
              	   	  <td><a href="MacaronicsServlet?command=order_detail&oseq=${orderVO.oseq}" class="btn btn-warning">조회</a></td>
              	   	 </tr>
              	   </c:forEach>
              	 </tr>
              	            
              </table>
              </div>
                
            </div>
            
            <div class="text-center">
            	<input type="button" value="쇼핑 계속하기" class="btn btn-primary"
            	 onclick="location.href='MacaronicsServlet?command=index'" >
            </div>

          </div>
        </div>
        
        
       
		<jsp:include page="../include/MyLeftMenu.jsp" />
       
       
      </div>
    </div>
  </section>
  <!-- / product category -->



<jsp:include page="../include/Footer.jsp" />
