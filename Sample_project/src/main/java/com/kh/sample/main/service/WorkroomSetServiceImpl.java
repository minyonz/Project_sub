package com.kh.sample.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sample.main.dao.WorkroomSetDao;
import com.kh.sample.main.vo.WorkroomVo;

@Service
public class WorkroomSetServiceImpl implements WorkroomSetService {

	@Inject
	WorkroomSetDao workroomSetDao;
	
	@Override
	public WorkroomVo getWrSet(String user_id) {
		WorkroomVo workroomVo = workroomSetDao.getWrSet(user_id);
		return workroomVo;
	}

	@Override
	public void updateWrName(WorkroomVo workroomVo) {
		workroomSetDao.updateWrName(workroomVo);
	}

}
