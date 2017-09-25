<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group"> 
            <a href="SessionMain.jsp?center=Snowpeak.jsp" 
            class="list-group-item  ${ param.center=='Snowpeak.jsp'? 'active' : ''}">스노우피크</a>
            <a href="SessionMain.jsp?center=Coleman.jsp" 
            class="list-group-item ${ param.center=='Coleman.jsp'? 'active' : ''}">콜맨</a>
            <a href="SessionMain.jsp?center=Jeep.jsp"
             class="list-group-item ${ param.center=='Jeep.jsp'? 'active' : ''}">지프</a>
            <a href="SessionMain.jsp?center=Kovea.jsp"
             class="list-group-item ${ param.center=='Kovea.jsp'? 'active' : ''}">코베아</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
        
