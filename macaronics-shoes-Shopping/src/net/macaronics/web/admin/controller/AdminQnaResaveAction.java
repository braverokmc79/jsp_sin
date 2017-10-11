package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.admin.controller.dao.AdminQnaDAO;
import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dto.QnaVO;

public class AdminQnaResaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="MacaronicsServlet?command=admin_qna_list";
		
		String qseq=request.getParameter("qseq").trim();
		String reply=request.getParameter("reply");
		
		
		QnaVO qnaVO=new QnaVO();
		qnaVO.setQseq(Integer.parseInt(qseq));
		qnaVO.setReply(reply);
		
		AdminQnaDAO dao =AdminQnaDAO.getInstance();
		dao.updateQna(qnaVO);
		
		response.sendRedirect(url);
		
	}
	
	

}
