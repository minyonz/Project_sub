package com.kh.sample.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sample.main.vo.StoryVo;

@Repository
public class StoryDaoImpl implements StoryDao{

	private static final String NAMESPACE = "com.kh.sample.story.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertStory(StoryVo storyVo) {
		sqlSession.insert(NAMESPACE + "insertStory", storyVo);
	}

	@Override
	public List<StoryVo> listStory() {
		List<StoryVo> list = sqlSession.selectList(NAMESPACE + "listStory");
		return list;
	}

	@Override
	public void deleteStory(int st_no) {
		sqlSession.delete(NAMESPACE + "deleteStory", st_no);
	}

	@Override
	public void updateStory(StoryVo storyVo) {
		sqlSession.update(NAMESPACE + "updateStory", storyVo);
		
	}

	@Override
	public StoryVo selectStory(int st_no) {
		StoryVo storyVo = sqlSession.selectOne(NAMESPACE + "selectStory", st_no);
		return storyVo;
	}
	
}
