package com.kh.sample.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sample.main.vo.WorkroomVo;

@Repository
public class WorkroomSetDaoImpl implements WorkroomSetDao {

	private static final String NAMESPACE = "com.kh.sample.workroomset.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public WorkroomVo getWrSet(String user_id) {
		WorkroomVo workroomVo = sqlSession.selectOne(NAMESPACE + "getWrSet", user_id);
		return workroomVo;
	}

	@Override
	public void updateWrName(WorkroomVo workroomVo) {
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("wr_name", wr_name);
//		map.put("user_id", user_id);
		sqlSession.update(NAMESPACE + "updateWrName", workroomVo);
	}

	@Override
	public void updateWrIntro(String user_id, String wr_intro) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("wr_intro", wr_intro);
		map.put("user_id", user_id);
		sqlSession.update(NAMESPACE + "updateWrIntro", map);
		
	}

}
