<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>

<%
	//사용자 컴퓨터의 쿠키 저장소로부터 쿠키값을 읽어드림 - 몇개인지 모르기에 배열을 이용하여 쿠키값을 저장
	Cookie[] cookies =request.getCookies();
	String id="";
	//쿠키값이 없을 수도 있기에 null 처리를 해줍니다.
	if(cookies !=null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("macaronics.net")){
				id=cookies[i].getValue();
				break; //우리가 원하는 데이터를 찾았기에 반복문을 빠져 나옴
			}
		}
	}

%>


	<div class="container">
		<div class="row">
			<div class="col-xs-3 col-sm-3"></div>


			<div class="col-xs-6 col-sm-6">
				<p>&nbsp;</p><h2 class="text-center">쿠키 로그인</h2><p>&nbsp;</p>
				<form action="CookieLoginProc.jsp" method="post">
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" class="form-control" value="<%=id %>"></td>
						</tr>

						<tr>
							<td>패스워드</td>
							<td><input type="password" name="pass" class="form-control"></td>
						</tr>

						<tr>
							<td colspan="2" class="text-center">
							<input type="checkbox"	name="save" value="1">&nbsp; 아이디 저장	
							</td>
						</tr>

						<tr>
							<td colspan="2">
							<input type="submit" class="form-control"
								value="로그인" style="background-color: #5DB85D; color:#fff; font-weight: bold;">
							</td>
						</tr>

					</table>
				</form>
			</div><!-- col-xs-6 col-sm-6 -->


		</div>
		<!-- row -->
	</div><!-- container -->


</body>
</html>