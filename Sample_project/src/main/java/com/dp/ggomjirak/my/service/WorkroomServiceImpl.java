package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.my.dao.WorkRoomDao;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

@Service
public class WorkroomServiceImpl implements WorkroomService {

	@Inject
	WorkRoomDao workroomDao;

	@Override
	public List<HobbyVo> listHobby(String hobby_writer) {
		List<HobbyVo> list = workroomDao.listHobby(hobby_writer);
		return list;
	}

	@Override
	public MemberVo getMemInfo(String user_id) {
		MemberVo memberVo = workroomDao.getMemInfo(user_id);
//		System.out.println("service:" + memberVo);
		return memberVo;
	}

}
