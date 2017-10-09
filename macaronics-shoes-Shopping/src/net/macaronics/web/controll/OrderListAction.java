package net.macaronics.web.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dao.OrderDAO;
import net.macaronics.web.dto.CartVO;
import net.macaronics.web.dto.MemberVO;
import net.macaronics.web.dto.OrderVO;

public class OrderListAction implements Action{

	//주문 처리후 바로 보여주는 주문 목록 페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="mypage/orderList.jsp";
		
		HttpSession session =request.getSession();
		MemberVO loginUser =(MemberVO)session.getAttribute("loginUser");
		
		if(loginUser ==null){
			url="MacaronicsServlet?command=login_form";
		}else{
			OrderDAO orderDAO =OrderDAO.getInstance();
			int oseq=Integer.parseInt(request.getParameter("oseq"));
			
			// 미처리 항목 1을 넣는다.
			List<OrderVO> orderList =orderDAO.listOrderById(loginUser.getId(), "1", oseq);
			
			int orderTotalPrice =0;
			for(OrderVO orderVO : orderList){
				orderTotalPrice +=orderVO.getPrice2()*orderVO.getQuantity();
			}
			
			request.setAttribute("orderList", orderList);
			request.setAttribute("orderTotalPrice", orderTotalPrice);
		}
		request.getRequestDispatcher(url).forward(request, response);	
	}

	
	
	
	
}






