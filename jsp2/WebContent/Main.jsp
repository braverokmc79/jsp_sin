<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>	
   <jsp:include page="Header.jsp" />
  </head>
  <body>
  	
  	<jsp:include page="Top.jsp">
  			<jsp:param value="aaa" name="id"  />
  	</jsp:include>
  	<%--
  	 <jsp:include page="Top.jsp"/>
  	 --%>
>
  	 
    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">
      	<!-- Left -->
        <jsp:include page="Left.jsp"/>
        
        
		<!--  Center -->
		<jsp:include page="Center.jsp"/>
		
		
      </div><!--/row-->

      <!--  Bottom -->
	 <jsp:include page="Bottom.jsp"/>

    </div><!--/.container-->



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
