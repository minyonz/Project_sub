package com.dp.ggomjirak.my.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public void updateComment(int st_c_no, String st_c_content) {
		Map<String, Object> map = new HashMap<>();
		map.put("st_c_content", st_c_content);
		map.put("st_c_no", st_c_no);
		sqlSession.update(NAMESPACE + "updateComment", map);
	}

	@Override
	public void deleteComment(int st_c_no) {
		sqlSession.update(NAMESPACE + "deleteComment", st_c_no);
	}

	@Override
	public int commentCount(int st_no) {
		int count = sqlSession.selectOne(NAMESPACE + "commentCount", st_no);
		return count;
	}

}
