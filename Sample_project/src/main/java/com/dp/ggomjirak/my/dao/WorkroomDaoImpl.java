package com.dp.ggomjirak.my.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

@Repository
public class WorkroomDaoImpl implements WorkRoomDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.workroom.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HobbyVo> listHobby(String hobby_writer) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "listHobby", hobby_writer);
		return list;
	}

	@Override
	public MemberVo getMemInfo(String user_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemInfo", user_id);
//		System.out.println(memberVo);
		return memberVo;
	}

}
