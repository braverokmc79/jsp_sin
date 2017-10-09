package net.macaronics.web.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.QnaDAO;
import net.macaronics.web.dto.MemberVO;
import net.macaronics.web.dto.QnaVO;

public class QnaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="qna/qnaList.jsp";
		HttpSession session=request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		
		if(loginUser==null){
			url = "MacaronicsServlet?command=login_form";
		}else{
			QnaDAO qnaDAO=QnaDAO.getInstance();
			List<QnaVO> qnaList=qnaDAO.listQna(loginUser.getId());
			request.setAttribute("qnaList", qnaList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	
}
