package net.macaronics.web.controll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.spi.LoggerFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.CartDAO;
import net.macaronics.web.dto.CartVO;
import net.macaronics.web.dto.MemberVO;

public class CartInsertAjax implements Action{
	
	private static final Logger logger =LogManager.getLogger(CartInsertAjax.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
	
		HttpSession session =request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		PrintWriter out =response.getWriter();
	
		if(loginUser==null){
			out.println("로그인을 먼저 하세요.");
		}else{		
			//장바구니에 등록하기
			CartVO cartVO=new CartVO();
			cartVO.setId(loginUser.getId());
			cartVO.setPseq(Integer.parseInt(request.getParameter("pseq")));
			cartVO.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			CartDAO cartDAO=CartDAO.getInstance();
			cartDAO.insertCart(cartVO);
			
			out.println("success");
		}
		
	}
	
	
}





