package net.macaronics.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.OrderDAO;
import net.macaronics.web.dto.OrderVO;

public class AdminOrderListAction implements Action {

	private static final Logger logger=LogManager.getLogger(AdminOrderListAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="admin/order/orderList.jsp";
		String key="";
		if(request.getParameter("key")!=null){
			key=request.getParameter("key");
		}
		
		OrderDAO orderDAO=OrderDAO.getInstance();
		List<OrderVO> orderList=orderDAO.listOrder(key);
		
		request.setAttribute("key", key);
		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
 
}



