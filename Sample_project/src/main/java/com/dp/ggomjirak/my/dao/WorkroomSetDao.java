package com.dp.ggomjirak.my.dao;

import com.dp.ggomjirak.vo.WorkroomVo;

public interface WorkroomSetDao {
	public WorkroomVo getWrSet(String user_id);
	// 작업실 이름 설정
	public void updateWrName(WorkroomVo workroomVo);
	// 작업실 소개 설정
	public void updateWrIntro(String user_id, String wr_intro);
}
