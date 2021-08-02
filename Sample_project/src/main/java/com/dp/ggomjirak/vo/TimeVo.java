package com.dp.ggomjirak.vo;

public class TimeVo {
	private int time_no;
	private String time_name;
	public TimeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TimeVo(int time_no, String time_name) {
		super();
		this.time_no = time_no;
		this.time_name = time_name;
	}
	public int getTime_no() {
		return time_no;
	}
	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}
	public String getTime_name() {
		return time_name;
	}
	public void setTime_name(String time_name) {
		this.time_name = time_name;
	}
	@Override
	public String toString() {
		return "TimeVo [time_no=" + time_no + ", time_name=" + time_name + "]";
	}
	
	
}
