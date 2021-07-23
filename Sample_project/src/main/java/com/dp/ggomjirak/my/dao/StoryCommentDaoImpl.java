package com.dp.ggomjirak.my.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.StoryCommentVo;

@Repository
public class StoryCommentDaoImpl implements StoryCommentDao{

	private static final String NAMESPACE = "com.dp.ggomjirak.storyComment.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertComment(StoryCommentVo storyCommentVo) {
		sqlSession.insert(NAMESPACE + "insertComment", storyCommentVo);
	}

	@Override
	public List<StoryCommentVo> listComment(int st_no) {
		List<StoryCommentVo> list = sqlSession.selectList(NAMESPACE + "listComment", st_no);
		return list;
	}

}