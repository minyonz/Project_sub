package com.dp.ggomjirak.kty.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.member.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVo login(String user_id, String user_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDupId", user_id);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
		System.out.println("insertMember");
		
		sqlSession.insert(NAMESPACE + "insertMemberDetail", memberVo);
		System.out.println("insertMemberDetail");
		
		sqlSession.insert(NAMESPACE + "insertMemberSetUp", memberVo);
		System.out.println("insertMemberSetUp");
		
		sqlSession.insert(NAMESPACE + "insertWorkRoom", memberVo);
		System.out.println("insertWorkRoom");
	}

	@Override
	public MemberVo info(String user_id) {
		System.out.println("MemberDaoImpl info 들어옴 user_id: " + user_id);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "info", user_id);
		System.out.println("MemberDaoImpl selectOne info: " + memberVo);
		return memberVo;
	}

	@Override
	public void updateArticle(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberInfo", memberVo); 
		//sqlSession.update(NAMESPACE + "updateMemberDetail", memberVo); 
		
	}
	
	

	@Override
	public boolean checkDupNick(String user_nick) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDupNick", user_nick);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateProfileArticle(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberProfile", memberVo); 
		
	}

	@Override
	public void updateSetupArticle(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberSetup", memberVo); 
	}

}
