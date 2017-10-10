<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      
<!DOCTYPE html>
<html class="no-js">   
    <head>
<jsp:include page="../../include/AdminHeader.jsp" />
        <!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"></link>

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
                            <h4>상품 상세 보기</h4>
                        </div>
                    	</div>
                   
                   <div>
                   <form action="MacaronicsServlet" method="post"  name="form1">	 
                   	 <div class="table-responsive">
                   	 <table class="table">
           				<tr>
           				 <th class="success">상품 분류</th>
           				 <td colspan="5">
           				 	${kindList }
           				 </td>
           				</tr>		
           				
           				<tr>
           				 <th class="success">상품명</th>
           				 <td colspan="5">${productVO.name}</td>
           				</tr>	
           				
           				<tr>
           				 <th>원가</th><td><fmt:formatNumber  type="currency" value="${productVO.price1}" /></td>
           				 <th>판매가</th><td><fmt:formatNumber  type="currency" value="${productVO.price2}" /></td>
           				 <th>마진</th><td width="10%"><fmt:formatNumber  type="currency" value="${productVO.price3}" /></td>
           				</tr>	
           			   
           			   <tr>
           				 <th>베스트 상품</th><td>
           				 <c:choose>
           				 	<c:when test="${productVO.bestyn=='y' }">
           				 		베스트 상품
           				 	</c:when>
           				 	<c:otherwise>
           				 	    베스트 상품 아님
           				 	</c:otherwise>
           				 </c:choose>
           				 
           				 </td>
           				 <th>사용유무</th><td colspan="3">
           				 <c:choose>
           				 	<c:when test="${productVO.useyn=='y' }">
           				 		사용중인 상품	
           				 	</c:when>
           				 	<c:otherwise>
           				 	   사용 불가능
           				 	</c:otherwise>
           				 </c:choose>
           				 </td>
           				</tr>	
           			    
           			    <tr>
           				 <th>상세설명</th>
           				 <td colspan="5"> 
	                      
	                      ${productVO.content}
	                       
           				 </td>
           				</tr>
           				
           			 <tr>
           				 <th>상품 이미지</th>
           				 <td colspan="5"> 
           				 <img src="images/${productVO.image }" width="300" height="500" class="img-responsive">
           				 </td>
           				</tr>	
           							
           			 </table>
           			  
           			  <input  type="hidden" name="command" id="command" >
           			  <input  type="hidden" name="pageNum" value="${pageN}">
           			  <input  type="hidden" name="pseq" value="${productVO.pseq}">
           			  
                   	 </div>
                   	<div class="text-center">
<input type="button" value="수정하기"  class="btn btn-success" onclick="go_update();">
<input type="button" value="목록보기"  class="btn btn-primary" onclick="go_list();">
<input type="button" value="삭제하기"  class="btn btn-danger" onclick="go_delete();">
    			 	
           			 	</div>
            	</form>
           			 
                   </div>
            
                    
                    </div>
                </div>
           
            </div>
            <hr>

		

  


<div style="margin-bottom: 150px;">
&nbsp;
</div>
     <!-- FOOTER -->
<nav class="avbar navbar-inverse navbar-fixed-bottom" style="height:50px  ;  background-color:#000  ;">
  <div class="container text-center" style="color:#fff;">
  <p>&nbsp;</p>
   <p ><a href="http://macaronics.net/" style="   color:#fff;">Macaronics.net</a></p>  
    <p>&nbsp;</p><p>&nbsp;</p>
  </div>
</nav>



        <!--/.fluid-container-->
        <script src="../../Bootstrap-Admin/vendors/jquery-1.9.1.min.js"></script>
        <script src="../../Bootstrap-Admin/bootstrap/js/bootstrap.min.js"></script>
        <script src="../../Bootstrap-Admin/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="../../Bootstrap-Admin/assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>



<script>
function go_update(){
	
	$("#command").val("admin_product_update_form");
	document.form1.submit();
}


function go_list(){
	location.href="MacaronicsServlet?command=admin_product_list&pageNum=${pageN}";
}
 
function go_delete(){
	if(confirm("정말 삭제 하시겠습니까?")){
		$("#command").val("admin_product_delete");
		document.form1.submit();		
	}

}

</script>

 
 </body>
</html> 
            
 
