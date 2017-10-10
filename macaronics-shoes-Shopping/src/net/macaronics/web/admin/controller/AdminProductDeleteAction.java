package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.admin.controller.dao.AdminProductDAO;
import net.macaronics.web.controll.action.Action;

public class AdminProductDeleteAction implements Action {

	private static Logger logger =LogManager.getLogger(AdminProductDeleteAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="MacaronicsServlet?command=admin_product_list&pageNum=";
		
		
		//페이지를 유지 하기위한 처리 작업
		String pageNum="1";
		if(request.getParameter("pageNum")!=null){
			pageNum=request.getParameter("pageNum");
		}
		url +=pageNum;
		logger.info("url , {}, request.getParameter() - {}", url, request.getParameter("pageNum"));
		
		int pseq=Integer.parseInt(request.getParameter("pseq"));
		
		
		
		AdminProductDAO dao =AdminProductDAO.getInstance();
		dao.deleteProudct(pseq);
				
		response.sendRedirect(url);
	
	}

}
