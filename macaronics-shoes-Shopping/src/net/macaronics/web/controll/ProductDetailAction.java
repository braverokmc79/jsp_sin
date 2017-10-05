package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.ProductDAO;
import net.macaronics.web.dto.ProductVO;

public class ProductDetailAction implements Action {

	final Logger logger =LogManager.getLogger(ProductDetailAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws
			ServletException, IOException {
		
		String url="product/productDetail.jsp";
		String pseq= request.getParameter("pseq").trim();
		
		ProductDAO productDAO =ProductDAO.getInstance();
	
		request.setAttribute("productVO", productDAO.getProduct(pseq)); //1개의 상품
		request.setAttribute("bannerProduct", productDAO.bannerProduct()); //배너 상품 4개
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

	
	
}
