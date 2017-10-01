package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardReWriteProcCon.do")
public class BoardReWriteProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}
	

	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//빈에 넘어온 데이터를 저장
		BoardBean bean =new BoardBean();
		
		bean.setContent(request.getParameter("content"));
		bean.setEmail(request.getParameter("email"));
		bean.setPassword(request.getParameter("password"));
		bean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		bean.setRe_step(Integer.parseInt(request.getParameter("re_step")));

		bean.setRef(Integer.parseInt(request.getParameter("ref")));
		bean.setSubject(request.getParameter("subject"));
		bean.setWriter(request.getParameter("writer"));
		
		BoardDAO bdao =new BoardDAO();
		bdao.reInsertBoard(bean);
		
		response.sendRedirect("BoardListCon.do");
	}
	
	

}


