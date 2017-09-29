<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
							<%
						
						String exp2 = request.getParameter("exp2");
						if(exp2==null) exp2="+";
						
						%>

	<div style="margin-top: 50px;"></div>
	<div class="row">
		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-8 col-sm-8">

			<form class="form-inline" action="ElCul.jsp" method="post">
				<div class="form-group">
					<input type="text" name="exp1" class="form-control" value="${param.exp1}">
				</div>
				<div class="form-group">
					<select name="exp2" class="form-control">
						<option value="+" <% if(exp2.equals("+")) out.write("selected"); %>>+</option>
						<option value="-" <% if(exp2.equals("-")) out.write("selected"); %>>-</option>
						<option value="*" <% if(exp2.equals("*")) out.write("selected"); %>>*</option>
						<option value="/" <% if(exp2.equals("/")) out.write("selected"); %>>/</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="exp3" class="form-control"  value="${param.exp3 }"  >
				</div>

				<div class="form-group">
					<label>=</label>
					
					<%
						if (exp2.equals("+")) {
					%>
				
					<input type="text" name="exp4" class="form-control"
						value="${ param.exp1 +  param.exp3 }" readonly="readonly">	
					<%
						} else if (exp2.equals("-")) {
					%>
					<input type="text" name="exp4" class="form-control"
						value="${ param.exp1 - param.exp3 }" readonly="readonly">
					<%
						} else if (exp2.equals("*")) {
					%>
					<input type="text" name="exp4" class="form-control"
						value="${ param.exp1 *  param.exp3 }" readonly="readonly">
					<%
						} else if (exp2.equals("/")) {
					%>
							
					<input type="text" name="exp4" class="form-control"
								value="${ param.exp1 /  param.exp3 }" readonly="readonly">		

					<%
						}
					%>


			
			
													


				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-success" value="결과 보기">
				</div>

			</form>


		</div>
	</div>
</body>
</html>

