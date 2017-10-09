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
          
            <div class="aa-product-catg-body">
              <div class="table-responsive">
              <table class="table table-striped">
              	 <tr class="danger">
              	   <th>상품명</th>
              	   <th>수량</th>
              	   <th>가격</th>
              	   <th>주문일</th>
              	   <th>진행상태</th>
              	 </tr>
              	 <tr>
              	   <c:forEach items="${orderList}" var="orderVO">
              	   	 <tr>
              	   	  <td>${orderVO.pname}</td>
              	   	  <td>${orderVO.quantity }</td>
              	   	  <td><fmt:formatNumber type="currency"  value="${orderVO.price2*orderVO.quantity }"/></td>
              	   	  <td><fmt:formatDate value="${orderVO.indate }" type="date" /></td>
              	   	  <td>처리 진행 중</td>
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
        
        
        <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
          <aside class="aa-sidebar">
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
              <h3>Category</h3>
              <ul class="aa-catg-nav">      
             <li><a href="MacaronicsServlet?command=category&kind=1">남성운동화</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=2">여성운동화</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=3">남성구두</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=4">여성구두</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=5">On Sale</a></li>
           
              </ul>
            </div>
       
           
          </aside>
                
        </div>
       
      </div>
    </div>
  </section>
  <!-- / product category -->






<jsp:include page="../include/Footer.jsp" />



