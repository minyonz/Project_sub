package com.dp.ggomjirak.vo;

public class CommentVo {
	private int c_no;
	private String user_id;
	private int h_no;
	private int re_group;
	private int parent_c_no;
	private String c_content;
	private int c_depth;
	private String is_del;
	private String reg_date;
	private String mod_date;
	private String del_date;
	
	//not db column
	private String user_nick;
	private String user_img;
	private String parent_user_id;
	private String parent_user_nick;
	
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CommentVo(String user_id, int h_no, String c_content) {
		super();
		this.user_id = user_id;
		this.h_no = h_no;
		this.c_content = c_content;
	}
	


	public CommentVo(String user_id, int h_no, int re_group, int parent_c_no, String c_content) {
		super();
		this.user_id = user_id;
		this.h_no = h_no;
		this.re_group = re_group;
		this.parent_c_no = parent_c_no;
		this.c_content = c_content;
	}



	public CommentVo(String user_id, int h_no, int parent_c_no, String c_content) {
		super();
		this.user_id = user_id;
		this.h_no = h_no;
		this.parent_c_no = parent_c_no;
		this.c_content = c_content;
	}



	public int getC_no() {
		return c_no;
	}



	public void setC_no(int c_no) {
		this.c_no = c_no;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public int getH_no() {
		return h_no;
	}



	public void setH_no(int h_no) {
		this.h_no = h_no;
	}



	public int getRe_group() {
		return re_group;
	}



	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}



	public int getParent_c_no() {
		return parent_c_no;
	}



	public void setParent_c_no(int parent_c_no) {
		this.parent_c_no = parent_c_no;
	}



	public String getC_content() {
		return c_content;
	}



	public void setC_content(String c_content) {
		this.c_content = c_content;
	}



	public int getC_depth() {
		return c_depth;
	}



	public void setC_depth(int c_depth) {
		this.c_depth = c_depth;
	}



	public String getIs_del() {
		return is_del;
	}



	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}



	public String getReg_date() {
		return reg_date;
	}



	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}



	public String getMod_date() {
		return mod_date;
	}



	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}



	public String getDel_date() {
		return del_date;
	}



	public void setDel_date(String del_date) {
		this.del_date = del_date;
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



	public String getParent_user_id() {
		return parent_user_id;
	}



	public void setParent_user_id(String parent_user_id) {
		this.parent_user_id = parent_user_id;
	}



	public String getParent_user_nick() {
		return parent_user_nick;
	}



	public void setParent_user_nick(String parent_user_nick) {
		this.parent_user_nick = parent_user_nick;
	}



	@Override
	public String toString() {
		return "CommentVo [c_no=" + c_no + ", user_id=" + user_id + ", h_no=" + h_no + ", re_group=" + re_group
				+ ", parent_c_no=" + parent_c_no + ", c_content=" + c_content + ", c_depth=" + c_depth + ", is_del="
				+ is_del + ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", del_date=" + del_date
				+ ", user_nick=" + user_nick + ", user_img=" + user_img + ", parent_user_id=" + parent_user_id
				+ ", parent_user_nick=" + parent_user_nick + "]";
	}




	
	
}
