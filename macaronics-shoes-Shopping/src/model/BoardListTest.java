package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MybatisService;
//Test
public class BoardListTest {

	SqlSession session=MybatisService.getFactory().openSession();
	
	public List<BoardBean> memberList(){
		List<BoardBean> items=new ArrayList<BoardBean>();
		Map<String,Object> map=
				new HashMap<String,Object>();		
		items = session.selectList("member.memberlist",map);
		return items;
	}
	
}




