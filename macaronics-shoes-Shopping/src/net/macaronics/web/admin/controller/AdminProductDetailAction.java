package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.admin.controller.dao.AdminProductDAO;
import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.ProductDAO;
import net.macaronics.web.dto.ProductVO;

public class AdminProductDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="admin/product/productDetail.jsp";
		
		String pseq=request.getParameter("pseq").trim();
		
		ProductDAO productDAO =ProductDAO.getInstance();
		ProductVO productVO =productDAO.getProduct(pseq);
		String str =productVO.getContent();
		String content=str.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		productVO.setContent(content);
		
		//현재 페이지 위치 저장을 위해
		String pageN="1";
		if(request.getParameter("pageNum")!=null){
			pageN=request.getParameter("pageNum");
		}
		
		
		
		String kindList[] ={"0","남성운동화", "여성운동화","남성구두", "여성구두", "On Sale"};
		
		request.setAttribute("productVO", productVO);
		request.setAttribute("pageN", pageN);
		request.setAttribute("kindList", kindList[Integer.parseInt(productVO.getKind().trim())]);
		
		request.getRequestDispatcher(url).forward(request, response);
				
		
	}
	
	
}
