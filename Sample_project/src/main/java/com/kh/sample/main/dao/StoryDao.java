package com.kh.sample.main.dao;

import java.util.List;

import com.kh.sample.main.vo.StoryVo;

public interface StoryDao {
	// 스토리 작성, 리스트, 삭제, 수정, 선택스토리
	public void insertStory(StoryVo storyVo);
	public List<StoryVo> listStory(String user_id);
	public void deleteStory(int st_no);
	public void updateStory(StoryVo storyVo);
	public StoryVo selectStory(int st_no);
	// 댓글 카운트 증가
	public void updateCommentCnt(int st_no, int count);
}
