package net.macaronics.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;
import net.macaronics.web.dto.CartVO;

public class CartDAO {
	private final static Logger logger =LogManager.getLogger(CartDAO.class);
	
	//Mybatis 
	private SqlSession sqlSession;
	
	// CartDAO 싱글톤 객체 만들기
	private static CartDAO instance =new CartDAO();
	private CartDAO(){
		
	}
	
	public static CartDAO getInstance(){
		if(instance==null){
			instance=new CartDAO();
		}
		return instance;
	}
	
	
	//장바구니 담기
	public void insertCart(CartVO cartVO){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.insert("cart.insertCart", cartVO);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	//장바구니 목록
	public List<CartVO> listCart(String userid){
		List<CartVO> cartList=new ArrayList<>();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			cartList=sqlSession.selectList("cart.listCart", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		  sqlSession.commit();
		  MybatisService.sessionClose(sqlSession);
		}
		return cartList;
	}
	
	
	
	//장바구니 삭제
	public void deleteCart(int cseq, String id){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			Map<String, Object> map=new HashMap<>();
			map.put("cseq", cseq);
			map.put("id", id);
			sqlSession.delete("cart.deleteCart", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
}




