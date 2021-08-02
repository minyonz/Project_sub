package com.dp.ggomjirak.vo;

public class HobbyMaterialVo {
	//db column
	private int hm_no;
	private int hobby_no;
	private int material_no;
	private String material_detail;
	private int seq;
	private String is_del;
	
	//not db column
	private String materialName;
	
	public HobbyMaterialVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public HobbyMaterialVo(String material_detail, int seq, String materialName) {
		super();
		this.material_detail = material_detail;
		this.seq = seq;
		this.materialName = materialName;
	}


	public HobbyMaterialVo(int hobby_no, String materialName, String material_detail, int seq) {
		super();
		this.hobby_no = hobby_no;
		this.materialName = materialName;
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
	
	

	public int getHm_no() {
		return hm_no;
	}


	public void setHm_no(int hm_no) {
		this.hm_no = hm_no;
	}


	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}


	public String getIs_del() {
		return is_del;
	}


	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}


	@Override
	public String toString() {
		return "HobbyMaterialVo [hm_no=" + hm_no + ", hobby_no=" + hobby_no + ", material_no=" + material_no
				+ ", material_detail=" + material_detail + ", seq=" + seq + ", is_del=" + is_del + ", materialName="
				+ materialName + "]";
	}




	
}
