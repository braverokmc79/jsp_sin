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
                            <h4>주문리스트</h4>
                        </div>
                        
                        
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                       <form action="MacaronicsServlet" >
	                                     
	                                     주문자 이름 <input type="text" name="key" value="${key =='%' ? '':key }"> 
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
                   	   	 <th>주문번호(처리여부) </th>
                   	   	 <th>주문자</th>
                   	   	 <th>상품명</th>
                   	   	 <th>수량</th>
                   	   	 <th>배송지</th>
                   	   	 <th>전화</th>
                   	   	 <th>주문일</th>
                   	   </tr>
                   	  <c:if test="${empty orderList or orderList.size()==0 }" >
                   	  	<tr>
                   	  	  <td colspan="6" class="text-center"> 검색된 상품이 없습니다.</td>
                   	  	</tr>
                   	  </c:if> 
                   	  <c:forEach items="${orderList}" var="orderVO"> 
	                   	   <tr>
	                   	   <td>
	                   	   <c:choose>
		                   	   	<c:when test="${orderVO.result=='1' }">
									( <input type="checkbox" name="result" value="${orderVO.odseq }"> <small style="color:red;">미처리 </small> )				                   	   		
		                   	   	</c:when>
	                   	    <c:otherwise>
(<input type="checkbox" checked="checked" disabled="disabled" > 처리완료)
	                   	    </c:otherwise>
	                   	   </c:choose>
	                  	   
	                   	   </td>
	                   	   <td>${orderVO.mname}</td>
	                   	   <td>${orderVO.pname}</td>
	                   	   <td>${orderVO.quantity}</td>
	                   	   <td>${orderVO.address}</td>
	                   	   <td>${orderVO.phone}</td>
	                   	   <td>${orderVO.indate}</td>
	                    	   
	                   	   </tr>
                   	   </c:forEach>
                   	   
                   	   <tfoot>
                   	   <tr>
                   	   	<td colspan="7" class="text-center"><button onclick="go_order_save()" class="btn btn-success">주문처리(입금확인)</button>  </td>
                   	   </tr>
                   	   </tfoot>
                   	 </table>
                   	 </div>
                   	 </form>
                   	 
                   </div>
                    
                    </div>
                </div>
         
           
            </div>
            <hr>

<script>


function go_order_save() {
	var count=0;
	$('input:checkbox[name=result]').each(function() {
	   if($(this).is(':checked'))
		   count++;
	});

	if(count==0 || count==undefined){
		alert("주문처리할 항목을 선택해 주세요.")
		return;
	}else{
		document.frm.action="MacaronicsServlet?command=admin_order_save";
		document.frm.submit();
	}
}



</script>

            
 <jsp:include page="../../include/AdminFooter.jsp" />   
 
 
 
         