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
                            <h4>상품 등록</h4>
                        </div>
                    	</div>
                   
                   <div>
                   <form action="MacaronicsServlet?command=admin_product_write" method="post" enctype="multipart/form-data"  name="form1">	 
                   	 <div class="table-responsive">
                   	 <table class="table">
           				<tr>
           				 <th class="success">상품 분류</th>
           				 <td colspan="5">
           				 	<select class="span6 m-wrap" name="kind">
           				 		<c:forEach items="${kindList }" var="kind" varStatus="status">
           				 			<option value="${status.count}">${kind }</option>
           				 		</c:forEach>
           				 	</select>
           				 </td>
           				</tr>		
           				
           				<tr>
           				 <th class="success">상품명</th>
           				 <td colspan="5"><input type="text" name="name" id="name"></td>
           				</tr>	
           				
           				<tr>
           				 <th>원가</th><td><input type="text" name="price1"  id="price1" ></td>
           				 <th>판매가</th><td><input type="text" name="price2" id="price2" onblur="go_ab()"></td>
           				 <th>마진</th><td width="10%"><input type="text" name="price3" id="price3" readonly="readonly"></td>
           				</tr>	
           			   
           			   <tr>
           				 <th>베스트 상품</th><td><input type="checkbox"  name="bestyn"  /></td>
           				 <th>사용유무</th><td colspan="3"><input type="checkbox"  name="useyn"  checked="checked"/></td>
           				</tr>	
           			    
           			    <tr>
           				 <th>상세설명</th>
           				 <td colspan="5"> 
	                      <textarea id="bootstrap-editor" style="width:98%;height:200px;" name="content"></textarea> 
           				 </td>
           				</tr>
           				
           			 <tr>
           				 <th>상품 이미지</th>
           				 <td colspan="5"> 
	                       <input type="file" name="image" id="image"> 
           				 </td>
           				</tr>	
           							
           			 </table>
           			 
                   	 </div>
                   	<div class="text-center">
           			 		<input type="button" value="등록"  class="btn btn-success" onclick="productSubmit()">
           			 		<input type="reset" value="취소"  class="btn btn-warning">
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
        <script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="../../Bootstrap-Admin/vendors/jquery-1.9.1.min.js"></script>
        <script src="../../Bootstrap-Admin/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
<script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

 <script type="text/javascript">

$(function() {
    
	// Bootstrap
	$('#bootstrap-editor').wysihtml5();
	
});




function go_ab(){
	
	var price1=parseInt($("#price1").val());
	var price2=parseInt($("#price2").val());
	if(price2 <= price1){
		alert("판매가는 원가 보다 작을 수 없습니다.");
		$("#price1").val("");
		$("#price2").val("");
		$("#price1").focus();
		
		return;
	}
	$("#price3").val(price2-price1);
	
}


function go_ab3(){
	
	var price1=parseInt($("#price1").val());
	var price2=parseInt($("#price2").val());
	if(price2 <= price1){
		alert("판매가는 원가 보다 작을 수 없습니다.");
		$("#price1").val("");
		$("#price2").val("");
		$("#price1").focus();
		
		return false;
	}else{
		$("#price3").val(price2-price1);	
	}
	
	return true;
}
function productSubmit(){
	var name=$("#name").val();
	var price1=$("#price1").val();
	var price2=$("#price2").val();
	var content =$("content").val();
	
	if(name==""){
		alert("상품명을 입력해 주세요.");
		$("#name").focus();
		return ;
	}
	
	if(price1==""){
		alert("원가를 입력해 주세요.");
		$("#price1").focus();
		return ;
	}
	
	
	
	if(price2==""){
		alert("판매가를 입력해 주세요.");
		$("#price2").focus();
		return;
	}
	
	if(!go_ab3()){
		$("#price3").val("");
		return;
	}
	
	if( $("#image").val() != "" ){

		var ext = $('#image').val().split('.').pop().toLowerCase();
	    if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {

		 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');

		 return;
	   }
	    
	 document.form1.submit(); 
		
	}else{
		 alert('이미지를 선택해 주세요');
		 return;
	}
	
	
}

</script> 

 
 </body>
</html> 
            
 


		

  