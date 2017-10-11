package net.macaronics.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.admin.controller.dao.AdminQnaDAO;
import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.QnaDAO;
import net.macaronics.web.dto.QnaVO;

public class AdminQnaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="admin/qna/qnaList.jsp";
		
		AdminQnaDAO qnaDAO =AdminQnaDAO.getInstance();
		List<QnaVO> qnaList =qnaDAO.listAllQna();
		
		request.setAttribute("qnaList", qnaList);

		request.getRequestDispatcher(url).forward(request, response);
	}

}










