package net.macaronics.web.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.controll.common.CommonList;
import net.macaronics.web.controll.factory.ActionFactory;

@WebServlet("/MacaronicsServlet")
public class MacaronicsServlet extends HttpServlet {

	final Logger logger =LogManager.getLogger(MacaronicsServlet.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//요청시 보내 파라미터 command 값을 얻어온다.
		String command=request.getParameter("command");
		//파라미터 command 값이 제대로 전달되었는지 확인차 출력
		logger.info("MacaronicsServlet 에서 요청을 받음을 확인  - command 값 : {} " ,command );	
	
		ActionFactory af =ActionFactory.getInstance();
		Action action =af.getAction(command);
		
		//공통 리스트 장바구니 목록
		CommonList.getCommon(request);
		
		if(action!=null){
			action.execute(request, response);
		}		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//post 방식도 doGet() 에서만 요청에 대한 처리를 한다.
		doGet(request, response);
	}
	
	
}
