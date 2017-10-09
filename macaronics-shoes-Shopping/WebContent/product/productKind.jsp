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
            <div class="aa-product-catg-head">
              <div class="aa-product-catg-head-left">
              	Macaronics Shoes
              </div>
              <div class="aa-product-catg-head-right">
                <a id="grid-catg" href="#"><span class="fa fa-th"></span></a>
                <a id="list-catg" href="#"><span class="fa fa-list"></span></a>
              </div>
            </div>
            <div class="aa-product-catg-body">
              <ul class="aa-product-catg">
                <!-- start single product item -->
          
          
         	 	<c:forEach items="${productKindList }" var="productVO">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image}" alt="신상품 이미지" width="250" height="300"></a>
                            <a class="aa-add-card-btn cart-ajax"  href="#" data-pseq="${productVO.pseq}"  ><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">${productVO.name}</a></h4>
                              <span class="aa-product-price"><fmt:formatNumber type="currency" value="${productVO.price2}"/></span>
                            </figcaption>
                          </figure>                          
                        </li>
                        <!-- start single product item -->
                      </c:forEach>        
              </ul>
  
            </div>


            <div class="aa-product-catg-pagination">
              <nav>
                <ul class="pagination">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
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

