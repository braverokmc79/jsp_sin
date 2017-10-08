package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dto.CartVO;
import net.macaronics.web.dto.MemberVO;

public class CartInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MacaronicsServlet?command=product_detail&pseq=";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "MacaronicsServlet?command=login_form";
		} else {

			// 장바구니에 등록하기
			CartVO cartVO = new CartVO();
			cartVO.setId(loginUser.getId());
			
			int pseq=Integer.parseInt(request.getParameter("pseq"));		
			cartVO.setPseq(pseq);
			cartVO.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			CartDAO cartDAO = CartDAO.getInstance();
			cartDAO.insertCart(cartVO);
			url += pseq;
		}
		response.sendRedirect(url);
	}

}
