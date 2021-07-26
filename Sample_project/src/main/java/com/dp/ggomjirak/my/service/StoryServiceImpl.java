package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.my.dao.StoryDao;
import com.dp.ggomjirak.vo.StoryPagingDto;
import com.dp.ggomjirak.vo.StoryVo;

@Service
public class StoryServiceImpl implements StoryService{

	@Inject
	StoryDao storyDao;
	
	@Override
	public List<StoryVo> StoryList(StoryPagingDto storyPagingDto) {
		List<StoryVo> list = storyDao.listStory(storyPagingDto);
		return list;
	}

	@Override
	public void StoryWrite(StoryVo storyVo) {
		storyDao.insertStory(storyVo);
	}

	@Override
	public void StoryUpdate(StoryVo storyVo) {
		storyDao.updateStory(storyVo);
	}

	@Override
	public void StoryDelete(int st_no) {
		storyDao.deleteStory(st_no);
	}

	@Override
	public StoryVo StorySelect(int st_no) {
		StoryVo storyVo = storyDao.selectStory(st_no);
		return storyVo;
	}

	@Override
	public int storyCount(StoryPagingDto storyPagingDto) {
		int count = storyDao.storyCount(storyPagingDto);
		return count;
	}

}
