package net.macaronics.web.controll.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dto.CartVO;
import net.macaronics.web.dto.MemberVO;

public class CommonList {
	final static Logger logger = LogManager.getLogger(CommonList.class);

	public static void getCommon(HttpServletRequest request) {
		HttpSession session = ((HttpServletRequest) request).getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser != null) {
			CartDAO cartDAO = CartDAO.getInstance();
			List<CartVO> cartList = cartDAO.listCart(loginUser.getId());
			int totalPrice = 0;
			for (CartVO cartVO : cartList) {
				totalPrice += cartVO.getPrice2() * cartVO.getQuantity();
			}

			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
		}

	}

}
