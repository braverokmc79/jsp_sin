<%@page import="net.macaronics.web.dao.MemberDAO"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.validation.Validator"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="net.macaronics.web.dto.MemberVO"%>

<%@page import="java.util.Set"%>
<%@page import="config.MyValidatorFactory"%>

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


<%-- ${member.toString() }   --%>
 


<%
	

	//유효성 체크
	Validator validator =MyValidatorFactory.createValidator();
	Set<ConstraintViolation<MemberVO>> constraintViolations=validator.validate(member);
	
	Iterator<ConstraintViolation<MemberVO>> iterator =constraintViolations.iterator();
	int error=0;
	while(iterator.hasNext()){
		ConstraintViolation<MemberVO> each=iterator.next();		
		
		if(each.getPropertyPath()!=null){
			String key =each.getPropertyPath().toString();

			if(key.equals("id"))request.setAttribute("idError","아이디는 " +each.getMessage());	
			if(key.equals("pwd"))request.setAttribute("pwdError","패스워드는 " +each.getMessage());
			if(key.equals("zip_num"))request.setAttribute("zip_numError","우편번호는 " +each.getMessage());
			if(key.equals("name"))request.setAttribute("nameError","이름 은 " +each.getMessage());
			if(key.equals("email"))request.setAttribute("emailError","이메일은  " +each.getMessage());
			if(key.equals("address1"))request.setAttribute("addressError","주소는  " +each.getMessage());
						
		}
		error++;
	}
	
	
	if(member.getPwd()!=null && member.getPwdCheck()!=null){
		if(member.isPassCheck()){
			error++;
			request.setAttribute("pwdCheckError", "패스워드와 패스워드확인이 일치하지 않습니다.");
		}		
	}
	
	
	//아이디 중복 확인
	MemberDAO memberDao=MemberDAO.getInstance();
	if(member.getId()!=null){
		if(memberDao.confirm(member.getId())){
			error++;
			request.setAttribute("idError", "중복된 아이디 입니다.");
		}
	}

	
	
	if(error>0){
		request.setAttribute("member", member);
		RequestDispatcher rd=request.getRequestDispatcher("/member/join.jsp");
		rd.forward(request, response);
	}else{
		//에러사항이 없을 경우 등록
		memberDao.insertMember(member);
		response.sendRedirect("/index.html?msg=joinSuccess");		
		
	}
%>
	

</body>
</html>
