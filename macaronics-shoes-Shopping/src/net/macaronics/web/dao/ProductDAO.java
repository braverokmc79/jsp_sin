package net.macaronics.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MybatisService;
import net.macaronics.web.dto.ProductVO;

public class ProductDAO {
	//싱글톤 
	private static ProductDAO instacnce;
	private ProductDAO(){
		
	}
	public static ProductDAO getInstance(){
		if(instacnce==null){
			instacnce =new ProductDAO();
		}
		return instacnce;
	}
	
	//mybatis 연결
	SqlSession session;
	
	
	//신상품 리스트 얻어오기
	public List<ProductVO> listNewProduct(){
		return commonProduct("product.listNewProduct", null);
	}

	
	//베스트상품 리스트 얻어오기
	public List<ProductVO> listBestProduct(){
		return commonProduct("product.listBestProduct", null);
	}
	
	//상품종류별 상품 리스트 얻어오기
	public List<ProductVO> listKindProduct(String kind){
		return commonProduct("product.listKindProduct", kind);
	}
	
	
	//매인 배너 상품 세일 중인 상품만 가져온다. 최신 4개 
	public List<ProductVO> bannerProduct(){
		return commonProduct("product.bannerProduct", null);
	}
	
	// 메인 배너 아래  세일 상품 5개
	public List<ProductVO> mainOnSale(){
		return commonProduct("product.mainOnSale", null);
	}
	
	
	
	//상품번호로 상품 정보 한개 얻어오기
	public ProductVO getProduct(String pseq){
		List<ProductVO> list=commonProduct("product.getProduct", pseq);
		//ProductVO product=new ProductVO();
		return list.get(0);
		
	}
	
	
	public Object middleOnSale() {
		return commonProduct("product.middleOnSale", null);
	}
	
	
	//여성 운동화
	public Object femaleProduct() {
		return commonProduct("product.femaleProduct", null);
	}
	
	
	
	
	//리스트 상품 리스트   공통
	public List<ProductVO> commonProduct(String mybatisSql , String param){
		List<ProductVO> list =new ArrayList<>();
		try{
			session=MybatisService.getFactory().openSession();
			list=session.selectList(mybatisSql, param);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 닫기
			MybatisService.sessionClose(session);
		}
		return list; 
	}

	
	
}






