<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean> 

   
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">   
      		<h2 class="text-center" id="carTitle">옵션 선택</h2>
		<div class="col-xs-1 col-md-1"></div>
		<div class="col-sm-5"> 
		
		
<%
	System.out.println(rbean.toString());
	String id =(String)session.getAttribute("id");
	if(id==null){
%> 
	<script>
		alert("로그인후 예약이 가능 합니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>
	
<%
	}
	
	if(rbean.getRday()==null){
%>		
		<script>
		alert("대여일을 선택하세요");
		history.go(-1);
		</script>
	
<%	
	}else{
		
		//날짜 비교
		Date d1 =new Date();
		Date d2=new Date();
		//날짜를 2017-09-27 포멧 해주는 클래스 선언
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		
		d1 =sdf.parse(rbean.getRday());
		d2 =sdf.parse(sdf.format(d2));
		
		//날짜 비교 메소드를 사용
     	int compare = d1.compareTo(d2);
		//예약하려는 날짜보다 현재날짜가 크다면  -1;
		//예약하려는 날짜와 현재날짜가 같다면 0
		//예약하려는 날짜가 더 크다면 1을 리턴
		
		if(compare < 0){//오늘보다 이전 날짜 선택시
			%>
			
	<script>
		alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없습니다.");
		history.go(-1);
	</script>
			
<%		
		}
		
	}

	
%>
		</div>
 </div>
 
</div>
 
 
    