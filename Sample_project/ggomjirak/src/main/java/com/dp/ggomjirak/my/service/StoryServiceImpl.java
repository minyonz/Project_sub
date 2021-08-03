package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public boolean like(int st_no, String user_id) {
		int count = storyDao.likeCheck(st_no, user_id);
		if (count <= 0) {
			storyDao.insertLike(st_no, user_id);
			storyDao.updateLikeCount(st_no, 1);
			return true;
		} else if (count > 0){
			storyDao.deleteLike(st_no, user_id);
			storyDao.updateLikeCount(st_no, -1);
		}
		return false;
	}

	@Override
	public int likeAll(int st_no) {
		int likeCount = storyDao.likeAll(st_no);
//		System.out.println("service count:" + likeCount);
		return likeCount;
	}

	@Override
	public int likeCheck(int st_no, String user_id) {
		int count = storyDao.likeCheck(st_no, user_id);
		return count;
	}

}
