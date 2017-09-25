package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
	
	
	
	//모든 게시글을 리턴해주는 
	public Vector<BoardBean> getAllBoard(){		
		//리넡할 객체 선언
		Vector<BoardBean> v =new Vector<>();
		getCon();
		try{
			//쿼리 준비
			String sql ="select * from board order by ref desc, REF_STEP asc";
			//쿼리를 실행할객체 선언
			pstmt =con.prepareStatement(sql);
			//쿼리실행 후 결과 저장
			rs=pstmt.executeQuery();
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()){
				//데이터를 패키징( 가방  = Boardbean 클래스를 이용)해줌
				BoardBean bean =new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("REF_STEP"));
				bean.setRe_level(rs.getInt("REF_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				//자원 반납
				if(rs!=null)con.close();
				if(pstmt!=null)con.close();
				if(con!=null)con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return v;
	}
	
	
	
	
}







































