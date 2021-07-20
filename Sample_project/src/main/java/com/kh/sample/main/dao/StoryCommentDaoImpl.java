package com.kh.sample.main.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sample.main.vo.StoryCommentVo;

@Repository
public class StoryCommentDaoImpl implements StoryCommentDao{

	private static final String NAMESPACE = "com.kh.sample.storyComment.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertComment(StoryCommentVo storyCommentVo) {
		sqlSession.insert(NAMESPACE + "insertComment", storyCommentVo);
	}

}
