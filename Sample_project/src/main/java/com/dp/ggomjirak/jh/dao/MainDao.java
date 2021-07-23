package com.dp.ggomjirak.jh.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;

public interface MainDao {

	public List<HobbyVo> getPopularHobbyList();
	public List<HobbyVo> getMonthHobbyList();
}
