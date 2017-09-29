<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Macaronics.net</a>
		</div>
	</div>



	<!--  1.데이터 베이스에서 모든회원의 정보를 가져옴. 2. table 태그를 이용하여 화면에 정보를 출력 -->
	<%
		MemberDAO mdao = new MemberDAO();
		//회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
		Vector<MemberBean> vec = mdao.allSelectMember();

		request.setAttribute("vec", vec);
	%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-2"></div>

				<div class="col-sm-9">
					<div class="table-responsive text-center">
						<table class="table table-hover">
							<tr class="success">
								<td>아이디</td>
								<td>이메일</td>
								<td>전화번호</td>
								<td>취미</td>
							</tr>

<%-- 							<%
								for (int i = 0; i < vec.size(); i++) {
									MemberBean bean = vec.get(i);// 벡터에 담긴 클래스를 하나씩 추출
							%>
							<tr>
								<td><a href="MemberInfo.jsp?id=<%=bean.getId()%>"> <%=bean.getId()%>
								</a></td>

								<td><%=bean.getEmail()%></td>
								<td><%=bean.getTel()%></td>
								<td><%=bean.getHobby()%></td>
							</tr>
							<%
								}
							%> --%>

						<c:forEach var="bean" items="${vec}">
								<tr>
									<td><a href="MemberInfo.jsp?id=${bean.id}"> ${bean.id}
									</a></td>

									<td>${bean.email}</td>
									<td>${bean.tel}</td>
									<td>${bean.hobby}</td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>


