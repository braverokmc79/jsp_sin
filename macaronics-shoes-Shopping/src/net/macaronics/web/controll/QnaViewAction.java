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

public class QnaViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="qna/qnaView.jsp";
		
		HttpSession session =request.getSession();
		MemberVO loginUser =(MemberVO)session.getAttribute("loginUser");
		
		if(loginUser==null){
			url = "MacaronicsServlet?command=login_form";
			
		}else{
			int qseq=Integer.parseInt(request.getParameter("qseq"));
			QnaDAO qnaDAO=QnaDAO.getInstance();
			QnaVO qnaVO=qnaDAO.getQna(qseq);
			String str =qnaVO.getContent();
			String content=str.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
			qnaVO.setContent(content);
			request.setAttribute("qnaVO", qnaVO);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
 
}
