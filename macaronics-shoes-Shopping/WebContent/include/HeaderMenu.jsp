<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

  <!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
					<!-- 언어선택 메뉴 삭제 -->
                <!-- / language -->

                <!-- start currency -->
			<!-- 통화 선택 메뉴 삭제 -->
                <!-- / currency -->
                
                <!-- start cellphone -->
                <div class="cellphone hidden-xs">
                  <p><span class="glyphicon glyphicon-envelope"></span>braverokmc79@gmail.com</p>
                </div>
                <!-- / cellphone -->
              </div>
              <!-- / header top left -->
              <div class="aa-header-top-right">
                <ul class="aa-head-top-nav-right">
                
                <c:choose>
                  <c:when test="${empty sessionScope.loginUser}">
	                  <li class="hidden-xs"><a href="MacaronicsServlet?command=join_form">회원가입</a></li>
	                  <li><a href="" data-toggle="modal" data-target="#login-modal">로그인</a></li>
                  </c:when>
                  <c:otherwise>
                  	 <li class="hidden-xs"><a href="#">${sessionScope.loginUser.name }(${ sessionScope.loginUser.id})</a></li>
                  	<li class="hidden-xs"><a href="MacaronicsServlet?command=logout">로그아웃</a></li>
                  </c:otherwise>	
                </c:choose>
                  <li class="hidden-xs"><a href="MacaronicsServlet?command=cart_list">장바구니</a></li>
                  <li class="hidden-xs"><a href="MacaronicsServlet?command=mypage">나의 페이지</a></li>
                  <li class="hidden-xs"><a href="MacaronicsServlet?command=qna_list">Q&amp;A(1:1)</a></li>

             	
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->
    
    

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-bottom-area">
              <!-- logo  -->
              <div class="aa-logo">
                <!-- Text based logo -->
                <a href="MacaronicsServlet?command=index">
                  <span class="fa fa-shopping-cart"></span>
                  <p>Macaronics<strong> Shop</strong> <span>Macaronics shoes</span></p>
                </a>
                <!-- img based logo -->
                <!-- <a href="index.html"><img src="../dailyShop/img/logo.jpg" alt="logo img"></a> -->
              </div>
              <!-- / logo  -->
             
               <!-- cart box -->
              <div class="aa-cartbox">
                <a class="aa-cart-link" href="#">
                  <span class="fa fa-shopping-basket"></span>
                  <span class="aa-cart-title">장바구니 내역</span>
                  <span class="aa-cart-notify">2</span>
                </a>
                <div class="aa-cartbox-summary">
                  <ul>
                    <li>
                      <a class="aa-cartbox-img" href="#"><img src="../dailyShop/img/woman-small-2.jpg" alt="img"></a>
                      <div class="aa-cartbox-info">
                        <h4><a href="#">Product Name</a></h4>
                        <p>1 x $250</p>
                      </div>
                      <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                    </li>
                    <li>
                      <a class="aa-cartbox-img" href="#"><img src="../dailyShop/img/woman-small-1.jpg" alt="img"></a>
                      <div class="aa-cartbox-info">
                        <h4><a href="#">Product Name</a></h4>
                        <p>1 x $250</p>
                      </div>
                      <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                    </li>                    
                    <li>
                      <span class="aa-cartbox-total-title">
                        Total
                      </span>
                      <span class="aa-cartbox-total-price">
                        $500
                      </span>
                    </li>
                  </ul>
                  <a class="aa-cartbox-checkout aa-primary-btn" href="checkout.html">Checkout</a>
                </div>
              </div>
              
              
              <!-- / cart box -->
              <!-- search box -->
              <div class="aa-search-box">
                <form action="">
                  <input type="text" name="" id="" placeholder="검색">
                  <button type="submit"><span class="fa fa-search"></span></button>
                </form>
              </div>
              <!-- / search box -->             
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header bottom  -->
  </header>
  <!-- / header section -->
  
   
  
  <!-- menu -->
  <section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Macaroncis</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>          
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="MacaronicsServlet?command=category&kind=1">남성운동화</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=2">여성운동화</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=3">남성구두</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=4">여성구두</a></li>
              <li><a href="MacaronicsServlet?command=category&kind=5">On Sale</a></li>
              
            </ul>	
          </div><!--/.nav-collapse -->
        </div>
      </div>       
    </div>
  </section>
  <!-- / menu -->
  
  
      


    