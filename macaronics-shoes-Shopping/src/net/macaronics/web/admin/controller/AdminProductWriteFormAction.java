package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.controll.action.Action;

public class AdminProductWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="admin/product/productWrite.jsp";
		String kindList[] ={"남성운동화", "여성운동화","남성구두", "여성구두", "On Sale"};
		request.setAttribute("kindList", kindList);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
}
