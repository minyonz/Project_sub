package com.kh.sample.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sample.main.vo.HobbyVo;

@Repository
public class WorkroomDaoImpl implements WorkRoomDao {

	private static final String NAMESPACE = "com.kh.sample.workroom.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HobbyVo> listHobby(String hobby_writer) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "listHobby", hobby_writer);
		return list;
	}

}
