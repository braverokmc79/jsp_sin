package net.macaronics.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dao.MemberDAO;
import net.macaronics.web.dto.MemberVO;

public class AdminMemberListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String url="admin/member/memberList.jsp";
		
		String key="";
		if(request.getParameter("key")!=null){
			key =request.getParameter("key");
		}
		
		MemberDAO memberDAO =MemberDAO.getInstance();
		List<MemberVO> memberList=memberDAO.listMember(key);
				
		
		request.setAttribute("key", key);
		request.setAttribute("memberList", memberList);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	
}
