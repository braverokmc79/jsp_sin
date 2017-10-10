package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.ProductDAO;
import net.macaronics.web.dto.ProductVO;

public class AdminProductUpdateFormAction implements Action {
	private static final Logger logger=LogManager.getLogger(AdminProductUpdateFormAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="admin/product/productUpdate.jsp";
		
		String pseq =request.getParameter("pseq").trim();
		
		ProductDAO productDAO =ProductDAO.getInstance();
		ProductVO productVO=productDAO.getProduct(pseq);
		
		String str =productVO.getContent();
		String content=str.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		productVO.setContent(content);
		
		String pageNum="1";
		if(request.getParameter("pageNum")!=null || !request.getParameter("pageNum").trim().equals("")){
			pageNum=request.getParameter("pageNum");
		}
		
		logger.info(" AdminProductUpdateFormAction  - pageNum {}  " , pageNum) ;
		
		request.setAttribute("productVO", productVO);
		request.setAttribute("pageNum", pageNum);
		
		String kindList[] ={"남성운동화", "여성운동화","남성구두", "여성구두", "On Sale"};
		request.setAttribute("kindList", kindList);
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}

}
