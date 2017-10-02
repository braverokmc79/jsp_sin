package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;
import model.Paging;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {

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
		
		//1.페이징 객체 생성 페이지의 넘버값을 읽어드림
		Paging paging =new Paging(request.getParameter("pageNum"));
		BoardDAO bdao =new BoardDAO();	
		//2.페이징 객체에 전체페이지를 넘겨줌,  Paging 클래스에서 페이지 계산 처리 됨
		paging.setTotalCount(bdao.getAllCount());
		//3.페이지가 넘어갈 url 주소
		paging.paginHtml("BoardListCon.do");

		
		//페이징 객체에서 계산 처린된  row 값 최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
		Vector<BoardBean> v =bdao.getAllBoard(paging.getStartRow(), paging.getEndRow());

		
		//수정시
		String msg=(String)request.getAttribute("msg");
		if(request.getParameter("msg")!=null){
			msg=request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		
		/////// BoardList.jsp 쪽으로 request 객체에 담아서 넘겨줌
		request.setAttribute("v",v);
		request.setAttribute("paging", paging);

		RequestDispatcher dis =request.getRequestDispatcher("BoardList.jsp");
		dis.forward(request, response);
		
	}
	
	
	
	

}
