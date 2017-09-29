<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="margin-top: 50px;"></div>
	<div class="row">
		<div class="col-xs-2 col-sm-2"></div>
		<div class="col-xs-8 col-sm-8">
			<%
				String exp2 = request.getParameter("exp2");
			
				if (exp2.equals("+")) {
					
			%>
			 ${ param.exp1 +  param.exp3 }
			<%
				} else if (exp2.equals("-")) {
					
			%>
			${ param.exp1 - param.exp3 }
			<%
				} else if (exp2.equals("*")) {
			%>
			${ param.exp1 *  param.exp3 }
			<%
				} else if (exp2.equals("/")) {
			%>
			${ param.exp1 /  param.exp3 }

			<%
				}

			%>

	



		</div>
	</div>
</body>
</html>