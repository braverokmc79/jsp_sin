package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//데이터 베이스의 커넥션을 사용하도록 설정하는 메소드
	//lib 에  ojdbc7.jar 라이브러리 등록 할것  maver.repository 사이트 검색후 다운로드
	public void getCon(){
		try{
			//외부에서 데이터를 읽어들어야 하기에
			Context initctx =new InitialContext();
			//톰켓 서버에 정보를 담아놓은 고으로 이동
			Context envctx =(Context) initctx.lookup("java:comp/env/");
			//데이터 소스 객체를 선언
			DataSource ds =(DataSource) envctx.lookup("jdbc/pool");
			//데이터 소스를 기준으로 커넥션을 연결해주시오
			con =ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean){
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		
		getCon();
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref=0; //글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을 자져온 후  +1을 더해주면됨
		int re_step=1; //새글이기에 = 부모글
		int re_level=1; 
		try{
			
			
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql ="select max(ref) from board ";
			//쿼리실행 객체 
			pstmt =con.prepareStatement(refsql);
			//쿼리실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){ //결과 값이 였다면
				ref =rs.getInt(1)+1;//최대값에 +1 를 더해서 글그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장
//			String sql =" insert into board values( board_seq.NEXTVAL, ?, ? , ?, ? , )";
			
		String sql =" insert into BOARD (NUM, WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, ";
			   sql +="	REF_STEP, REF_LEVEL, READCOUNT, CONTENT) "; 
			   sql +=" values(board_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?, ?, ? , 0, ? ) ";
			pstmt=con.prepareStatement(sql);
			//?에 값을 맵핑	  	
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//쿼리를 실행하시오
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				//자원 반납
				if(pstmt!=null)con.close();
				if(con!=null)con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
}








































