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
 
<jsp:include page="include/HeaderMenu.jsp" />

 
  
  <!-- Start slider -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <c:forEach items="${bannerProduct}" var="productVO">
            <li>
              <div class="seq-model">
                <img data-seq src="images/${productVO.image }" alt="${productVO.name}"  width="1646" height="600"/>
              </div>
              <div class="seq-title">
               <span data-seq><fmt:formatNumber type="currency" value="${productVO.price2}"/></span>                
                <h2 data-seq>${productVO.name}</h2>                
                <p data-seq>${productVO.content}</p>
                <a data-seq href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            </c:forEach>        
          </ul>
      
      
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
 
  <!-- / slider -->
  
  
  <!-- Start Promo section -->
  <section id="aa-promo">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-promo-area">
            <div class="row">
              <!-- promo left -->
              <div class="col-md-5 no-padding">                
               
                <c:forEach items="${mainOnSale}"  begin="0" end="0" var="productVO">
                <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="images/${productVO.image }" alt="img"  width="585" height="480">                      
                      <div class="aa-prom-content">
                        <span>${productVO.name}</span>
                        <h4><a href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><fmt:formatNumber type="currency" value="${productVO.price2}"/></a></h4>                        
                      </div>
                    </div>
                  </div>   
               </c:forEach>         
                
              </div>
              <!-- promo right -->
              <div class="col-md-7 no-padding">
                <div class="aa-promo-right">
                
                <c:forEach items="${mainOnSale}"  begin="1" end="4" var="productVO">
                <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="images/${productVO.image }" alt="img"  width="409" height="240">                      
                      <div class="aa-prom-content">
                        <span>${productVO.name}</span>
                        <h4><a href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><fmt:formatNumber type="currency" value="${productVO.price2}"/></a></h4>                        
                      </div>
                    </div>
                  </div>   
                </c:forEach>           
                </div>
           
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Promo section -->
  
  
  <!-- Products section -->
  <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#newProduct" data-toggle="tab">신상품</a></li>
                    <li><a href="#bestProduct" data-toggle="tab">베스트상품</a></li>
                  </ul>
                  
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- Start men product category -->
                    <div class="tab-pane fade in active" id="newProduct">
                      <ul class="aa-product-catg">

					 
					<c:forEach items="${newProductList }" var="productVO">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image}" alt="신상품 이미지" width="250" height="300"></a>
                            <a class="aa-add-card-btn cart-ajax"    href="#" data-pseq="${productVO.pseq}" ><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>
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
                    <!-- /신상품 end -->
                   
                   
                    <!-- 베스트상품 category -->
                    <div class="tab-pane fade" id="bestProduct">
                      <ul class="aa-product-catg">
                   	<c:forEach items="${bestProductList }" var="productVO">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image}" alt="베스트상품 이미지" width="250" height="300"></a>
                            <a class="aa-add-card-btn cart-ajax"    href="#" data-pseq="${productVO.pseq}"   ><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">${productVO.name}</a></h4>
                              <span class="aa-product-price"><fmt:formatNumber pattern="#,### 원" value="${productVO.price2}"/></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                      </c:forEach>  
       
                      </ul>
                     
                    </div>
                    <!-- / 베스트상품 end -->
             
                  </div>
      
            
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Products section -->
  
  
  
  <!-- banner section -->
  <section id="aa-banner">
    <div class="container">
      <div class="row">
        <div class="col-md-12">        
          <div class="row">
            <div class="aa-banner-area">
         <img src="../dailyShop/img/fashion-banner.jpg" alt="fashion banner img" style="cursor: pointer;">
          </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- popular section -->
  <section id="aa-popular-category">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-popular-category-area">
              <!-- start prduct navigation -->
             <ul class="nav nav-tabs aa-products-tab">
                <li class="active"><a href="#popular" data-toggle="tab">세일 상품</a></li>
                         
              </ul>
              <!-- Tab panes -->
              <div class="tab-content">
                <!-- Start men popular category -->
                <div class="tab-pane fade in active" id="popular">
               
                  <ul class="aa-product-catg aa-popular-slider">
                   	<c:forEach items="${bestProductList }" var="productVO">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image}" alt="베스트상품 이미지" width="250" height="300"></a>
                            <a class="aa-add-card-btn cart-ajax"    href="#" data-pseq="${productVO.pseq}"   ><span class="fa fa-shopping-cart"></span>장바구니에 담기</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">${productVO.name}</a></h4>
                              <span class="aa-product-price"><fmt:formatNumber pattern="#,### 원" value="${productVO.price2}"/></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                      </c:forEach>  
                                      
                  </ul>
                 
                 
                 
                </div>
                <!-- / popular product category -->
                
      
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </section>
  <!-- / popular section -->
  <!-- Support section -->
  <section id="aa-support">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-support-area">
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-truck"></span>
                <h4>무료 배송</h4>
                <P>Mcaronics.net</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-clock-o"></span>
                <h4>30 이내 환불 보장</h4>
               <P>Mcaronics.net</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-phone"></span>
                <h4>상담 24/7</h4>
               <P>Mcaronics.net</P>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Support section -->
  <!-- Testimonial -->
  <section id="aa-testimonial">  
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-testimonial-area">
            <ul class="aa-testimonial-slider">
             
           
              <!-- single slide -->
			<c:forEach items="${newProductList }" var="productVO">  
              <li>
                <div class="aa-testimonial-single">
                <img class="aa-testimonial-img" src="images/${productVO.image}" alt="testimonial img">
                  <span class="fa fa-quote-left aa-testimonial-quote"></span>
                  <p>${productVO.content}</p>
                  <div class="aa-testimonial-info">
                  
                    <span><fmt:formatNumber type="currency"  value="${productVO.price2}" /></span>
                    <a href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}">${productVO.name}</a>
                  </div>
                </div>
              </li>
    	 </c:forEach>      
           <!-- single slide -->


                  
           
           
           
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Testimonial -->

  <!-- Latest Blog -->
  <section id="aa-latest-blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-latest-blog-area">
            <h2>베스트 여성 운동화</h2>
            <div class="row">
            
            <c:forEach items="${femaleProduct}" var="productVO">
              <!-- single latest blog -->
              <div class="col-md-4 col-sm-4">
                <div class="aa-latest-blog-single">
                  <figure class="aa-blog-img">                    
                    <a href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}"><img src="images/${productVO.image }" alt="img"></a>  
                      <figcaption class="aa-blog-img-caption">
                    </figcaption>                          
                  </figure>
                  <div class="aa-blog-info">
                    <h3 class="aa-blog-title"><a href="#">${productVO.name }</a></h3>
                 
                    <a href="MacaronicsServlet?command=product_detail&pseq=${productVO.pseq}" class="aa-read-mor-btn">상세보기 <span class="fa fa-long-arrow-right"></span></a>
                  </div>
                </div>
              </div>
          </c:forEach>
       
           
            </div>
          </div>
        </div>    
      </div>
    </div>
  </section>
  <!-- / Latest Blog -->

  <!-- Client Brand -->
  <section id="aa-client-brand">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-client-brand-area">
            <ul class="aa-client-brand-slider">
              <li><a href="https://www.oracle.com/index.html"><img src="../dailyShop/img/client-brand-java.png" alt="java img"></a></li>
              <li><a href="https://jquery.com/"><img src="../dailyShop/img/client-brand-jquery.png" alt="jquery img"></a></li>
              <li><a href="http://www.koreahtml5.kr/"><img src="../dailyShop/img/client-brand-html5.png" alt="html5 img"></a></li>
              <li><a href="http://www.w3schools.com/css/css3_intro.asp"><img src="../dailyShop/img/client-brand-css3.png" alt="css3 img"></a></li>
              <li><a href="https://ko.wordpress.org/"><img src="../dailyShop/img/client-brand-wordpress.png" alt="wordPress img"></a></li>
              <li><a href="https://www.joomla.com/"><img src="../dailyShop/img/client-brand-joomla.png" alt="joomla img"></a></li>
                 <li><a href="https://www.oracle.com/index.html"><img src="../dailyShop/img/client-brand-java.png" alt="java img"></a></li>
              <li><a href="https://jquery.com/"><img src="../dailyShop/img/client-brand-jquery.png" alt="jquery img"></a></li>
              <li><a href="http://www.koreahtml5.kr/"><img src="../dailyShop/img/client-brand-html5.png" alt="html5 img"></a></li>
              <li><a href="http://www.w3schools.com/css/css3_intro.asp"><img src="../dailyShop/img/client-brand-css3.png" alt="css3 img"></a></li>
              <li><a href="https://ko.wordpress.org/"><img src="../dailyShop/img/client-brand-wordpress.png" alt="wordPress img"></a></li>
              <li><a href="https://www.joomla.com/"><img src="../dailyShop/img/client-brand-joomla.png" alt="joomla img"></a></li>
     
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Client Brand -->



	


  <!-- Subscribe section -->
  <section id="aa-subscribe">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-subscribe-area">
            <h3>뉴스 레터 구독</h3>
            <p>Macaronics.net</p>
            <div class="aa-subscribe-form">
              <input type="email" name="" id="" placeholder="Enter your Email">
              <input type="submit" value="구독하기" onclick="alert('구독 신청되었습니다.')">
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Subscribe section -->

 

<jsp:include page="include/Footer.jsp" />

 
 