package com.dp.ggomjirak.my.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

public interface WorkroomService {
	public List<HobbyVo> listHobby(String hobby_writer);
	public MemberVo getMemInfo(String user_id);
}
