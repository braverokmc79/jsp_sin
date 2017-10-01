<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>
<!-- 게시글 보기에 카운터링을 설정하기위한 변수들을 선언  -->

<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">전체 게시글 보기		
	  
		</h2>
		<p class="text-right">
		<input type="button" value="글쓰기"  onclick="location.href='BoardWrite.jsp'"  class="btn btn-warning">
		</p>
		<div class="table-responsive">
		<table class="table table-bordered table-striped" >
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
	 
			 <c:forEach items="${v }"  var="bean">
			 <c:set var="number" value='${number }' />
				 <tr>
			 		<td>${number }</td>
			 		<td><a href="BoardInfo.jsp?num=${bean.num}" >
			 		 <c:if test="${ bean.re_step >1}">
			 		 <c:forEach begin="${bean.re_step }"  end="${(bean.re_step -1)*5 }" var="j">
			 		 	&nbsp;
			 		 </c:forEach>
			 		 </c:if>			 		 
			 			${bean.subject }
			 			
			 		</a></td>
			 		<td>${bean.writer }</td>
					<td>${bean.reg_date}</td>
					<td>${bean.readcount}</td>
			 	</tr>
			 <c:set var="number" value='${number-1 }' />
			 </c:forEach>
			 

			
			<tr>
				<td colspan="5" class="text-center">

				
<!-- 페이지 카우터링 소스를 작성 -->
<nav>
  <ul class="pagination">				
<%-- <%
		//이전이라는 링크를 만들건지 파악
		if(paging.getStartPage() >10){		
%>
 <li><a href="BoardList.jsp?pageNum=<%=paging.getPrev() %>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
 <%	
		}
 	 //페이징 처리
 	 for(int i=paging.getStartPage(); i<=paging.getEndPage(); i++){
%>
	<li <% if(i==Integer.parseInt(pageNum))
			out.print("class='active'");
		%>><a href="BoardList.jsp?pageNum=<%=i %>"><%=i %><span class="sr-only">(current)</span></a></li>
	
<% 		 
 	 }    
     //다음 이라는 링크를 만들건지 파악
  	 if( paging.getEndPage() < paging.getPageCount()){
  %>		 
  
<li><a href="BoardList.jsp?pageNum=<%=paging.getNext() %>" aria-label="next"><span aria-hidden="true">&raquo;</span></a></li>
<%		
			
	}
%> --%>
  </ul>
</nav>	
 			
				
				</td>
			</tr>
		</table>
		</div>
	
	</div>
</div>




<jsp:include page="Bottom.jsp"/>
</body>
</html>



