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
				<h2>회원 정보 보기</h2>

<%


//post 방식으로 데이터가 넘어올때 한글이 깨질수 있기에
	request.setCharacterEncoding("UTF-8");

//각종 사용자로부터 넘어오 데이터를 저장해 줌
	String id=request.getParameter("id");
	String pass1=request.getParameter("pass1");
	String pass2=request.getParameter("pass2");
	String email=request.getParameter("email");
	String tel=request.getParameter("tel");

	//[]열 타입으로 리턴
	String[] hobby= request.getParameterValues("hobby");
	
	String job =request.getParameter("job");
	String age=request.getParameter("age");
	String info=request.getParameter("info");

	if(!pass1.equals(pass2)){
		
%>
	<script type="text/javascript">
		alert("비밀번호가틀립니다.")//경고창
		history.go(-1);//이전 페이지로 이동
	</script>
<% } %>	



		<table class="table table-boardered">
			<tr>
				<th>아이디</th>
				<td><%= id %></td>		
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%= pass1 %></td>		
			</tr>
			<tr>
				<th>이메일</th>
				<td><%= email %></td>		
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><%= tel %></td>		
			</tr>
			
			<tr>
				<th>당신의 관심분야</th>
				<td>
					<%
						for(int i=0; i<hobby.length; i++){
							out.write(hobby[i] + " ");	
						}
					%>
				</td>		
			</tr>
			
			<tr>
				<th>당신의 직업은</th>
				<td>
				 <%= job %>
				</td>		
			</tr>
			
						
			<tr>
				<th>당신의 연력은</th>
				<td>
				<%= age %>
				</td>		
			</tr>
			
			<tr>
				<th>하고 싶은 말</th>
				<td>
				 <%= info %>
				</td>		
			</tr>
		</table>



			</div>

	</div>
	</div>
</div>


</body>
</html>