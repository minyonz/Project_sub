package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class ManagerVo {

	private int m_no;
	private String user_id;
	private String user_name;
	private String m_autority;
	private String m_nik;
	private Timestamp m_reg_date;
	
	
	public ManagerVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ManagerVo(int m_no, String user_id, String user_name, String m_autority, String m_nik,
			Timestamp m_reg_date) {
		super();
		this.m_no = m_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.m_autority = m_autority;
		this.m_nik = m_nik;
		this.m_reg_date = m_reg_date;
	}


	public int getM_no() {
		return m_no;
	}


	public void setM_no(int m_no) {
		this.m_no = m_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getM_autority() {
		return m_autority;
	}


	public void setM_autority(String m_autority) {
		this.m_autority = m_autority;
	}


	public String getM_nik() {
		return m_nik;
	}


	public void setM_nik(String m_nik) {
		this.m_nik = m_nik;
	}


	public Timestamp getM_reg_date() {
		return m_reg_date;
	}


	public void setM_reg_date(Timestamp m_reg_date) {
		this.m_reg_date = m_reg_date;
	}


	@Override
	public String toString() {
		return "ManagerVo [m_no=" + m_no + ", user_id=" + user_id + ", user_name=" + user_name + ", m_autority="
				+ m_autority + ", m_nik=" + m_nik + ", m_reg_date=" + m_reg_date + "]";
	}
	
}
