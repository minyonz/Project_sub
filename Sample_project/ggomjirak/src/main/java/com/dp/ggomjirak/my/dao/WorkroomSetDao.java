package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.FollowVo;
import com.dp.ggomjirak.vo.WorkroomVo;

public interface WorkroomSetDao {
	public WorkroomVo getWrSet(String user_id);
	// 작업실 이름 설정
	public void updateWrName(WorkroomVo workroomVo);
	// 작업실 소개 설정
	public void updateWrIntro(String user_id, String wr_intro);
	// 팔로잉 목록
	public List<FollowVo> followingList(String follower);
}
