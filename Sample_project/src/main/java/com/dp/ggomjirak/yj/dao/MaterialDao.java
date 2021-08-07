package com.dp.ggomjirak.yj.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;

public interface MaterialDao {
	

	public void insertMaterial(String materialName);
	
	public MaterialVo getMaterialVo (String material_name);
	public MaterialVo getMaterialVoByNo (int material_no);
	
	public int getMaterialNo (String materialName);
	
//	 __________준비물로 목록조회 ___________
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch);
	
	public int getCountHMList(MaterialSearch materialSearch);
}
