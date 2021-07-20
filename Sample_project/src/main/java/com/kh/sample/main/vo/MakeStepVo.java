package com.kh.sample.main.vo;

import org.springframework.web.multipart.MultipartFile;

public class MakeStepVo {
	private int hobby_no;
	private int make_step_num;
	private String make_step_text;
	private String make_step_img;
	
	private MultipartFile mf;
	
	public MakeStepVo() {
		// TODO Auto-generated constructor stub
	}

	public MakeStepVo(int hobby_no, int make_step_num, String make_step_text, String make_step_img) {
		super();
		this.hobby_no = hobby_no;
		this.make_step_num = make_step_num;
		this.make_step_text = make_step_text;
		this.make_step_img = make_step_img;
	}

	public int getHobby_no() {
		return hobby_no;
	}

	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}

	public int getMake_step_num() {
		return make_step_num;
	}

	public void setMake_step_num(int make_step_num) {
		this.make_step_num = make_step_num;
	}

	public String getMake_step_text() {
		return make_step_text;
	}

	public void setMake_step_text(String make_step_text) {
		this.make_step_text = make_step_text;
	}

	public String getMake_step_img() {
		return make_step_img;
	}

	public void setMake_step_img(String make_step_img) {
		this.make_step_img = make_step_img;
	}
	

	public MultipartFile getMf() {
		return mf;
	}

	public void setMf(MultipartFile mf) {
		this.mf = mf;
	}

	@Override
	public String toString() {
		return "MakeStepVo [hobby_no=" + hobby_no + ", make_step_num=" + make_step_num + ", make_step_text="
				+ make_step_text + ", make_step_img=" + make_step_img + ", mf=" + mf + "]";
	}


 
}