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
                            <h4>답변 리스트</h4>
                        </div>
                        
                        	
                    	</div>
                   
                   
                   <div>
                   	 
                   	 <form method="post" action="" name="frm">
                   	 <div class="table-responsive">
                   	 <table class="table">
                   	   <tr class="success">
                   	   	 <th>번호(답변여부)</th>
                   	   	 <th>제목</th>
                   	   	 <th>작성자</th>
                   	   	 <th>작성일</th>
                   	   </tr>
                   	  <c:if test="${empty qnaList or qnaList.size()==0 }" >
                   	  	<tr>
                   	  	  <td colspan="6" class="text-center"> 작성된 글이 없습니다.</td>
                   	  	</tr>
                   	  </c:if> 
                   	  <c:forEach items="${qnaList}" var="qna">
                   	       <tr> 
	                   	   <td>
	                   	   ${qna.qseq }
	                   	    <c:choose>
	                   	    	<c:when test="${qna.rep=='1' }">
	                   	    	 <span style="color:red;">(미처리)</span>
	                   	    	</c:when>
	                   	    	<c:otherwise>
	                   	    	<span>(답변처리완료)</span>
	                   	    	</c:otherwise>
	                   	    </c:choose>
	                   	   </td>
	                   	   <td><a href="MacaronicsServlet?command=admin_qna_detail&qseq=${qna.qseq}" >${qna.subject }</a></td>
	                   	   <td>${qna.id }</td>
	                   	   <td><fmt:formatDate  type="date"  value="${qna.indate }" /></td>
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
 
 
 
         