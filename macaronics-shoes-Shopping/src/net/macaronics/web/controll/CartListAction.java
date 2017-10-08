package net.macaronics.web.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.controll.common.CommonList;
import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dto.CartVO;
import net.macaronics.web.dto.MemberVO;

public class CartListAction implements Action {

	//장바구니 목록 보기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String url="mypage/cartList.jsp";
		
		HttpSession session=request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		if(loginUser==null){
			url="MacaronicsServlet?command=login_form";
			
		}else{
			//공통 리스트 장바구니 목록
			//MacaronicsServlet 존재
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}
	
	
	

}










