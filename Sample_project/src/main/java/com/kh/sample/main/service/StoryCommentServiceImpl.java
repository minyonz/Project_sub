package com.kh.sample.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sample.main.dao.StoryCommentDao;
import com.kh.sample.main.vo.StoryCommentVo;

@Service
public class StoryCommentServiceImpl implements StoryCommentService{

	@Inject
	StoryCommentDao storyCommentDao;
	
	@Override
	public void writeComment(StoryCommentVo storyCommentVo) {
		storyCommentDao.insertComment(storyCommentVo);
	}

}
