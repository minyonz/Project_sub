package com.dp.ggomjirak.vo;

public class HobbyMaterialVo {
	//db column
	private int hobby_no;
	private int material_no;
	private String material_detail;
	private int seq;
	
	//not db column
	private String materialName;
	
	public HobbyMaterialVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HobbyMaterialVo(int hobby_no, int material_no, String material_detail, int seq) {
		super();
		this.hobby_no = hobby_no;
		this.material_no = material_no;
		this.material_detail = material_detail;
		this.seq = seq;
	}

	public int getHobby_no() {
		return hobby_no;
	}

	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public String getMaterial_detail() {
		return material_detail;
	}

	public void setMaterial_detail(String material_detail) {
		this.material_detail = material_detail;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "HobbyMaterialVo [hobby_no=" + hobby_no + ", material_no=" + material_no + ", material_detail="
				+ material_detail + ", seq=" + seq + ", materialName=" + materialName + "]";
	}

	
}