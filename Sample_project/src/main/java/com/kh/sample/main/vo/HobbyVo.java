package com.kh.sample.main.vo;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HobbyVo {
	//db column
	private int hobby_no;
	private String hobby_title;
	private String hobby_writer;
	private String main_img;
	private String hobby_video;
	private String hobby_intro;
	private int l_cate_no;
	private int m_cate_no;
	private int level_no;
	private int cost_no;
	private int time_no;
	private int view_cnt;
	private int like_cnt;
	private String is_del;
	private Timestamp reg_date;
	private Timestamp mod_date;
	
	private MultipartFile mf_main_img;
	
	// has a
	private List<MakeStepVo> makeSteps;
	private List<HobbyMaterialVo> hobbyMaterials;
	
	//보류
//	private List<CompleteImgVo> completeImgs;
	
	public HobbyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public HobbyVo(String hobby_writer, String hobby_title) {
		super();
		this.hobby_writer = hobby_writer;
		this.hobby_title = hobby_title;
	}


	public HobbyVo(String hobby_writer, String hobby_title, List<MakeStepVo> makeSteps) {
		super();
		this.hobby_writer = hobby_writer;
		this.hobby_title = hobby_title;
		this.makeSteps = makeSteps;
	}



	public HobbyVo(String hobby_writer, String hobby_title, List<MakeStepVo> makeSteps,
			List<HobbyMaterialVo> hobbyMaterials) {
		super();
		this.hobby_writer = hobby_writer;
		this.hobby_title = hobby_title;
		this.makeSteps = makeSteps;
		this.hobbyMaterials = hobbyMaterials;
	}



	public HobbyVo(String hobby_writer, String hobby_title, String main_img, String hobby_intro) {
		super();
		this.hobby_writer = hobby_writer;
		this.hobby_title = hobby_title;
		this.main_img = main_img;
		this.hobby_intro = hobby_intro;
	}



	public int getHobby_no() {
		return hobby_no;
	}



	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}



	public String getHobby_title() {
		return hobby_title;
	}



	public void setHobby_title(String hobby_title) {
		this.hobby_title = hobby_title;
	}



	public String getHobby_writer() {
		return hobby_writer;
	}



	public void setHobby_writer(String hobby_writer) {
		this.hobby_writer = hobby_writer;
	}



	public String getMain_img() {
		return main_img;
	}



	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}



	public String getHobby_video() {
		return hobby_video;
	}



	public void setHobby_video(String hobby_video) {
		this.hobby_video = hobby_video;
	}



	public String getHobby_intro() {
		return hobby_intro;
	}



	public void setHobby_intro(String hobby_intro) {
		this.hobby_intro = hobby_intro;
	}



	public MultipartFile getMf_main_img() {
		return mf_main_img;
	}



	public void setMf_main_img(MultipartFile mf_main_img) {
		this.mf_main_img = mf_main_img;
	}



	public List<MakeStepVo> getMakeSteps() {
		return makeSteps;
	}



	public void setMakeSteps(List<MakeStepVo> makeSteps) {
		this.makeSteps = makeSteps;
	}



	public List<HobbyMaterialVo> getHobbyMaterials() {
		return hobbyMaterials;
	}



	public void setHobbyMaterials(List<HobbyMaterialVo> hobbyMaterials) {
		this.hobbyMaterials = hobbyMaterials;
	}


//
//	public List<CompleteImgVo> getCompleteImgs() {
//		return completeImgs;
//	}
//
//
//
//	public void setCompleteImgs(List<CompleteImgVo> completeImgs) {
//		this.completeImgs = completeImgs;
//	}



	public int getL_cate_no() {
		return l_cate_no;
	}



	public void setL_cate_no(int l_cate_no) {
		this.l_cate_no = l_cate_no;
	}



	public int getM_cate_no() {
		return m_cate_no;
	}



	public void setM_cate_no(int m_cate_no) {
		this.m_cate_no = m_cate_no;
	}



	public int getLevel_no() {
		return level_no;
	}



	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}



	public int getCost_no() {
		return cost_no;
	}



	public void setCost_no(int cost_no) {
		this.cost_no = cost_no;
	}



	public int getTime_no() {
		return time_no;
	}



	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	

	public int getView_cnt() {
		return view_cnt;
	}



	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}



	public int getLike_cnt() {
		return like_cnt;
	}



	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}



	public String getIs_del() {
		return is_del;
	}



	public void setIs_delete(String is_del) {
		this.is_del = is_del;
	}



	public Timestamp getReg_date() {
		return reg_date;
	}



	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}



	public Timestamp getMod_date() {
		return mod_date;
	}



	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}



	@Override
	public String toString() {
		return "HobbyVo [hobby_no=" + hobby_no + ", hobby_title=" + hobby_title + ", hobby_writer=" + hobby_writer
				+ ", main_img=" + main_img + ", hobby_video=" + hobby_video + ", hobby_intro=" + hobby_intro
				+ ", l_cate_no=" + l_cate_no + ", m_cate_no=" + m_cate_no + ", level_no=" + level_no + ", cost_no="
				+ cost_no + ", time_no=" + time_no + ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt
				+ ", is_del=" + is_del + ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", mf_main_img="
				+ mf_main_img + ", makeSteps=" + makeSteps + ", hobbyMaterials="
				+ hobbyMaterials/*
								 * + ", completeImgs=" + completeImgs + "]"
								 */;
	}

	
}
