package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
 
 
public class CrossScriptingFilter implements Filter {
 
    private FilterConfig filterConfig;
    
    private Logger logger =LogManager.getLogger(CrossScriptingFilter.class);
    

	public void init(FilterConfig filterConfig) throws ServletException {
        //logger.debug(" xss 필터  {}  ",  "init" );  
		this.filterConfig = filterConfig;
    }
 
    public void destroy() {
    	//logger.debug(" xss 필터  {}  ",  "destroy" );
        this.filterConfig = null;
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
    	//logger.debug(" xss 필터  {}  ",  "doFilter" );
        chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
 
    }
 
}



