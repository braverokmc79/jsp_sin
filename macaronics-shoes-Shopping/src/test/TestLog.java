package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/TestLog")
public class TestLog extends HttpServlet {

	private static Logger logger2 = LogManager.getFormatterLogger(TestLog.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		final Logger logger = LogManager.getLogger(TestLog.class);

		logger.debug("debug, servlet! {}", "debug- aaa");
		logger.info("Hello,  {}", "info- aaa");
		logger.error("error, servlet! {}", "error- aaa");
		logger.warn("warn, servlet! {}", "warn- aaa");
		logger.fatal("fatal, servlet! {}", "fatal- aaa");

		logger2.debug("Logging in user %s with birthday %s", "macaronics", "20171003");
		logger2.debug("Integer.MAX_VALUE = %,d", Integer.MAX_VALUE);
		logger2.debug("Long.MAX_VALUE = %,d", Long.MAX_VALUE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
