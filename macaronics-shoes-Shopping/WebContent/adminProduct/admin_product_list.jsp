<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">   
    <head>
<jsp:include page="../include/AdminHeader.jsp" />
    </head>   
    <body>
 <jsp:include page="../include/AdminTopFixMenu.jsp" />   
   
        
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
					 <jsp:include page="../include/AdminLeftMenu.jsp" />   
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Mcaronics Shoes</h4>
                        </div>
                        
                        
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">상품목록</a>
	                                    </li>
	                                </ul>
                            	</div>
                        	</div>
                    	</div>
                   
                   
                   <div>
                   	 목록 출력
                   </div>
                    
                    </div>
                </div>
           
           
           
            </div>
            <hr>

            
 <jsp:include page="../include/AdminFooter.jsp" />           