package com.dp.ggomjirak.my.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.StoryPagingDto;
import com.dp.ggomjirak.vo.StoryVo;

public interface WorkroomService {
	public List<HobbyVo> listHobby(PagingDto pagingDto);
	public int hobbyCount(String hobby_writer);
	public MemberVo getMemInfo(String user_id);
	public List<HobbyVo> searchHobby(PagingDto pagingDto);
	public List<StoryVo> searchStory(PagingDto pagingDto);
	public int searchHobbyCount(PagingDto pagingDto);
	public int searchStoryCount(PagingDto pagingDto);
}
