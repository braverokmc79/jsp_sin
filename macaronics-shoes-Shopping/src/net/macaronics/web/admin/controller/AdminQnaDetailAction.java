package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.QnaDAO;
import net.macaronics.web.dto.QnaVO;

public class AdminQnaDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="admin/qna/qnaDetail.jsp";
		
		String qseq=request.getParameter("qseq").trim();
		
		QnaDAO qnaDAO =QnaDAO.getInstance();
		QnaVO qnaVO =qnaDAO.getQna(Integer.parseInt(qseq));
		String str =qnaVO.getContent();
		String content=str.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		qnaVO.setContent(content);
		
		
		request.setAttribute("qnaVO", qnaVO);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	
}
