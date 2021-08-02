package com.dp.ggomjirak.vo;

public class CostVo {
	private int cost_no;
	private String cost_name;
	public CostVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CostVo(int cost_no, String cost_name) {
		super();
		this.cost_no = cost_no;
		this.cost_name = cost_name;
	}
	public int getCost_no() {
		return cost_no;
	}
	public void setCost_no(int cost_no) {
		this.cost_no = cost_no;
	}
	public String getCost_name() {
		return cost_name;
	}
	public void setCost_name(String cost_name) {
		this.cost_name = cost_name;
	}
	@Override
	public String toString() {
		return "CostVo [cost_no=" + cost_no + ", cost_name=" + cost_name + "]";
	}
	
	
}
