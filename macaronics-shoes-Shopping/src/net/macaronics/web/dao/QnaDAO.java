package net.macaronics.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;
import net.macaronics.web.dto.QnaVO;

public class QnaDAO {

	private Logger logger =LogManager.getLogger(QnaDAO.class);
	
	private SqlSession sqlSession;
	
	private static QnaDAO instance ;
	
	private QnaDAO(){
		
	}
	
	public static QnaDAO getInstance(){
		if(instance==null){
			instance=new QnaDAO();
		}
		return instance;
	}
	
	
	// Qna 목록 
	public List<QnaVO> listQna(String id){
		List<QnaVO> list =new ArrayList<>();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			list=sqlSession.selectList("qna.listQna", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return list;
	}
	
	
	
	//Qna 상세보기
	public QnaVO getQna(int seq){
		QnaVO qnaVO=new QnaVO();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			qnaVO=sqlSession.selectOne("qna.getQna", seq);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return qnaVO;
	}
	

	//Qna 쓰기
	public void insertQna(QnaVO qnaVO, String session_id){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			qnaVO.setId(session_id);
			sqlSession.insert("insertQna", qnaVO);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	
	
}



