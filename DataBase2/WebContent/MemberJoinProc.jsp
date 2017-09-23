<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">

					<%
						request.setCharacterEncoding("UTF-8"); //post 전달 방식일 경우 한글 처리

						//취미 부분은 별도로 읽어들어 다시 빈 클래스에 저장
						String[] hobby = request.getParameterValues("hobby");
						//배열의 있는 내용을 하나의 스트림으로 젖아
						String texthobby = "";

						for (int i = 0; i < hobby.length; i++) {
							texthobby += hobby[i] + " ";
						}
					%>
					<!--  useBean 을 이용하여 한꺼번에 데이터를 받아옴 -->
					<jsp:useBean id="mbean" class="model.MemberBean">
						<jsp:setProperty name="mbean" property="*" />
						<!--  맵핑 시키시오 -->
					</jsp:useBean>


		<%
					mbean.setHobby(texthobby); //기존 취미는 주소번지가 저장되기에 위에 배열의 
													//내용을 하나의 스트림으로 저장한 변수를 다시입력				
			
					//오라클에 접속하는 소스를 작성
					String id="system";//접속 아이디
					String pass="1111";
					String url="jdbc:oracle:thin:@localhost:1521:XE"; //접속 url
					Connection con=null;
					PreparedStatement pstmt=null;
					try{
						//1.해당 데이터 베이스를 사용한다고 선언 (클래스를 등록 = 오라클용 사용 )
						Class.forName("oracle.jdbc.driver.OracleDriver");
						//2.해당 데이터 베이스에 접속
						con=DriverManager.getConnection(url, id, pass);
						//3. 접속후 쿼리준비하여 쿼리를 사용하도록 설정
						String sql ="insert into member values(?, ? , ? ,? ,? , ?, ?, ?)";
						//쿼리를 사용하도록 설정
						pstmt=con.prepareStatement(sql);//jsp 에서 쿼리를 사용하도록 설정
						//?에 맞게 데이터를 맵핑
					    pstmt.setString(1, mbean.getId());
						pstmt.setString(2, mbean.getPass1());
						pstmt.setString(3, mbean.getEmail());
						pstmt.setString(4, mbean.getTel());
						pstmt.setString(5, mbean.getHobby());
						pstmt.setString(6, mbean.getJob());
						pstmt.setString(7, mbean.getAge());
						pstmt.setString(8, mbean.getInfo());
						//4. 오라클에서 쿼리를 실행하시오
						pstmt.executeUpdate(); //insert, update, delete 사용하는 메소드
						
						// 5. 자원 반남
						con.close();
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						try{
							if(pstmt!=null)pstmt.close();
							if(con!=null)con.close();
						}catch(Exception e){
							e.printStackTrace();
						}
					}
													
		%>

			오라클에  완료 ~ 

				</div>
			</div>
		</div>
	</div>


</body>
</html>


