<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션을 통하여 id를 읽어드림
	String id= (String)session.getAttribute("UTF-8");


	//로그인이 되어 있지 않다면 session 값이 null 처리 해줌
	if(id ==null){
		id="손님";
	}
%>    
 <nav class="navbar navbar-fixed-top navbar-inverse">
   <div class="container">
     <div class="navbar-header">
     <h2 id="logo"><a href=""><img src="img/logo.png" ></a></h2>
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
         <li><a href="#contact"><%= id  %></a></li>
       </ul>
     </div><!-- /.nav-collapse -->
   </div><!-- /.container -->
 </nav><!-- /.navbar -->
<div class="blank">&nbsp;</div>