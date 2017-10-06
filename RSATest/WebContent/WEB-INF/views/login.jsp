<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>로그인 결과</title>
    </head>
    <body>
        <ul>
            <li>사용자ID : <%=request.getAttribute("username")%></li>
            <li>비밀번호 : <%=request.getAttribute("password")%></li>
        </ul>
    </body>
</html>
