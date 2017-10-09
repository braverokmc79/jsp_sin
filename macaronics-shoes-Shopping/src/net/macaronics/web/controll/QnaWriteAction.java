package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.QnaDAO;
import net.macaronics.web.dto.MemberVO;
import net.macaronics.web.dto.QnaVO;

public class QnaWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="MacaronicsServlet?command=qna_list";
		
		HttpSession session =request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		
		if(loginUser==null){
			url = "MacaronicsServlet?command=login_form";
		}else{
			QnaVO qnaVO=new QnaVO();
			qnaVO.setSubject(request.getParameter("subject"));
			qnaVO.setContent(request.getParameter("content"));
			QnaDAO qnaDAO =QnaDAO.getInstance();
			qnaDAO.insertQna(qnaVO, loginUser.getId());
			
		}
		response.sendRedirect(url);		
	}
	
	
	
}
