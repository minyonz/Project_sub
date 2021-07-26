package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.my.dao.WorkRoomDao;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

@Service
public class WorkroomServiceImpl implements WorkroomService {

	@Inject
	WorkRoomDao workroomDao;

	@Override
	public List<HobbyVo> listHobby(PagingDto pagingDto) {
		List<HobbyVo> list = workroomDao.listHobby(pagingDto);
		return list;
	}

	@Override
	public int hobbyCount(String hobby_writer) {
		int count = workroomDao.hobbyCount(hobby_writer);
		return count;
	}
	
	@Override
	public MemberVo getMemInfo(String user_id) {
		MemberVo memberVo = workroomDao.getMemInfo(user_id);
//		System.out.println("service:" + memberVo);
		return memberVo;
	}


}
