package com.kh.sample.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sample.main.dao.StoryCommentDao;
import com.kh.sample.main.dao.StoryDao;
import com.kh.sample.main.vo.StoryCommentVo;

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
