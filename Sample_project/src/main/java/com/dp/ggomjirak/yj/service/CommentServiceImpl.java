package com.dp.ggomjirak.yj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.vo.CommentVo;
import com.dp.ggomjirak.yj.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDao commentDao;
	
	@Override
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
	}

	@Override
	public void insertRecomment(CommentVo commentVo) {
		commentDao.insertRecomment(commentVo);
	}

	@Override
	public List<CommentVo> selectCommentList(int h_no) {
		return commentDao.selectCommentList(h_no);
	}

	@Override
	public void updateComment(CommentVo commentVo) {
		commentDao.updateComment(commentVo);
	}

	@Override
	public int deleteComment(int c_no) {
		return commentDao.deleteComment(c_no);
	}

}
