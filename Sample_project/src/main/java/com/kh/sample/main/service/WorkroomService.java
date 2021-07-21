package com.kh.sample.main.service;

import java.util.List;

import com.kh.sample.main.vo.HobbyVo;

public interface WorkroomService {
	public List<HobbyVo> listHobby(String hobby_writer);
}
