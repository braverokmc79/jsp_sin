<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JoinProc</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="net.macaronics.web.dto.MemberVO">
	<jsp:setProperty name="member"  property="*"/>
	
</jsp:useBean>


CSRF attacks 공격에 대한 보안유지 되어할 페이지.<br>

이 페이지에 넘어 오면 CSRF 정상 작동.


<br>

<%
String name=request.getParameter("name");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");

String address=new String(address1.getBytes("ISO_8859_1"), "utf-8");
address += " " +new String(address2.getBytes("ISO_8859_1"), "utf-8");

/* String charset[] = {"euc-kr", "ksc5601", "iso-8859-1", "8859_1", "ascii", "UTF-8"}; 
System.out.println("넘어온 값 :" +name);

for(int i=0; i<charset.length ; i++){
    System.out.println(charset[i] + " URLEncoder : " + URLEncoder.encode(name, charset[i]));
    System.out.println(charset[i] + " URLDecoder : " + URLDecoder.decode(name, charset[i]));
 }
 */


%>

<!-- 한글필터 적용이 안 되어서  한글 깨짐 처리-->
<jsp:setProperty property="name" name="member" value='<%= new String(name.getBytes("ISO_8859_1"), "UTF-8") %>' />
<jsp:setProperty property="address1" name="member" value='<%= new String(address1.getBytes("ISO_8859_1"), "UTF-8") %>' />
<jsp:setProperty property="address2" name="member" value='<%= new String(address2.getBytes("ISO_8859_1"), "UTF-8") %>' />
<jsp:setProperty property="address" name="member" value='<%= address %>' />


${member.toString() }
</body>
</html>