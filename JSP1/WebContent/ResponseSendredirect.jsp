<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>동영상과 다르게  부트스트랩 적용 Head 부분만 붙이면 됩니다.</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	 <div class="container">
	<div class="row">
	<div class="col-sm-12 text-center" >
	<div class="col-sm-3"></div>
	
	<div class="col-sm-6">
    <h2>로그인 페이지</h2>
	<form action="ResponseLoginProc.jsp" method="post">
		<table class="table table-boardered">
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" name="id"></td>		
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" class="form-control" name="pass"></td>		
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary">전송</button></td>
			</tr>
		</table>
	</form>
	</div>
	
	</div>
	</div>
</div>
</body>
</html>