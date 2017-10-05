package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.ProductDAO;

public class ProductKindAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="product/productKind.jsp";
		String kind=request.getParameter("kind").trim();
		
		ProductDAO productDAO=ProductDAO.getInstance();
		request.setAttribute("productKindList", productDAO.listKindProduct(kind));
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

	
	
}



