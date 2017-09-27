package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//데이터 베이스 연결
	public void getCon(){
		try{			
			Context initCon=new InitialContext();
			Context envCon =(Context)initCon.lookup("java:comp/env");
			DataSource ds =(DataSource) envCon.lookup("jdbc/pool");
			con=ds.getConnection();			
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	
	//최신순 3대의 자동차를 리턴하는 메소드
	public Vector<CarListBean> getSelectCar(){
		String sql ="select * from RENTCAR  order by no desc";	
		return commonCarBean(sql, true, 3);
	}
	
	
	//자원 닫는 메소드
	private void closed(){
		try{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//카테고리별 자동차 리스트를 저장하는 메소드
	public Vector<CarListBean> getCategoryCar(int cate){
		String sql="select * from rentcar where category=" +cate;
		return commonCarBean(sql, false, 0);
	}
	
	
	// 공통 부분 메소드 로 만듬.
	private Vector<CarListBean> commonCarBean(String sql, boolean option, int num){
		getCon(); //커넥션이 연결되엉야 쿼리를 실행 가능
		Vector<CarListBean> v =new Vector<>();
		CarListBean bean =null;
		try {
			pstmt=con.prepareStatement(sql);
			//쿼리 실행후 결과를 Result 타입으로 리턴
			
			rs =pstmt.executeQuery();
			int count=0;
			while(rs.next()){			
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//벡터를 빈 클래스에 저장
				v.add(bean);
			
				if(option){	
					count++;
					if(count >=num)break; //반복문을 빠져나가시오.
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closed();
		}
		return v;
	}
	
	
	

	
}




