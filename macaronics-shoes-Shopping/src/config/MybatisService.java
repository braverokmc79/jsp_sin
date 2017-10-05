package config;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisService {
// SqlSessionFactoryBuilder => SqlSessionFactory
//		=> SqlSession	
	//SqlSession 객체 생성기
	private static SqlSessionFactory factory;
	static {
		try {
			// Java Resources의 src
			Reader r = Resources.getResourceAsReader("config/sqlMapConfig.xml");
			//SqlSessionFactory 생성기
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
	// session 자원 닫기
	public static void sessionClose(SqlSession session){
		if(session !=null) session.close();
	}
	
	
}
