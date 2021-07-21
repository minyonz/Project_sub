package com.kh.sample.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sample.main.dao.WorkRoomDao;
import com.kh.sample.main.vo.HobbyVo;

@Service
public class WorkroomServiceImpl implements WorkroomService {

	@Inject
	WorkRoomDao workroomDao;

	@Override
	public List<HobbyVo> listHobby(String hobby_writer) {
		List<HobbyVo> list = workroomDao.listHobby(hobby_writer);
		return list;
	}

}
