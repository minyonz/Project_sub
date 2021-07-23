package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

public interface WorkRoomDao {
	// 취미 리스트
	public List<HobbyVo> listHobby(String hobby_writer);
	// 프로필카드용 유저정보
	public MemberVo getMemInfo(String user_id);
}
