<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Tag Token Injection</title>
</head>
<body>
<h3>Test Link(s)</h3>
<ul>
	<li><a href="protect.html?<csrf:token uri="protect.html"/>">protect.html</a></li>
	<li><a href="protect.html?<csrf:token uri="protect.html"/>">/protect.html</a></li>
	<li><a href="http://localhost/test.html?<csrf:token uri="http://localhost/test.html"/>">http://localhost/test.html</a></li>
	<li><a href="javascript:alert('test')">javascript:alert('test')</a></li>
</ul>
<ul>
	<li><csrf:a href="protect.html">protect.html</csrf:a></li>
	<li><csrf:a href="/protect.html">/protect.html</csrf:a></li>
</ul>
<br/>
<h3>csrf:token-name  태그 형식으 보낸 경우 Test Form(s)</h3>
<form id="formTest1" name="formTest1" action="test.do" >
	<input type="text" name="text" value="text"/>
	<input type="submit" name="submit" value="submit"/>
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri="test.do"/>"/>
</form>

<h3>csrf:form   태그 형식으 보낸 경우 Test Form(s)</h3>
<csrf:form id="formTest2" name="formTest2" action="test.do" >
	<input type="text" name="text" value="text"/>
	<input type="submit" name="submit" value="submit"/>
</csrf:form>



<h2>CSRF 보안을 적용하지 않은 일반적 form 전송인 경우</h2>
<form id="formTest2" name="formTest2" action="test.do" >
	<input type="text" name="text" value="text"/>
	<input type="submit" name="submit" value="submit"/>
</form>


</body>
</html>

