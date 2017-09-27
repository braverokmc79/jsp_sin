<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean> 

   
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">   
      		<h2 class="text-center" id="carTitle">옵션 선택</h2>
		<div class="col-xs-1 col-md-1"></div>
		<div class="col-sm-5"> 
<%
	String id =(String)session.getAttribute("id");
	if(id==null){
%> 
	<script>
		alert("로그인후 예약이 가능 합니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>
<%
	}
%>
		</div>
 </div>
 
</div>
 
 
    