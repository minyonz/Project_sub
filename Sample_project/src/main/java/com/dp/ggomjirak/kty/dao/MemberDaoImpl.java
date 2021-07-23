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
		sqlSession.insert(NAMESPACE + "insertMemberDetail", memberVo);
		sqlSession.insert(NAMESPACE + "insertMemberSetUp", memberVo);
	}

	@Override
	public MemberVo info(String user_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "info");
		return memberVo;
	}

	@Override
	public void updateArticle(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberInfo", memberVo); 
		sqlSession.update(NAMESPACE + "updateMemberDetail", memberVo); 
		
	}

}
