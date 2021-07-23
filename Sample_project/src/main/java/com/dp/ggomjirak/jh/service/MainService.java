package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;

public interface MainService {
	
	public List<HobbyVo> getPopularHobbyList();
	public List<HobbyVo> getMonthHobbyList();

}
