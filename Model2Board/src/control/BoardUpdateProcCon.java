package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

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
		
		//폼에서 넘어온 데이터를 받아줌
		int num =Integer.parseInt(request.getParameter("num"));
		String password =request.getParameter("password"); //사용자로부터 입력받은 패스워드
		String pass =request.getParameter("pass");//실제 데이터베이스에 저장되어있는 패스워드값
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		//password 값과 pass 값을 비교해야 합니다.
		
		
		
	}
	
	
}
