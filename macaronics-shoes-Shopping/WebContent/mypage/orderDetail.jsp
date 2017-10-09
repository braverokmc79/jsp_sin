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
          		<h3 class="text-center">My Page (주문 상세 정보 - ${orderDetail.pname })</h3>
            <div class="aa-product-catg-body">
              <div class="table-responsive">
              <table class="table table-striped">
                <thead><tr><td colspan="4">주문자 정보</td></tr></thead>
              	 <tr class="danger">
              	   <th>주문 일자</th>
              	   <th>주문번호</th>
              	   <th>주문자</th>
              	   <th>주문 총액</th>
              	 </tr>     	 
              	   	 <tr>
              	   	  <td><fmt:formatDate value="${orderDetail.indate }" type="date" /></td>
              	   	  <td>${orderDetail.oseq }</td>
              	   	  <td>${orderDetail.mname }</td>
              	   	  <td><fmt:formatNumber value="${orderTotalPrice }" type="currency" /></td>
              	   	 </tr>
              </table>
              </div>
              
              
             <div class="table-responsive">
              <table class="table table-striped">
                <thead><tr><td colspan="4">주문자 상품 정보</td></tr></thead>
              	 <tr class="danger">
              	   <th>상품명</th>
              	   <th>상품별주문번호</th>
              	   <th>수량</th>
              	   <th>가격</th>
              	   <th>처리 상태</th>
              	 </tr>
              	
              	   <c:forEach items="${orderList}" var="orderVO">
              	   	 <tr>
              	   	  <td>${orderVO.pname }</td>
              	   	  <td>${orderVO.odseq }</td>
              	   	  <td>${orderVO.quantity }</td>
              	   	  <td><fmt:formatNumber  type="currency"  value="${orderVO.price2*orderVO.quantity }"/></td>
              	   	  <c:choose>
              	   	   <c:when test='${orderVO.result=="1" }'>
              	   	   	<td> 진행중</td>
              	   	   </c:when>
              	   	   <c:otherwise>
              	   	        <td><span class="danger">처리완료</span></td> 
              	   	   </c:otherwise>
              	   	  </c:choose>
              	   	  
              	   	 </tr>
              	   </c:forEach>
             	            
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
