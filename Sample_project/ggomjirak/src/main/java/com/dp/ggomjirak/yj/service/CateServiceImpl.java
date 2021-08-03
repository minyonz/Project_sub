package com.dp.ggomjirak.yj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.TimeVo;
import com.dp.ggomjirak.yj.dao.CateDao;

@Service
public class CateServiceImpl implements CateService {
	
	@Inject
	@Qualifier("yj.CateDaoImpl")
	private CateDao cateDao;
	
	@Override
	public List<CateVo> getCateList() {
		return cateDao.getCateList();
	}

	@Override
	public List<TimeVo> getTimeList() {
		return cateDao.getTimeList();
	}

	@Override
	public List<LevelVo> getLevelList() {
		return cateDao.getLevelList();
	}

	@Override
	public List<CostVo> getCostList() {
		return cateDao.getCostList();
	}

}
