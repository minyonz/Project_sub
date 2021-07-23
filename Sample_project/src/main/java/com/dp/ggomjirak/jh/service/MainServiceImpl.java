package com.dp.ggomjirak.jh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.jh.dao.MainDao;
import com.dp.ggomjirak.vo.HobbyVo;

@Service
public class MainServiceImpl implements MainService {
	
	@Inject
	private MainDao mainDao;

	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = mainDao.getPopularHobbyList();
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = mainDao.getMonthHobbyList();
		return list;
	}

}
