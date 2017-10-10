package net.macaronics.web.admin.controller.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;

public class AdminDAO {
 
	 private static final Logger logger =LogManager.getLogger(AdminDAO.class);
	 
	 private SqlSession sqlSession;
	 
	 private static AdminDAO instance ;
	 
	 private AdminDAO(){
		 
	 }
	 
	 public static AdminDAO getInstnce(){
		 if(instance ==null){
			 instance =new AdminDAO();
		 }
		 return instance;
	 }
	 
	 
	 //비밀번호 체크
	 public boolean workerCheck(String id, String pwd){
		 int result=0;
		 try{
			 sqlSession=MybatisService.getFactory().openSession();
			 Map<String, Object> map=new HashMap<>();
			 map.put("id", id);
			 map.put("pwd", pwd);
			 result=sqlSession.selectOne("admin.workerCheck",map);
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			 MybatisService.sessionClose(sqlSession);
		 }
	
		 //0보다 크면 로그인 성공
		 return result >0 ? true :false;
	 }
	
	
	 
	 
	 
}
