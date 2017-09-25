<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>	
   <jsp:include page="Header2.jsp" />
  </head>
  <body>
  	
<%
	//Center 값을 변경해주기위해서 request 객체를 Center 값을 받아옴
	String center =request.getParameter("center");

	//처음 SessionMain.jsp 를 실행하면 null값이 실행되기에 null 처를 해줌
	if(center ==null){
		center ="Center.jsp";
	}
	
%>  	
  	
  	<jsp:include page="Top.jsp">
  			<jsp:param value="aaa" name="id"  />
  	</jsp:include>

  	 
    <div class="container">

       <div class="row row-offcanvas row-offcanvas-right" >
      	<!-- Left -->
        <jsp:include page="Left.jsp"/>
        
        
		<!--  Center -->
		<jsp:include page="<%=center %>" />
		
		
      </div><!--/row-->
	
		

    </div><!--/.container-->

      <!--  Bottom -->
	 <jsp:include page="Bottom.jsp"/>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/offcanvas.js"></script>
  </body>
</html>
