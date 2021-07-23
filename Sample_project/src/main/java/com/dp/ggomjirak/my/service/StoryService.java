package com.dp.ggomjirak.my.service;

import java.util.List;

import com.dp.ggomjirak.vo.StoryVo;

public interface StoryService {
	public List<StoryVo> StoryList(String user_id);
	public void StoryWrite(StoryVo storyVo);
	public void StoryUpdate(StoryVo storyVo);
	public void StoryDelete(int st_no);
	public StoryVo StorySelect(int st_no);
}
