package com.dp.ggomjirak.yj.dao;

import java.util.List;

import com.dp.ggomjirak.vo.MaterialVo;

public interface MaterialDao {
	

	/**
	 * @param materialVo
	 */
	public void insertMaterial2(List<MaterialVo> materialVos);
	
	public void insertMaterial(String materialName);
	
	public MaterialVo getMaterialVo (String material_name);
	
	public int getMaterialNo (String materialName);
}
