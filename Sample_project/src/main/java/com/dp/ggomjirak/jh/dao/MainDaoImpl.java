package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;

@Repository
public class MainDaoImpl implements MainDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.main.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getPopularHobbyList");
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getMonthHobbyList");
		System.out.println(list);
		return list;
	}


}
