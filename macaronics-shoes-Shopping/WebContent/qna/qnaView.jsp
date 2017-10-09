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
     			<h2>1:1 고객 게시판</h2>	
                <h3>고객님의 질문에 대해서 운영자가  1:1 답변을 드립니다.</h3>
        		<div class="table-responsive">
        		<table class="table">
        			<tr>
        			  <th>제목</th>
        			  <td>${qnaVO.subject }</td>
        			</tr>
					 <tr>
					   <th>등록일</th>
					   <td><fmt:formatDate value="${qnaVO.indate }"  type="date" /></td>
					 </tr>
					 <tr>
					  <th>질문 내용</th>
					  <td><div>${qnaVO.content}</div></td>
					 </tr>
					 <tr>
					  <th>답변내용</th>
					  <td>${qnaVO.reply }</td>
					 </tr>
        		</table>
        		</div>
            </div>
            
            <div class="text-center">
                <input type="button" value="목록보기" class="btn btn-warning" 
                onclick="location.href='MacaronicsServlet?command=qna_list'">
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



