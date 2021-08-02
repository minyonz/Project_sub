package com.dp.ggomjirak.yj.service;

import java.util.List;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.TimeVo;

public interface CateService {
	public List<CateVo> getCateList();
	public List<TimeVo> getTimeList();
	public List<LevelVo> getLevelList();
	public List<CostVo> getCostList();
}
