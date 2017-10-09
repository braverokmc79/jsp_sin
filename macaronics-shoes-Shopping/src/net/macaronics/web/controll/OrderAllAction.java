package net.macaronics.web.controll;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.OrderDAO;
import net.macaronics.web.dto.MemberVO;
import net.macaronics.web.dto.OrderVO;

public class OrderAllAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url="mypage/mypage.jsp";
		 
		 HttpSession session= request.getSession();
		 MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		 
		 if(loginUser==null){
			 url="MacaronicsServlet?command=login_form";
		 }else{
			 OrderDAO orderDAO =OrderDAO.getInstance();
			 //중복을 제거한 주문 번호만 불러오기
			 //select distinct oseq from order_view where id=#{id} and result='1' order by oseq desc
			 List<Integer> oseqList=orderDAO.selectSeqOrdering(loginUser.getId());
			 //주문 목록 담기 객체 만들기
			 List<OrderVO> orderList=new ArrayList<>();
			 			 
			 for(int oseq: oseqList){
				 List<OrderVO> orderListing=orderDAO.listOrderById(loginUser.getId(),
						 "%", oseq);
				 
				 OrderVO orderVO=orderListing.get(0);
				 orderVO.setPname(orderVO.getPname() + " 외" + orderListing.size() + " 건");
				 
				 int totalPrice=0;
				 for(OrderVO ovo : orderListing){
					 totalPrice += ovo.getPrice2()* ovo.getQuantity();
				 }
				 orderVO.setPrice2(totalPrice);
				 orderList.add(orderVO);
			 }
			 request.setAttribute("title", "총 주문 내역");
			 request.setAttribute("orderList", orderList);
		 }
		 request.getRequestDispatcher(url).forward(request, response);
	}
	

	
}



