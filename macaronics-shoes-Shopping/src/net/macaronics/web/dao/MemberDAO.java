package net.macaronics.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import config.MybatisService;
import net.macaronics.web.dto.MemberVO;

public class MemberDAO {
 
	private SqlSession sqlSession;
	
	private static Logger logger= LogManager.getLogger(MemberDAO.class);
	
	private MemberDAO(){
		
	}
	private static MemberDAO instance;
	
	public static MemberDAO getInstance(){
		if(instance==null){
			instance=new MemberDAO();
		}
		return instance;
	}
	
	
	//유저아이디 체크
	public boolean confirm(String id){
		int result=0;
		//result 값이 0 보다 크면  아이디 중복
		try{
			sqlSession=MybatisService.getFactory().openSession();
			result=sqlSession.selectOne("member.confirm", id);
			logger.info(" confirm result - {} ", result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return result ==0 ? false :true;
	}
	
	//회원 정보 불러오기
	public MemberVO getMember(String id){
		MemberVO memberVO=new MemberVO();
		try{
			sqlSession=MybatisService.getFactory().openSession();
			memberVO=sqlSession.selectOne("member.getMember", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MybatisService.sessionClose(sqlSession);
		}
		return memberVO;
	}
	
	
	//회원 등록
	public void insertMember(MemberVO memberVO){
		try{
			sqlSession=MybatisService.getFactory().openSession();
			sqlSession.insert("member.insertMember", memberVO);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		   //select 이외의 문장은 commit()을 해야 함		
			sqlSession.commit();
			MybatisService.sessionClose(sqlSession);
		}
	}
	
	//아이디와 비밀번화 체크
	public boolean checkIdAndPwd(String id, String pwd){
		int confirm=0;
		try{
			sqlSession=MybatisService.getFactory().openSession();
			Map<String, Object> map =new HashMap<>();
			map.put("id", id);
			map.put("pwd",pwd);
			confirm=sqlSession.selectOne("member.checkIdAndPwd", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		//0보다 크면 로그인 성공
		return confirm >0 ? true :false;
	}
	
	
	//관리자 회원 목록 출력
	public List<MemberVO> listMember(String member_name){
		List<MemberVO> memberList=new ArrayList<>();
		try{
			sqlSession =MybatisService.getFactory().openSession();			
			memberList=sqlSession.selectList("member.listMember", member_name);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MybatisService.sessionClose(sqlSession);
		}
		return memberList;
	}
	
	
	
}





