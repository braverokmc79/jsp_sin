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
<c:if test="${msg != null  || param.msg != null}">
	<c:if test="${param.msg =='complete'}">
		<c:set var="msg" value="수정이 완료 되었습니다." />
	</c:if>
	<c:if test="${msg =='delete'}">
		<c:set var="msg" value="삭제시 비밀번호가 틀렸습니다." />
	</c:if>		
	<script type="text/javascript">
	 alert("${msg}");
	 //파라미터 제거
	 history.replaceState({}, null, location.pathname);
	</script>

</c:if>
<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">전체 게시글 보기		
	  
		</h2>
		<p class="text-right">
		<input type="button" value="글쓰기"  onclick="location.href='BoardWriteForm.jsp'"  class="btn btn-warning">
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
			
			 <c:set var="cnumber" value='${paging.number }' />
			 <c:forEach items="${v }"  var="bean">
			
				 <tr>
			 		<td>${cnumber }</td>
			 		<td><a href="BoardInfoControl.do?num=${bean.num}" >
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
			 <c:set var="cnumber" value='${cnumber-1 }' />
			 </c:forEach>
		
			<tr>
				<td colspan="5" class="text-center">

				
<!-- 페이지징 처리 호출 -->
		${paging.html }	
				
				</td>
			</tr>
		</table>
		</div>
	
	</div>
</div>

<jsp:include page="Bottom.jsp"/>
</body>
</html>



