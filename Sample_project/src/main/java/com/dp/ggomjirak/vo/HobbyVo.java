package com.dp.ggomjirak.vo;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HobbyVo {
	//db column
	private int hobby_no;
	private String hobby_title;
	private String user_id;
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
	private Timestamp del_date;
	
	// has a
	private List<MakeStepVo> makeSteps;
	private List<HobbyMaterialVo> hobbyMaterials;
	private List<CompleteImgVo> completeImgs;
	
	// not db column
	private String l_cate_name;
	private String m_cate_name;
	private String level_name;
	private String cost_name;
	private String time_name;
	private String user_nick;
	private String user_img;
	
	// 나중에 합치고나서...
	private int workroom;
	
	
	public HobbyVo() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public void setIs_del(String is_del) {
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

	public Timestamp getDel_date() {
		return del_date;
	}

	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
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

	public List<CompleteImgVo> getCompleteImgs() {
		return completeImgs;
	}

	public void setCompleteImgs(List<CompleteImgVo> completeImgs) {
		this.completeImgs = completeImgs;
	}

	public String getL_cate_name() {
		return l_cate_name;
	}

	public void setL_cate_name(String l_cate_name) {
		this.l_cate_name = l_cate_name;
	}

	public String getM_cate_name() {
		return m_cate_name;
	}

	public void setM_cate_name(String m_cate_name) {
		this.m_cate_name = m_cate_name;
	}

	public String getLevel_name() {
		return level_name;
	}

	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}

	public String getCost_name() {
		return cost_name;
	}

	public void setCost_name(String cost_name) {
		this.cost_name = cost_name;
	}

	public String getTime_name() {
		return time_name;
	}

	public void setTime_name(String time_name) {
		this.time_name = time_name;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public int getWorkroom() {
		return workroom;
	}

	public void setWorkroom(int workroom) {
		this.workroom = workroom;
	}

	@Override
	public String toString() {
		return "HobbyVo [hobby_no=" + hobby_no + ", hobby_title=" + hobby_title + ", user_id=" + user_id + ", main_img="
				+ main_img + ", hobby_video=" + hobby_video + ", hobby_intro=" + hobby_intro + ", l_cate_no="
				+ l_cate_no + ", m_cate_no=" + m_cate_no + ", level_no=" + level_no + ", cost_no=" + cost_no
				+ ", time_no=" + time_no + ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt + ", is_del=" + is_del
				+ ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", del_date=" + del_date + ", makeSteps="
				+ makeSteps + ", hobbyMaterials=" + hobbyMaterials + ", completeImgs=" + completeImgs + ", l_cate_name="
				+ l_cate_name + ", m_cate_name=" + m_cate_name + ", level_name=" + level_name + ", cost_name="
				+ cost_name + ", time_name=" + time_name + ", user_nick=" + user_nick + ", user_img=" + user_img
				+ ", workroom=" + workroom + "]";
	}







	










	

	
	
}
