package net.macaronics.web.admin.controller.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;
import net.macaronics.web.dto.QnaVO;

public class AdminQnaDAO {

	private static final Logger logger =LogManager.getLogger(AdminQnaDAO.class);
	
	private SqlSession sqlSession;
	
	private static AdminQnaDAO instance; 
	
	private AdminQnaDAO(){
		
	}
	
	public static AdminQnaDAO getInstance(){
		if(instance==null){
			instance=new AdminQnaDAO();
		}
		return instance;
	}
	
	
	// 관리자 qna 목록 출력 
	public List<QnaVO> listAllQna(){
		List<QnaVO> list=new ArrayList<>();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			list=sqlSession.selectList("qna.listAllQna");		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return list;
	}
	
	
	//qna update 
	public void updateQna(QnaVO qnaVO){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.update("qna.updateQna", qnaVO);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	
	
	
	
	
}
