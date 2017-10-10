package net.macaronics.web.admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.macaronics.web.admin.controller.dao.AdminProductDAO;
import net.macaronics.web.controll.action.Action;
import net.macaronics.web.dto.ProductVO;

public class AdminProductWriteAction implements Action {
  
	private static Logger logger =LogManager.getLogger(AdminProductWriteAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="MacaronicsServlet?command=admin_product_list";
		
		HttpSession session=request.getSession();
				
		int sizeLimit =5 * 1024 * 1024;
		String savePath="images";
		String uploadFilePath =session.getServletContext().getRealPath(savePath);
		
		MultipartRequest multi=new MultipartRequest(request, //1.요청객체 
			uploadFilePath, //2.업로드될 파일이 저장될 파일 경로명
			sizeLimit, //3. 업로드될 파일의 최대 크기 (5MB)
			"UTF-8", //4. 인코딩 타입 지정
			new DefaultFileRenamePolicy()  // 5. 덮어씌기를 방지 위한 부분
		); // 이 시점을 기해 파일은 이미 저장이 되었다.
		
		
		String bestyn=multi.getParameter("bestyn");
		String useyn=multi.getParameter("useyn");
		if(bestyn==null) bestyn="n";
		else bestyn="y"; 	
		
		if(useyn==null) useyn="n";
		else useyn="y";
		
		ProductVO productVO=new ProductVO();
		productVO.setKind(multi.getParameter("kind"));
		productVO.setName(multi.getParameter("name"));
		productVO.setPrice1(Integer.parseInt(multi.getParameter("price1")));
		productVO.setPrice2(Integer.parseInt(multi.getParameter("price2")));
		productVO.setPrice3(Integer.parseInt(multi.getParameter("price2")) - Integer.parseInt(multi.getParameter("price1")));
		
		productVO.setBestyn(bestyn);
		productVO.setUseyn(useyn);
		
		productVO.setContent(multi.getParameter("content"));
		productVO.setImage(multi.getFilesystemName("image"));
		
		logger.info("AdminProductWriteAction -   {}" , productVO.toString());
		
		AdminProductDAO adminProductDAO =AdminProductDAO.getInstance();
		adminProductDAO.insertProudct(productVO);
		response.sendRedirect(url);
		
	}
	

	
	
}

