package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.my.dao.StoryCommentDao;
import com.dp.ggomjirak.my.dao.StoryDao;
import com.dp.ggomjirak.vo.StoryCommentVo;

@Service
public class StoryCommentServiceImpl implements StoryCommentService{

	@Inject
	StoryCommentDao storyCommentDao;
	
	@Inject
	StoryDao storyDao;
	
	@Transactional
	@Override
	public void writeComment(StoryCommentVo storyCommentVo) {
		storyDao.updateCommentCnt(storyCommentVo.getSt_no(), 1);
		storyCommentDao.insertComment(storyCommentVo);
	}

	@Override
	public List<StoryCommentVo> listComment(int st_no) {
		List<StoryCommentVo> list = storyCommentDao.listComment(st_no);
		return list;
	}

}
