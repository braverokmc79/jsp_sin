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
        			  <th>번호</th>
        			  <th>제목</th>
        			  <th>등록일</th>
        			  <th>답변 여부</th>
        			</tr>
        			<c:if test="${empty qnaList }" >
        				<tr> 
        					<td colspan="4" class="text-center" style="color:red;">게시글이 없습니다.</td>
        				</tr>
        			</c:if>
        			<c:forEach items="${qnaList}" var="qnaVO">
        				<tr>
        				  <td>${ qnaVO.qseq}</td>
        				  <td><a href="MacaronicsServlet?command=qna_view&qseq=${qnaVO.qseq}" >${ qnaVO.subject}</a></td>
        				  <td><fmt:formatDate value="${ qnaVO.indate}"  type="date" /></td>
        				  <td>
        				  	 <c:choose>
        				  	   <c:when test="${ qnaVO.rep==1}">
        				  	   	no
        				  	   </c:when>
        				  	    <c:when test="${ qnaVO.rep==2}">
        				  	    yes
        				  	   </c:when>  		
        				  	 </c:choose>
        				  </td>
        				</tr>
        			</c:forEach>
        		</table>
        		</div>
            </div>
            
            <div class="text-center">
                <input type="button" value="1:1 질문하기" class="btn btn-success" 
                onclick="location.href='MacaronicsServlet?command=qna_write_form'">
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



