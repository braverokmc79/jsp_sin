package net.macaronics.web.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.controll.common.CommonList;
import net.macaronics.web.dao.ProductDAO;
import net.macaronics.web.dto.ProductVO;

public class IndexAction implements Action{

	final Logger logger =LogManager.getLogger(IndexAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String url ="/index.jsp";
	  // 데이터 베이스에서 상품 정보 얻어오는 비즈니스 로직
	  ProductDAO productDAO =ProductDAO.getInstance();

	  request.setAttribute("newProductList", productDAO.listNewProduct());//신상품
	  request.setAttribute("bestProductList", productDAO.listBestProduct()); //베스트상품	 
	  request.setAttribute("bannerProduct", productDAO.bannerProduct()); //배너 상품
	  request.setAttribute("mainOnSale", productDAO.mainOnSale());//메인 배너 아래  세일 상품 5개
	  request.setAttribute("middleOnSale", productDAO.middleOnSale()); //세일상품 12
	  
	  request.setAttribute("femaleProduct", productDAO.femaleProduct());//여성운동화
	  
	  //ProductVO pro =productDAO.getProduct("1"); 
	  //logger.info("IndexAction  {}",pro.toString() );
	  
	  RequestDispatcher dispatcher=request.getRequestDispatcher(url);
	  dispatcher.forward(request, response);
	}

	
}
