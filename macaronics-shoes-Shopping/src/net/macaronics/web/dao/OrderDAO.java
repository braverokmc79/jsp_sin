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
import net.macaronics.web.dto.OrderVO;

public class OrderDAO {
	
	private static OrderDAO instance;
	private Logger logger =LogManager.getLogger(OrderDAO.class);
	private SqlSession sqlSession;	
	
	private OrderDAO() {

	}

	public static OrderDAO getInstance() {
		if (instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}

	
	//주문 tbl_orders 테이블에 등록
	public int insertOrder(List<CartVO> cartList, String id){
		int maxOseq=0;
		try{
		
			sqlSession =MybatisService.getFactory().openSession();
			
			//1. tbl_orders 등록하기
			sqlSession.insert("order.insertOrder", id); 
			sqlSession.commit();
			
			//2. 등록된 oseq 가져오기
			maxOseq=sqlSession.selectOne("order.selectMaxOseq");
			logger.info("maxOseq -----------------{}  " ,  maxOseq);
			
			//3. 주문 상세 tbl_order_detail 테이블에 개별 주문 상품 등록 하기
			for(CartVO cartVO : cartList){
				//주문 테이블의 maxOseq 번호를 자바빈에 저장하기
				cartVO.setOseq(maxOseq);
				insertOrderDetail(cartVO);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return maxOseq;
	}
	
	
	// 주문 상세 tbl_order_detail 테이블에 개별 주문 상품 등록
	public void insertOrderDetail(CartVO cartVO){
		try{
			logger.info("insertOrderDetail  ------- {}" , cartVO.toString());
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.insert("order.insertOrderDetail", cartVO);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	
	//주문 목록 불러오기
	public List<OrderVO> listOrderById(String id, String result, int oseq){
		List<OrderVO> orderList=new ArrayList<>();
		try{
			sqlSession =MybatisService.getFactory().openSession();
			Map<String, Object> map =new HashMap<>();
			map.put("id", id);
			map.put("result", result);
			map.put("oseq", oseq);
			orderList=sqlSession.selectList("order.listOrderById" , map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return orderList;
	}
	
	
	//현재 진행중인 주문처리 목록 상세 보기를 위한 tbl_orders 테이블의 주문번호 불러오기 
	public List<Integer> selectSeqOrdering(String id){
		List<Integer> oseqList=new ArrayList<>();
		try{
		
			sqlSession=MybatisService.getFactory().openSession();
			oseqList=sqlSession.selectList("order.selectSeqOrdering", id);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return oseqList;
	}
	
	
	
	
	//관리자 화면 - 주문관리 주문 목록 불러오기
	public List<OrderVO> listOrder(String member_name){
		List<OrderVO> orderList=new ArrayList<>();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			orderList=sqlSession.selectList("order.listOrder", member_name);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return orderList;
	}

	
	//관리자 화면 - 주문처리 업데이트
	public void updateOrderResult(String odseq) {
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.update("order.updateOrderResult", odseq);			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	
}













