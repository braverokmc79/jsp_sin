package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.OrderDAO;

public class AdminOrderSaveAction implements Action{

	private static Logger logger =LogManager.getLogger(AdminOrderSaveAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="MacaronicsServlet?command=admin_order_list";
		
		String[] resultArr =request.getParameterValues("result");
		
		for(String oseq: resultArr){
			logger.info("AdminOrderSaveAction -  {} ", oseq);
			OrderDAO orderDAO =OrderDAO.getInstance();
			orderDAO.updateOrderResult(oseq);
	    }
		
		response.sendRedirect(url);
		
	}
	
	
	

	
	
}


