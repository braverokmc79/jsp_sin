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

  <!-- product category -->
  <section id="aa-product-details">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-details-area">
            <div class="aa-product-details-content">
              <div class="row">
                <!-- Modal view slider -->
                <div class="col-md-5 col-sm-5 col-xs-12">                              
                  <div class="aa-product-view-slider">                                
                    <div id="demo-1" class="simpleLens-gallery-container">
                      <div class="simpleLens-container">
                        <div class="simpleLens-big-image-container"><a data-lens-image="images/${productVO.image }" class="simpleLens-lens-image">
                        <img src="images/${productVO.image }" class="simpleLens-big-image">
                        </a></div>
                      </div>
                    </div>
                  </div>
                </div>
              
              
                <!-- Modal view content -->
                <div class="col-md-7 col-sm-7 col-xs-12">
                  <form  name="formm" id="formm" action="MacaronicsServlet">
                  <div class="aa-product-view-content">
                    <h3>${productVO.name}</h3>
                    <div class="aa-price-block">
                      <span class="aa-product-view-price"><fmt:formatNumber type="currency" value="${productVO.price2}"/></span>
                      
                    </div>
                   <p>${productVO.content}</p>
                    <h4>수량</h4>
                    <div class="aa-prod-view-size">
                     <input type="number" name="quantity" value="1"  min="1" max="100">
					<input type="hidden" name="pseq" value="${productVO.pseq}">		
                    </div>
                    
                    <div class="aa-prod-view-bottom">
                      <input type="hidden" name="command" >
                      
                      <a  class="aa-add-to-cart-btn" href="#" onclick="go_cart()">장바구니에 담기</a>
                      <a class="aa-add-to-cart-btn" href="#"  >즉시구매</a>
                    </div>
                  </div>
                  
                  </form>       
                </div>
              </div>
            </div>
            
            

          
            <!-- Related product -->
            <div class="aa-product-related-item">
              <h3>메인 상품</h3>
              <ul class="aa-product-catg aa-related-item-slider">
		   
		   
		   	<c:forEach items="${bannerProduct }" var="productVO">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image}" alt="신상품 이미지" width="250" height="300"></a>
                            <a class="aa-add-card-btn cart-ajax" href="#" data-pseq="${productVO.pseq}"><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>
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
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / product category -->






<jsp:include page="../include/Footer.jsp" />

