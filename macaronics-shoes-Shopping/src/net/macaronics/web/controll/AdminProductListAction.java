package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.controll.action.Action;

public class AdminProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="adminProduct/admin_product_list.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
	}
	

}
