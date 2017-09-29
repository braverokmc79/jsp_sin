package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld")  //HelloWorld 라고 주소 url 에 표시해주어야 이 서블릿 클래스가 실행됩니다.
public class HelloWorld extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);	
	}

	//일괄 처리 즉, doget이던 doPost 던 아래 reqpro 메소드가 실행되게 해줌
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//화면에 HelloWorld 라고 출력을 하고 싶어요.  jsp 쪽으로 넘겨질 데이터를 설정.
		String msg="Hello World~ 안녕하세요.";
		Integer data=12;
		
		//jsp 쪽으로 데이터를 request 에 부착하여 넘겨줌.
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		
		//서블릿에서 jsp 를 호출하면서 데이터를 넘겨주는 객체를 선언
		RequestDispatcher dis =request.getRequestDispatcher("HelloWolrd.jsp"); //Jsp를 명을 기술
		dis.forward(request, response);
		
	}
	
	
	
}
