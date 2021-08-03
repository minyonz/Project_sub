package com.dp.ggomjirak.vo;

import java.util.List;

public class MaterialVo {
	private int material_no;
	private String material_name;
	private List<HobbyMaterialVo> hobbyMaterials;

	
	public MaterialVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MaterialVo(String material_name) {
		super();
		this.material_name = material_name;
	}
	

	public MaterialVo(String material_name, List<HobbyMaterialVo> hobbyMaterials) {
		super();
		this.material_name = material_name;
		this.hobbyMaterials = hobbyMaterials;
	}


	public int getMaterial_no() {
		return material_no;
	}


	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}


	public String getMaterial_name() {
		return material_name;
	}


	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	
	public List<HobbyMaterialVo> getHobbyMaterials() {
		return hobbyMaterials;
	}


	public void setHobbyMaterials(List<HobbyMaterialVo> hobbyMaterials) {
		this.hobbyMaterials = hobbyMaterials;
	}


	@Override
	public String toString() {
		return "MaterialVo [material_no=" + material_no + ", material_name=" + material_name + ", hobbyMaterials="
				+ hobbyMaterials + "]";
	}

	
}
