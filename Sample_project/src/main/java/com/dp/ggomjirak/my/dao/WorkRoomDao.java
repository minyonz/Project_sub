package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.StoryPagingDto;
import com.dp.ggomjirak.vo.StoryVo;

public interface WorkRoomDao {
	// 취미 리스트
	public List<HobbyVo> listHobby(PagingDto pagingDto);
	// 취미 총 갯수
	public int hobbyCount(String hobby_writer);
	// 프로필카드용 유저정보
	public MemberVo getMemInfo(String user_id);
	// 취미, 스토리 검색
	public List<HobbyVo> searchHobby(PagingDto pagingDto);
	public List<StoryVo> searchStory(PagingDto pagingDto);
}
