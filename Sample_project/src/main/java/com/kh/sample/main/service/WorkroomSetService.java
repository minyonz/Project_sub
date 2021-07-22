package com.kh.sample.main.service;

import com.kh.sample.main.vo.WorkroomVo;

public interface WorkroomSetService {
	public WorkroomVo getWrSet(String user_id);
	public void updateWrName(WorkroomVo workroomVo);
}
