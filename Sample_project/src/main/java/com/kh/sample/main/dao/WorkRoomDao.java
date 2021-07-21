package com.kh.sample.main.dao;

import java.util.List;

import com.kh.sample.main.vo.HobbyVo;

public interface WorkRoomDao {
	// 취미 리스트
	public List<HobbyVo> listHobby(String hobby_writer);
}
