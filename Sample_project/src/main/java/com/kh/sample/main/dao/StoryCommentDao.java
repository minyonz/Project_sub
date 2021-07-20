package com.kh.sample.main.dao;

import java.util.List;

import com.kh.sample.main.vo.StoryCommentVo;

public interface StoryCommentDao {
	public void insertComment(StoryCommentVo storyCommentVo);
	public List<StoryCommentVo> listComment(int st_no);
}
