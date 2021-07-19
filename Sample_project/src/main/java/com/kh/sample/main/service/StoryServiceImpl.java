package com.kh.sample.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sample.main.dao.StoryDao;
import com.kh.sample.main.vo.StoryVo;

@Service
public class StoryServiceImpl implements StoryService{

	@Inject
	StoryDao storyDao;
	
	@Override
	public List<StoryVo> StoryList() {
		List<StoryVo> list = storyDao.listStory();
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

}
