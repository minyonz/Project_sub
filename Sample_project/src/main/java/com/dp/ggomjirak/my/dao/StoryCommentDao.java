package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.StoryCommentVo;

public interface StoryCommentDao {
	public void insertComment(StoryCommentVo storyCommentVo);
	public List<StoryCommentVo> listComment(int st_no);
}
