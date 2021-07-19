package com.kh.sample.main.service;

import java.util.List;

import com.kh.sample.main.vo.StoryVo;

public interface StoryService {
	public List<StoryVo> StoryList();
	public void StoryWrite(StoryVo storyVo);
	public void StoryUpdate(StoryVo storyVo);
	public void StoryDelete(int st_no);
	public StoryVo StorySelect(int st_no);
}
