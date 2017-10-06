<%@page import="java.net.URLEncoder"%>
<%@page import="config.GetIpAddress"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html >
<html>
<head>
<jsp:include page="../include/Header.jsp" />  
 </head> 
<body>
<jsp:include page="../include/HeaderMenu.jsp" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script> 


<div class="row">
	
	<div class="col-xs-12 col-sm-12">
	<h2>&nbsp;</h2>	
	<h2 class="text-center">회원가입</h2>
	</div>		
	
	<div class="col-xs-3 col-sm-3"></div>	
	<div class="col-xs-8 col-sm-8">
		
	  <div >		
	 	<p>&nbsp;</p>
		
		<csrf:form class="form-horizontal" action="/member/joinproc.jsp" method="post">
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label for="id">아이디</label>
		 	</div>
		 	<div class="col-sm-6 text-left">
		 		<input type="text" class="form-control" name="id" id="id" value="${member.id }">
		 		<p style="color:red;">${idError}</p>
		 	</div>
		 </div>
		 
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="pwd">패스워드</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="password" class="form-control" name="pwd" id="pwd">
		 		<p style="color:red;">${pwdError}</p>
		 	</div>
		 </div>
		 
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="pwdCheck">패스워드 체크</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="password" class="form-control" name="pwdCheck" id="pwdCheck">
		 		<p style="color:red;">${pwdCheckError}</p>
		 	</div>
		 </div>
		
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="name">이름</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="text" class="form-control" name="name" id="name" value="${member.name }">
		 		<p style="color:red;">${nameError}</p>
		 	</div>
		 </div>		 
		 
		 <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="email">이메일</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="email" class="form-control" name="email" id="email" value="${member.email }">
		 		<p style="color:red;">${emailError}</p>
		 	</div>
		 </div>	
	 
		 
		  <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="zip_num">우편번호</label>
		 	</div>
		 	<div class="col-sm-3">
		 	 <input type="text" id="sample6_postcode" placeholder="우편번호"  name="zip_num" class="form-control" value="${member.zip_num }">
			<p style="color:red;">${zip_numError}</p>
			</div>
			<div class="col-sm-3">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
		 
		 	</div>
		 </div>	
		 
		
			<div class="form-group" >
			 <div class="col-sm-2 control-label">
		 		<label id="address1">주소</label>
		 	 </div>
		 	 <div class="col-sm-6">
			    <input type="text" id="sample6_address" 
			    placeholder="주소"  name="address1"   class="form-control" value="${member.address1 }">
			   
			 </div>   
		   </div>
	 
	 	 <div class="form-group">
			 <div class="col-sm-12">
			  <p style="color:red;">${zip_numError}</p>
			  </div>
		  </div>	
	 
	 
		  <div class="form-group"> 
		  	 <div class="col-sm-2 control-label">
		 		<label id="address1">상세주소</label>
		 	 </div>
		 	 <div class="col-sm-6"> 
		       <input type="text" id="sample6_address2" placeholder="상세주소" name="address2"   class="form-control" value="${member.address2 }">
		       </div>
		  </div>
		 
		 <div class="form-group">
		 	<div class="col-sm-2"></div>
			 <div class="col-sm-8">
			  <p style="color:red;" class="text-center">${addressError}</p>
			  </div>
		</div>	

		  <div class="form-group">
		 	<div class="col-sm-2 control-label">
		 		<label id="phone">전화번호</label>
		 	</div>
		 	<div class="col-sm-6">
		 		<input type="text" class="form-control" name="phone" id="phone" value="${member.phone }">
		 	</div>
		 </div>
		 
		 <div class="form-group" >
		    <div class="col-sm-12  text-center">
		    <input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
		 	<input type="submit" value="회원가입" class="btn btn-success">
		 	<input type="reset" value="취소" class="btn btn-warning">
		 	</div>
		 </div>
		
		
		</csrf:form> 
	  </div>
	</div>

</div>

<h2>&nbsp;</h2>
<h2>&nbsp;</h2>
<h2>&nbsp;</h2>
<h2>&nbsp;</h2>



<jsp:include page="../include/Footer.jsp" />



   

