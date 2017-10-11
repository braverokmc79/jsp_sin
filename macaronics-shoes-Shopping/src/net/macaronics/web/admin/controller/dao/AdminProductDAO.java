package net.macaronics.web.admin.controller.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;
import config.Paging;
import net.macaronics.web.dto.OrderVO;
import net.macaronics.web.dto.ProductVO;

public class AdminProductDAO {
	
	private static final Logger logger =LogManager.getLogger(AdminProductDAO.class);
	
	private SqlSession sqlSession;
	
	private static AdminProductDAO instance;
	
	private AdminProductDAO(){
		
	}
	
	public static AdminProductDAO getInstance(){
		if(instance==null){
			instance =new AdminProductDAO();
		}
		return instance;
	}
	
	
	//전체 상품 수 가져오기
	public int totalRecord(String product_name){
		int total_pages =0;
		try{
			sqlSession=MybatisService.getFactory().openSession();
			if(product_name==null || product_name.equals("")){
				product_name="%";
			}
			total_pages=sqlSession.selectOne("adminProduct.totalRecord", product_name);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return total_pages;
	}
	
	
//상품목록 페이징 처리
//	sql ex)
//	select * from 
//	(
//	select rownum as num , t.* from   (select PSEQ, NAME, KIND, PRICE1, PRICE2, PRICE3,  IMAGE, USEYN, BESTYN, INDATE
//
//  from TBL_PRODUCT where name like '%'|| '남성' ||'%' order by indate desc ) t )
//  
//  where num >= 1 and num <= 10;
  
	public List<ProductVO> listProduct(Paging page, String product_name){
		List<ProductVO> list =new ArrayList<>();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			
			if(product_name==null || product_name.equals("")){
				product_name="%";
			}
			
			Map<String, Object> map =new HashMap<>();
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			map.put("proudct_name", product_name);
			
			list=sqlSession.selectList("adminProduct.listProduct" ,map );
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return list;
	}
	
	
	
	//상품 등록
	public void insertProudct(ProductVO product){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.insert("adminProduct.insertProudct", product);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
		
	}
	
	
	//상품 수정
	public void updateProduct(ProductVO product){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.update("adminProduct.updateProduct", product);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
		
	}
	
	
	
	
	//상품 삭제
	public void deleteProudct(int pseq){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.delete("adminProduct.deleteProudct", pseq);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
		
	}
	
	

	
	
	
}












