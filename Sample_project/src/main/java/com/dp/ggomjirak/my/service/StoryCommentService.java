package com.dp.ggomjirak.my.service;

import java.util.List;

import com.dp.ggomjirak.vo.StoryCommentVo;

public interface StoryCommentService {
	public void writeComment(StoryCommentVo storyCommentVo);
	public List<StoryCommentVo> listComment(int st_no);
}
