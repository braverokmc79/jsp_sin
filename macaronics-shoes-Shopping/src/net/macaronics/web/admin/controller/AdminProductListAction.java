package net.macaronics.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.Paging;
import net.macaronics.web.admin.controller.dao.AdminProductDAO;
import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dto.ProductVO;

public class AdminProductListAction implements Action {
    private static final Logger logger =LogManager.getLogger(AdminProductListAction.class);
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="admin/product/productList.jsp";
		//1.페이징 객체 생성 페이지의 넘버값을 읽어드림
		String pageNum="1";
		if(request.getParameter("pageNum")!=null){
			pageNum=request.getParameter("pageNum");
		}
		Paging paging =new Paging(pageNum);
		AdminProductDAO productDAO =AdminProductDAO.getInstance();
		//2.페이징 객체에 전체페이지를 넘겨줌,  Paging 클래스에서 페이지 계산 처리 됨
		String key=request.getParameter("key");
		
		if(key==null)key="%";
		int count=productDAO.totalRecord(key);
		paging.setTotalCount(count);
		 //3.페이지가 넘어갈 url 주소
		paging.paginHtml("MacaronicsServlet?command=admin_product_list&key="+key);
		
		
		logger.info("AdminProductListAction  - {},  {},  {} " , count, paging.getStartRow(), paging.getEndRow());
		List<ProductVO> productList=productDAO.listProduct(paging,key );
		
		
		
		request.setAttribute("key", key);
		request.setAttribute("paging", paging);
		request.setAttribute("count", count);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	
	
	
}
