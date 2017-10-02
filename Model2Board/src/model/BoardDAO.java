package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//데이터 베이스에 연결 메소드
	public void getCon(){
		
		try{
			Context initctx =new InitialContext();
			Context envctx =(Context)initctx.lookup("java:comp/env");
			DataSource ds =(DataSource)envctx.lookup("jdbc/pool");
			con=ds.getConnection(); //커넥션연결 해주는 메소드
					
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//전체 글의 갯수를 린턴하는 메소드
	public int getAllCount(){
		int count =0;		
		getCon();
		try{
			//쿼리준비
			String sql ="select count(*) from board";
			pstmt=con.prepareStatement(sql);
			//쿼리 실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();
		}
		return count;
	}
	
	
	public void closed(){
		try{
			if(rs!=null)rs.close();			
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	//모든 (화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드
	public Vector<BoardBean> getAllBoard(int startRow, int endRow) {
		//리넡할 객체 선언
				Vector<BoardBean> v =new Vector<>();
				getCon();
				try{
					//쿼리 준비
					String sql ="select *  from "
							+ " (select A.* , Rownum Rnum from (select * from board order by ref desc, re_step asc) A ) "
							+ " where Rnum >= ? and Rnum <= ?";
							
					//쿼리를 실행할객체 선언
					pstmt =con.prepareStatement(sql);
					//쿼리실행 후 결과 저장
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
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
						bean.setRe_step(rs.getInt("RE_STEP"));
						bean.setRe_level(rs.getInt("RE_LEVEL"));
						bean.setReadcount(rs.getInt("READCOUNT"));
						bean.setContent(rs.getString("CONTENT"));
						//패키징한 데이터를 벡터에 저장
						v.add(bean);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					//자원 반납
					closed();
				}
				return v;
	}

	
	//하나의 게시글을 저장하는 메소드 호출
	public void insertBoard(BoardBean bean) {
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
			   sql +="	RE_STEP, RE_LEVEL, READCOUNT, CONTENT) "; 
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
			//자원 반납
			closed();
		}
	}

	//하나의 게시글 읽어들이는 메소드 작성
	public BoardBean getOneBoard(int num) {
		
		getCon();
		BoardBean bean =new BoardBean();
		try{
			//하나의 게시글을 읽었다는 조회수 증가
			String countsql ="update board set readcount =readcount+1 where num =?";
			pstmt=con.prepareStatement(countsql);
			pstmt.setInt(1, num);
			//쿼리실행
			pstmt.executeUpdate();
			
			//한게시글에 대한 정보를 리턴해주는 쿼리를 작성
			String sql ="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리실행 후 결과를 리턴
			rs =pstmt.executeQuery();
			if(rs.next()){//하나의 게시글이 존재 한다면
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//패키징한 데이터를 벡터에 저장
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();
		}
		return bean;
	}

	
	//답변글을 저장하는 메소드
	public void reInsertBoard(BoardBean bean) {
	    getCon();
	    
	    
	    //빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
	  		int ref=bean.getRef(); //글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을 자져온 후  +1을 더해주면됨
	  		int re_step=bean.getRe_step(); //새글이기에 = 부모글
	  		int re_level=bean.getRe_level(); 
	  		try{
	  			
	  			String levelSql="update board set re_level =re_level+1 where ref=? and re_level > ? ";
	  			pstmt =con.prepareStatement(levelSql);
	  			pstmt.setInt(1, ref);
	  			pstmt.setInt(2, re_level);
	  			pstmt.executeUpdate();
	  			
	  			
	  			//데이터를 삽입하는 쿼리
	  		String sql =" insert into BOARD (NUM, WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, ";
	  			   sql +="	RE_STEP, RE_LEVEL, READCOUNT, CONTENT) "; 
	  			   sql +=" values(board_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?, ?, ? , 0, ? ) ";
	  			pstmt=con.prepareStatement(sql);
	  			//?에 값을 맵핑	  	
	  			pstmt.setString(1, bean.getWriter());
	  			pstmt.setString(2, bean.getEmail());
	  			pstmt.setString(3, bean.getSubject());
	  			pstmt.setString(4, bean.getPassword());
	  			pstmt.setInt(5, ref);
	  			pstmt.setInt(6, re_step+1); //기존 부모글에 스텝보다 1을 증가
	  			pstmt.setInt(7, re_level+1); // 기존 부모글에 스텝보다 1을 증가
	  			pstmt.setString(8, bean.getContent());
	  			//쿼리를 실행하시오
	  			pstmt.executeUpdate();
	  		}catch(Exception e){
	  			e.printStackTrace();
	  		}finally{
	  			//자원 반납
	  			closed();
	  		} 		
	}

	
	
	
	//조회수를 증가하지 않는 하나의 게시글을 리턴하는 메소드
	public BoardBean getOuneUpdateBoard(int num){
		
		getCon();
		BoardBean bean =new BoardBean();
		try{

			//한게시글에 대한 정보를 리턴해주는 쿼리를 작성
			String sql ="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리실행 후 결과를 리턴
			rs =pstmt.executeQuery();
			if(rs.next()){//하나의 게시글이 존재 한다면
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//패키징한 데이터를 벡터에 저장
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();
		}
		return bean;
	}

	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(int num, String subject, String content) {	
		//데이터베이스연결
		getCon();
		try{
			//3.쿼리준비 쿼리실행할객체 선언
			String sql="update board set subject =?, content=? where num=?";
			pstmt =con.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			//4.쿼리실행
			pstmt.executeUpdate();
			//5.자원 반납
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();
		}
	}

	
	public void deleteBoard(int num) {
		 getCon();
		 
		 try{
			 //3
			 String sql ="delete from board where num=?";
			 pstmt=con.prepareStatement(sql);
			 //?
			 pstmt.setInt(1, num);
			 //4
			 pstmt.executeUpdate();
			 //5
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	}

	
	
	
	
	
	
	
}




