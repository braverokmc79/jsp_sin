<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html class="no-js">   
    <head>
<jsp:include page="../../include/AdminHeader.jsp" />
    </head>   
    <body>
 <jsp:include page="../../include/AdminTopFixMenu.jsp" />   
   
        
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
					 <jsp:include page="../../include/AdminLeftMenu.jsp" />   
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>상품목록</h4>
                        </div>
                        
                        
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                       <form action="MacaronicsServlet" >
	                                     
	                                     상품명 <input type="text" name="key" value="${key =='%' ? '':key }"> 
	                     <input type="hidden"  value="admin_product_list" name="command">    
	                       <input type="submit" class="success" value="검색">               
	                       </form>              
	                                        <a href="#"></a>
	                                    </li>
	                                </ul>
                            	</div>
                        	</div>
                        
                         <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                            검색된 상품 수 ${count } 개 
	                            <input type="submit"  value="전체보기" class="primary" onclick="location.href='MacaronicsServlet?command=admin_product_list'">
	                            <input type="button"  value="상품 등록" onclick="location.href='MacaronicsServlet?command=admin_product_write_form'">
	                                        <a href="#"></a>
	                                    </li>
	                                </ul>
                            	</div>
                        	</div>
                        	
                    	</div>
                   
                   
                   <div>
                   	 
                   	 <div class="table-responsive">
                   	 <table class="table">
                   	   <tr class="success">
                   	   	 <th>번호 </th>
                   	   	 <th>상품명</th>
                   	   	 <th>원가</th>
                   	   	 <th>판매가</th>
                   	   	 <th>등록일</th>
                   	   	 <th>사용유무</th>
                   	   </tr>
                   	  <c:if test="${empty count or count==0 }" >
                   	  	<tr>
                   	  	  <td colspan="6" class="text-center"> 검색된 상품이 없습니다.</td>
                   	  	</tr>
                   	  </c:if> 
                   	  <c:forEach items="${productList}" var="productVO"> 
	                   	   <tr>
	                   	     <td>${productVO.pseq }</td>
<td><a href="MacaronicsServlet?command=admin_product_detail&pseq=${productVO.pseq }&pageNum=${param.pageNum ==null ? 1: param.pageNum}">${productVO.name }</a></td>
	                   	     <td><fmt:formatNumber type="currency" value="${productVO.price1 }" /></td>
	                   	     <td><fmt:formatNumber type="currency" value="${productVO.price2 }" /></td>
	                   	     <td><fmt:formatDate type="date"  value="${productVO.indate }" /></td>
	                   	     <td>
        	   	 		<c:choose>
                   	   	 	<c:when test="${productVO.useyn =='y' }">
                   	   	 		사용중
                   	   	 	</c:when>
                   	   	 	<c:otherwise>
                   	   	 		사용 불가능
                   	   	 	</c:otherwise>
                   	   	 </c:choose>	                   	     
	                   	     
	                   	 </td>
	                   	   </tr>
                   	   </c:forEach>
                   	   
                   	   <tfoot>
                   	   <tr>
                   	   	<td colspan="6" >   ${paging.html } </td>
                   	   </tr>
                   	   </tfoot>
                   	 </table>
                   	 </div>
                   </div>
                    
                    </div>
                </div>
         
           
            </div>
            <hr>

            
 <jsp:include page="../../include/AdminFooter.jsp" />           