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
                            <h4>회원리스트</h4>
                        </div>
                        
                        
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                       <form action="MacaronicsServlet" >
	                                     
	                                    회원 이름 <input type="text" name="key" value="${key =='%' ? '':key }"> 
	                   		  <input type="hidden"  value="admin_order_list" name="command" >    
	                           <input type="submit" class="success" value="검색">               
	                      </form>              
	                    
	                    
	                                        <a href="#"></a>
	                                    </li>
	                                </ul>
                            	</div>
                        	</div>
                        
                        	
                    	</div>
                   
                   
                   <div>
                   	 
                   	 <form method="post" action="" name="frm">
                   	 <div class="table-responsive">
                   	 <table class="table">
                   	   <tr class="success">
                   	   	 <th>아이디(탈퇴여부)</th>
                   	   	 <th>이름</th>
                   	   	 <th>이메일</th>
                   	   	 <th>우편번호</th>
                   	   	 <th>주소</th>
                   	   	 <th>전화</th>
                   	   	 <th>가입일</th>
                   	   </tr>
                   	  <c:if test="${empty memberList or memberList.size()==0 }" >
                   	  	<tr>
                   	  	  <td colspan="6" class="text-center"> 검색된 상품이 없습니다.</td>
                   	  	</tr>
                   	  </c:if> 
                   	  <c:forEach items="${memberList}" var="memverVO"> 
	                   	   <tr>
	                   	   <td>
	                   	   ${memverVO.id}
	                   	   <c:choose>
	                   	   	 <c:when test="${memverVO.useyn='y'}">
	                   	   	   (가입)
	                   	   	 </c:when>
	                   	   	 <c:otherwise>
	                   	   	  (탈퇴)
	                   	   	 </c:otherwise>
	                   	   </c:choose>
	                   	   
	                   	   </td>
	                   	   <td>${memverVO.name}</td>
	                   	   <td>${memverVO.email}</td>
	                   	   <td>${memverVO.zip_num}</td>
	                   	   <td>${memverVO.address}</td>
	                   	   <td>${memverVO.phone}</td>
	                   	   <td><fmt:formatDate type="date" value="${memverVO.indate}" /></td>
	                    	   
	                   	   </tr>
                   	   </c:forEach>

                   	 </table>
                   	 </div>
                   	 </form>
                   	 
                   </div>
                    
                    </div>
                </div>
         
           
            </div>
            <hr>


 <jsp:include page="../../include/AdminFooter.jsp" />   
 
 
 
         