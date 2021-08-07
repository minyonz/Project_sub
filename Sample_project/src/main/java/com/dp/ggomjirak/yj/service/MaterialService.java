package com.dp.ggomjirak.yj.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;

public interface MaterialService {
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch);

}
