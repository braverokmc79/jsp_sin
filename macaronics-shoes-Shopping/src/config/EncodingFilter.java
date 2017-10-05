package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

// 어노테이션(annotation, 코드에 대한 주석)
@WebFilter("/*")  // 필터와 url pattern 매핑
public class EncodingFilter implements Filter {
	private String charset="utf-8";
	
	final Logger logger = LogManager.getLogger(EncodingFilter.class);
	public void destroy() {
		logger.info("필터가 종료되었습니다.");
	}
	//요청이 들어올 때 거쳐가는 코드
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		//선처리할 코드 
		request.setCharacterEncoding(charset);
		//logger.info("필터가 실행되었습니다.");
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}
	//필터를 초기화시킴
	public void init(FilterConfig fConfig) throws ServletException {
		logger.info("필터가 초기화되었습니다.");
	} 
}








