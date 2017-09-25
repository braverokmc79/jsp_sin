<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그 아웃 클릭시 파라미터를 통해서 로그아웃인지 여부 확인
	String logout =request.getParameter("logout");
	if(logout!=null){
		//id에 null 값을 부여
		session.setAttribute("id", null);
		//세션 유지시간을 죽이시오
		session.setMaxInactiveInterval(0);
		out.println("<script>location.href='SessionMain.jsp';</script> ");	
	}
	
	
	//세션을 통하여 id를 읽어드림
	String id= (String)session.getAttribute("id");
	//로그인이 되어 있지 않다면 session 값이 null 처리 해줌
	if(id ==null){
		id="손님";
	}
	
	
%>    
 <nav class="navbar navbar-fixed-top navbar-inverse">
   <div class="container">
     <div class="navbar-header">
     <h2 id="logo"><a href="/CookieSession/SessionMain.jsp"><img src="img/logo.png" ></a></h2>
       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </button>
       <a class="navbar-brand" href="#"></a>
     </div>
     <div id="navbar" class="collapse navbar-collapse">
       <ul class="nav navbar-nav">
       	<li><a href="#"></a></li>
         <li class="active"><a href="#">텐트</a></li>
         <li><a href="#about">의자</a></li>
         <li><a href="#contact">식기류</a></li>
         <li><a href="#contact">침낭</a></li>
         <li><a href="#contact">테이블</a></li>
         <li><a href="#contact">화롯대</a></li>
              
         <%
         	if(id.equals("손님")){
        %> 
          <li><a href="#"><%=id %> 님</a><li> 
         <li> 		
  <a href="SessionMain.jsp?center=SessionLoginForm2.jsp" class="btn"> 로그인</a>	
  		</li>	       
         <%	}else{ %>
   		 <li><a href="#"><%=id %> 님</a><li> 
        <li> 		
          <a href="SessionMain.jsp?logout=1">로그아웃</a>		
       	</li>	 
         <%	} %> 
        
       </ul>
     </div><!-- /.nav-collapse -->
   </div><!-- /.container -->
 </nav><!-- /.navbar -->
<div class="blank">&nbsp;</div>