package net.macaronics.web.controll;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.OrderDAO;
import net.macaronics.web.dto.MemberVO;
import net.macaronics.web.dto.OrderVO;

public class OrderDetailAction implements Action{

	private static final Logger logger =LogManager.getLogger(OrderDetailAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="mypage/orderDetail.jsp";
		
		HttpSession session=request.getSession();
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		if(loginUser==null){
			url="MacaronicsServlet?command=login_form";
		}else{
			int oseq =Integer.parseInt(request.getParameter("oseq"));
			OrderDAO orderDAO =OrderDAO.getInstance();
			List<OrderVO> orderList=orderDAO.listOrderById(loginUser.getId(), "%", oseq);
			
			logger.info(" OrderDetailAction -  orderList  {}" , orderList.toString());
			
			
			int orderTotalPrice=0;
			OrderVO orderDetail =new OrderVO();
			int i=0;
			for(OrderVO ovo : orderList){
				orderTotalPrice =ovo.getPrice2()*ovo.getQuantity();
				if(i==0){
					orderDetail.setIndate(ovo.getIndate());
					orderDetail.setOseq(ovo.getOseq());
					orderDetail.setMname(ovo.getMname());
					orderDetail.setPname(ovo.getPname() + " 외 " + orderList.size() + " 건");
				}
				i++;
			}
			
			request.setAttribute("orderDetail", orderDetail);
			request.setAttribute("orderList", orderList);
			request.setAttribute("orderTotalPrice", orderTotalPrice);
			
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	
}

