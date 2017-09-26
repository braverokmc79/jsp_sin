package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
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
	
	
}



















