package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class QnAVo {
	
	// 1:1 문의 유형
	private String qna_sort_cd;
	private String qna_type_nm;

	// 1:1 문의 게시판 내용
	private int qna_no;
	private int a_no;
	private char qna_type; 
	private String title;
	private String content;
	private String user_id;
	private char is_del;
	
	private String save_time;
	private String update_time;
	private String delete_time;
	
	private String input_name;
	private String input_tel;
	private String input_email;
	private String is_email_receive;
	
	// 질문 저장 시간
	private String q_save_time;
	
	// 답변 상태
	private String a_state;
	
	// 관리자 답변 내용
	private int a_qna_no;
	private String a_title;
	private String a_content;
	private String a_save_time;
	private String m_user_id;
	private String m_nik;
	
	
	public QnAVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public QnAVo(String qna_sort_cd, String qna_type_nm, int qna_no, int a_no, char qna_type, String title,
			String content, String user_id, char is_del, String save_time, String update_time, String delete_time,
			String input_name, String input_tel, String input_email, String is_email_receive, String q_save_time,
			String a_state, int a_qna_no, String a_title, String a_content, String a_save_time, String m_user_id,
			String m_nik) {
		super();
		this.qna_sort_cd = qna_sort_cd;
		this.qna_type_nm = qna_type_nm;
		this.qna_no = qna_no;
		this.a_no = a_no;
		this.qna_type = qna_type;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.is_del = is_del;
		this.save_time = save_time;
		this.update_time = update_time;
		this.delete_time = delete_time;
		this.input_name = input_name;
		this.input_tel = input_tel;
		this.input_email = input_email;
		this.is_email_receive = is_email_receive;
		this.q_save_time = q_save_time;
		this.a_state = a_state;
		this.a_qna_no = a_qna_no;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_save_time = a_save_time;
		this.m_user_id = m_user_id;
		this.m_nik = m_nik;
	}


	public String getQna_sort_cd() {
		return qna_sort_cd;
	}


	public void setQna_sort_cd(String qna_sort_cd) {
		this.qna_sort_cd = qna_sort_cd;
	}


	public String getQna_type_nm() {
		return qna_type_nm;
	}


	public void setQna_type_nm(String qna_type_nm) {
		this.qna_type_nm = qna_type_nm;
	}


	public int getQna_no() {
		return qna_no;
	}


	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}


	public int getA_no() {
		return a_no;
	}


	public void setA_no(int a_no) {
		this.a_no = a_no;
	}


	public char getQna_type() {
		return qna_type;
	}


	public void setQna_type(char qna_type) {
		this.qna_type = qna_type;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public char getIs_del() {
		return is_del;
	}


	public void setIs_del(char is_del) {
		this.is_del = is_del;
	}


	public String getSave_time() {
		return save_time;
	}


	public void setSave_time(String save_time) {
		this.save_time = save_time;
	}


	public String getUpdate_time() {
		return update_time;
	}


	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}


	public String getDelete_time() {
		return delete_time;
	}


	public void setDelete_time(String delete_time) {
		this.delete_time = delete_time;
	}


	public String getInput_name() {
		return input_name;
	}


	public void setInput_name(String input_name) {
		this.input_name = input_name;
	}


	public String getInput_tel() {
		return input_tel;
	}


	public void setInput_tel(String input_tel) {
		this.input_tel = input_tel;
	}


	public String getInput_email() {
		return input_email;
	}


	public void setInput_email(String input_email) {
		this.input_email = input_email;
	}


	public String getIs_email_receive() {
		return is_email_receive;
	}


	public void setIs_email_receive(String is_email_receive) {
		this.is_email_receive = is_email_receive;
	}


	public String getQ_save_time() {
		return q_save_time;
	}


	public void setQ_save_time(String q_save_time) {
		this.q_save_time = q_save_time;
	}


	public String getA_state() {
		return a_state;
	}


	public void setA_state(String a_state) {
		this.a_state = a_state;
	}


	public int getA_qna_no() {
		return a_qna_no;
	}


	public void setA_qna_no(int a_qna_no) {
		this.a_qna_no = a_qna_no;
	}


	public String getA_title() {
		return a_title;
	}


	public void setA_title(String a_title) {
		this.a_title = a_title;
	}


	public String getA_content() {
		return a_content;
	}


	public void setA_content(String a_content) {
		this.a_content = a_content;
	}


	public String getA_save_time() {
		return a_save_time;
	}


	public void setA_save_time(String a_save_time) {
		this.a_save_time = a_save_time;
	}


	public String getM_user_id() {
		return m_user_id;
	}


	public void setM_user_id(String m_user_id) {
		this.m_user_id = m_user_id;
	}


	public String getM_nik() {
		return m_nik;
	}


	public void setM_nik(String m_nik) {
		this.m_nik = m_nik;
	}


	@Override
	public String toString() {
		return "QnAVo [qna_sort_cd=" + qna_sort_cd + ", qna_type_nm=" + qna_type_nm + ", qna_no=" + qna_no + ", a_no="
				+ a_no + ", qna_type=" + qna_type + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", is_del=" + is_del + ", save_time=" + save_time + ", update_time=" + update_time + ", delete_time="
				+ delete_time + ", input_name=" + input_name + ", input_tel=" + input_tel + ", input_email="
				+ input_email + ", is_email_receive=" + is_email_receive + ", q_save_time=" + q_save_time + ", a_state="
				+ a_state + ", a_qna_no=" + a_qna_no + ", a_title=" + a_title + ", a_content=" + a_content
				+ ", a_save_time=" + a_save_time + ", m_user_id=" + m_user_id + ", m_nik=" + m_nik + "]";
	}


}