<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-3 col-sm-3"></div>


			<div class="col-xs-6 col-sm-6">
				<p>&nbsp;</p><h2 class="text-center">세션 로그인</h2><p>&nbsp;</p>
				<form action="SessionLoginProc.jsp" method="post">
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" class="form-control" ></td>
						</tr>

						<tr>
							<td>패스워드</td>
							<td><input type="password" name="pass" class="form-control"></td>
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