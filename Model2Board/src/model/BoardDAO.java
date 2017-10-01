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

	
	
	
	
	
}




