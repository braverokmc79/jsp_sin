package net.macaronics.web.admin.controller;

import java.io.File;
import java.io.IOException;

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

public class AdminProductUpdateAction implements Action {
	
	private static final Logger logger=LogManager.getLogger(AdminProductUpdateAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="MacaronicsServlet?command=admin_product_list&pageNum=";
		HttpSession session=request.getSession();
		
		int sizeLimit=5 * 1024 * 1024;
		String savePath="images";
		String uploadFilePath=session.getServletContext().getRealPath(savePath);
		
		
		MultipartRequest multi =new MultipartRequest(request, //1. 요청 객체
				uploadFilePath, //2.업로드될 파일의 저장될 파일 경로명
				sizeLimit, //3. 업로드될 파일의 최대 크기 (5MB)
				"UTF-8", //4. 인코딩 타입 지정
				new DefaultFileRenamePolicy());
		//이시점을 기해 파일은 이민 저장이 되어 있다.

		
		ProductVO productVO=new ProductVO();
		productVO.setPseq(Integer.parseInt(multi.getParameter("pseq")));
		productVO.setKind(multi.getParameter("kind"));
		productVO.setName(multi.getParameter("name"));
		productVO.setPrice1(Integer.parseInt(multi.getParameter("price1")));
		productVO.setPrice2(Integer.parseInt(multi.getParameter("price2")));
		productVO.setPrice3(Integer.parseInt(multi.getParameter("price2")) - Integer.parseInt(multi.getParameter("price1")));
		
		
		String bestyn=multi.getParameter("bestyn");
		String useyn=multi.getParameter("useyn");
		if(bestyn==null) bestyn="n";
		else bestyn="y"; 	
		
		if(useyn==null) useyn="n";
		else useyn="y";
		
		productVO.setBestyn(bestyn);
		productVO.setUseyn(useyn);
		
		productVO.setContent(multi.getParameter("content"));
		
		
		if(multi.getFilesystemName("image")==null){
			//이미지 파일을 업로드 하지 않았으면 기존의 이미지 사용
			productVO.setImage(multi.getParameter("orgImg"));
		}else{
			productVO.setImage(multi.getFilesystemName("image"));
			//기존 이미지 파일 지우기
			File file =new File(uploadFilePath+File.separator+multi.getParameter("orgImg"));
			logger.info("uploadFilePath -   {}" , uploadFilePath);
			if(file.exists()){
				file.delete();
				logger.info("파일 삭제 -   {}" );
			}
		}
		
		AdminProductDAO amdinProductDAO=AdminProductDAO.getInstance();
		amdinProductDAO.updateProduct(productVO);
		
		
		logger.info("AdminProductUpdateAction -   {}" , productVO.toString());
		
		response.sendRedirect(url+multi.getParameter("pageNum"));
		
	}

}
