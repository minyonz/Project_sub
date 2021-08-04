package com.dp.ggomjirak.yj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CommentVo;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.comment.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertComment(CommentVo commentVo) {
		sqlSession.insert(NAMESPACE + "insertComment", commentVo);

	}

	@Override
	public void insertRecomment(CommentVo commentVo) {
		sqlSession.insert(NAMESPACE + "insertRecomment", commentVo);
		
	}

	@Override
	public List<CommentVo> selectCommentList(int h_no) {
		return sqlSession.selectList(NAMESPACE + "selectCommentList", h_no);
	}

	@Override
	public void updateComment(CommentVo commentVo) {
		sqlSession.update(NAMESPACE + "updateComment", commentVo);
	}

	@Override
	public int deleteComment(CommentVo commentVo) {
		return sqlSession.update(NAMESPACE + "deleteComment", commentVo);
	}

}
