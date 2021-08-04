package com.dp.ggomjirak.yj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.vo.CommentVo;
import com.dp.ggomjirak.yj.dao.CommentDao;
import com.dp.ggomjirak.yj.dao.HobbyDao;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDao commentDao;
	
	@Inject
	private HobbyDao hobbyDao;
	
	@Override
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
		hobbyDao.updateCmtCnt(commentVo.getH_no(), 1);
	}

	@Override
	public void insertRecomment(CommentVo commentVo) {
		commentDao.insertRecomment(commentVo);
		hobbyDao.updateCmtCnt(commentVo.getH_no(), 1);
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
	public int deleteComment(CommentVo commentVo) {
		hobbyDao.updateCmtCnt(commentVo.getH_no(), -1);
		return commentDao.deleteComment(commentVo);
	}

}
