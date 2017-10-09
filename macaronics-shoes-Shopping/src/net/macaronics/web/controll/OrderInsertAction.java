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

public class OrderInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MacaronicsServlet?command=order_list&oseq=";
		
		HttpSession session =request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		if(loginUser==null){
			url = "MacaronicsServlet?command=login_form";			
		}else{
			CartDAO cartDAO =CartDAO.getInstance();
			//장바구니에 담긴 목록을 가져온다.
			List<CartVO> cartList=cartDAO.listCart(loginUser.getId());
			
			OrderDAO orderDAO =OrderDAO.getInstance();
			
			//주문 상품으로 등록한다. 반환 값으로 현재 등록한 주문번호를 가져온다.
			int maxOseq=orderDAO.insertOrder(cartList, loginUser.getId());
		
			
			//장바구니 비우기
			for(CartVO cart: cartList){
				cartDAO.deleteCart(cart.getCseq(), loginUser.getId());
			}
			url +=maxOseq;	
		}
		
		response.sendRedirect(url);
	}

	
	
	
}


