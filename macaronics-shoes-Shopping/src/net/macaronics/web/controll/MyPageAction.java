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

public class MyPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="mypage/mypage.jsp";
		
		HttpSession session=request.getSession();
		MemberVO loginUser =(MemberVO)session.getAttribute("loginUser");
		
		if(loginUser==null){
			url="MacaronicsServlet?command=login_form";
		}else{
			OrderDAO orderDAO =OrderDAO.getInstance();
			//주문한 목록 중 미처리인 주문 번호 oseq 번호를 가져오기  
//			CREATE OR REPLACE VIEW ORDER_VIEW
//			AS
//			   SELECT d.odseq,  // tbl_order_detail 주문 상테이블의  primary key
//			          o.oseq, //TBL_ORDERS 주문 테이블의 주문 번호 primary key
//			          o.id,
//			          o.indate,
//			          d.pseq,
//			          d.quantity,
//			          m.name mname,
//			          m.zip_num,
//			          m.address,
//			          m.phone,
//			          p.name pname,
//			          p.price2,
//			          d.result
//			     FROM tbl_orders o,
//			          tbl_order_detail d,
//			          tbl_member m,
//			          tbl_product p
//			    WHERE o.oseq = d.oseq AND o.id = m.id AND d.pseq = p.pseq
//			
			
			List<Integer> oseqList=orderDAO.selectSeqOrdering(loginUser.getId());
			//현재 진행 중인 주문 목록 대표 상품 외 2건식으로 출력하기기
			ArrayList<OrderVO> orderList=new ArrayList<>();
			
			//주문중인 번호 상품 oseq 를 반복문을 돌린다.
			for(int oseq :oseqList){
				//미처리 항목 1
				List<OrderVO> orderListing=orderDAO.listOrderById(loginUser.getId(), "1", oseq);
				
				//목록중 첫번째 값만 orderVO 객체에 담는다.
				OrderVO orderVO=orderListing.get(0);
				orderVO.setPname(orderVO.getPname() + " 외 "+ orderListing.size() + "  건");
				
				//주문 된 상품 목록의 전체 가격을 price2 에  담는다.
				int totalPrice=0;
				for(OrderVO  ovo : orderListing){
					totalPrice +=ovo.getPrice2()*ovo.getQuantity();
				}
				orderVO.setPrice2(totalPrice);
				
				
				orderList.add(orderVO);
			}
			
			request.setAttribute("title", loginUser.getName()+"님의  진행 중인 주문 내역");
			request.setAttribute("orderList", orderList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	
}






