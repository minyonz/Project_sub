package com.kh.sample.main.dao;

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
	public void insertArticle(StoryVo storyVo) {
		sqlSession.insert(NAMESPACE + "insertArticle", storyVo);
	}
	
}
