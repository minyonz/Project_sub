package com.dp.ggomjirak.my.service;

import com.dp.ggomjirak.vo.WorkroomVo;

public interface WorkroomSetService {
	public WorkroomVo getWrSet(String user_id);
	public void updateWrName(WorkroomVo workroomVo);
	public void updateWrIntro(String user_id, String wr_intro);
}
