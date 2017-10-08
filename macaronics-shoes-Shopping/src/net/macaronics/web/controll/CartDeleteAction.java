package net.macaronics.web.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dto.MemberVO;

public class CartDeleteAction implements Action {
	final static Logger logger = LogManager.getLogger(CartDeleteAction.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "MacaronicsServlet?command=cart_list";

		String[] cseqArr = request.getParameterValues("cseq");
		MemberVO member = (MemberVO) request.getSession().getAttribute("loginUser");
		try {
			for (String cseq : cseqArr) {
				logger.info(cseq);
				CartDAO dao = CartDAO.getInstance();
				dao.deleteCart(Integer.parseInt(cseq), member.getId());
			}
			response.sendRedirect(url);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(url);
		}

	}

}
