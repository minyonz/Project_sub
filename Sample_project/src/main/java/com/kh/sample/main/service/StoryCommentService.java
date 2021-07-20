package com.kh.sample.main.service;

import java.util.List;

import com.kh.sample.main.vo.StoryCommentVo;

public interface StoryCommentService {
	public void writeComment(StoryCommentVo storyCommentVo);
	public List<StoryCommentVo> listComment(int st_no);
}
