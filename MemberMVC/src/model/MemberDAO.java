package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon(){	
		try{
			
			Context initctx =new InitialContext();
			Context envctx =(Context)initctx.lookup("java:comp/env/");
			DataSource ds =(DataSource)envctx.lookup("jdbc/pool");
			con =(Connection) ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//회원 한사람에 대한 정보를 저장하는 메소드
	public void insertMember(MemberBean bean){
		
		try{
			getCon();
			//3. 접속후 쿼리준비하여 쿼리를 사용하도록 설정
			String sql ="insert into member values(?, ? , ? ,? ,? , ?, ?, ?)";
			//쿼리를 사용하도록 설정
			pstmt=con.prepareStatement(sql);//jsp 에서 쿼리를 사용하도록 설정
			//?에 맞게 데이터를 맵핑
		    pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getHobby());
			pstmt.setString(6, bean.getJob());
			pstmt.setString(7, bean.getAge());
			pstmt.setString(8, bean.getInfo());
			//4. 오라클에서 쿼리를 실행하시오
			pstmt.executeUpdate(); //insert, update, delete 사용하는 메소드
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closed();	
		}
	}
	
	
	private void closed(){	
			try{
				//5.자원 반납
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}	
	}
	
	
	
}



