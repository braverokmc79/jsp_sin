<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


       <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"></button>
          </p>
          <div class="jumbotron">     
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
          	
          </div>
        </div><!--/.col-xs-12.col-sm-9-->
        

