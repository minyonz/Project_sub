package com.dp.ggomjirak.my.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

@Repository
public class WorkroomDaoImpl implements WorkRoomDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.workroom.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HobbyVo> listHobby(PagingDto pagingDto) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "listHobby", pagingDto);
		return list;
	}
	
	@Override
	public int hobbyCount(String hobby_writer) {
		int count = sqlSession.selectOne(NAMESPACE + "hobbyCount", hobby_writer);
		return count;
	}
	
	@Override
	public MemberVo getMemInfo(String user_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemInfo", user_id);
//		System.out.println(memberVo);
		return memberVo;
	}

}
